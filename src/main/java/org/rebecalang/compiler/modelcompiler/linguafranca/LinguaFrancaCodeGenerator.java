package org.rebecalang.compiler.modelcompiler.linguafranca;

import org.rebecalang.compiler.modelcompiler.corerebeca.objectmodel.*;
import org.rebecalang.compiler.modelcompiler.timedrebeca.objectmodel.TimedRebecaParentSuffixPrimary;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.util.*;
import java.util.stream.Collectors;

/**
 * Generates Lingua Franca code from a Rebeca (or Timed Rebeca) model.
 */
public class LinguaFrancaCodeGenerator {

    /** The entire Rebeca model. */
    private final RebecaModel rebecaModel;

    /** A list of all reactive classes in the model. */
    private List<ReactiveClassDeclaration> classes;

    /* ----------------------------------------------------------------------
     * Nested Data Classes
     * ----------------------------------------------------------------------
     */

    /** Represents constructor-related information for a reactive class. */
    private static class ConstructorInfo {
        List<ConstructorParam> params = new ArrayList<>();
        List<StateVar> regularStateVars = new ArrayList<>();
        Map<String, List<FormalParameterDeclaration>> msgsrvToParams = new HashMap<>();
        Map<String, List<FormalParameterDeclaration>> externalMsgsrvsToParams = new HashMap<>();
    }

    /** Defines a constructor parameter and its corresponding state variable. */
    private static class ConstructorParam {
        String paramName;
        String stateVarName;
        String type;
        String defaultValue;
    }

    /** Represents a normal (non-constructor) state variable. */
    private static class StateVar {
        String name;
        String type;
    }

    /**
     * A call to a message server method, either internal (self.msgSrv(...))
     * or external (knownRebec.msgSrv(...)).
     */
    private static class CallDetail {
        final String msgName;
        final boolean isInternal;
        final String externalTargetInstance;
        String callerMsgsrvName;
        List<Expression> arguments = new ArrayList<>();
        String calleeClass;
        String afterDelayMs;

        CallDetail(String msgName, boolean isInternal, String externalTargetInstance) {
            this.msgName = msgName;
            this.isInternal = isInternal;
            this.externalTargetInstance = externalTargetInstance;
        }
    }

    /** Holds lines of code for a reaction body, plus sets of actions/ports used. */
    private static class ReactionContent {
        String code = "";
        Set<String> scheduledActions = new LinkedHashSet<>();
        Set<String> usedPorts = new LinkedHashSet<>();
    }

    /**
     * Constructs a code generator for a given Rebeca model.
     *
     * @param rebecaModel The input Rebeca model.
     */
    public LinguaFrancaCodeGenerator(RebecaModel rebecaModel) {
        this.rebecaModel = rebecaModel;
    }

    /* ----------------------------------------------------------------------
     * Public Entry Method
     * ----------------------------------------------------------------------
     */

    /**
     * Main method for generating the Lingua Franca code and writing it to a file.
     *
     * @param outputPath The path of the output .lf file.
     */
    public void generateCode(String outputPath) {
        StringBuilder lfCode = new StringBuilder();
        lfCode.append("target Cpp;\n\n");

        // 1) Gather classes
        classes = rebecaModel.getRebecaCode().getReactiveClassDeclaration();

        // 2) Build constructor info
        Map<String, ConstructorInfo> constructorInfoMap = new HashMap<>();
        for (ReactiveClassDeclaration rc : classes) {
            ConstructorInfo cInfo = buildConstructorInfo(rc);
            constructorInfoMap.put(rc.getName(), cInfo);
        }

        // 3) Classify which msgSrvs are internal vs external
        Map<String, Set<String>> internalMsgsrvs = findInternalMsgServers(constructorInfoMap);

        // 4) Build instance->class map and known rebec info
        Map<String, String> instanceToClass = buildInstanceToClassMap();
        Map<String, List<String>> classToKnownRebecs = buildClassToKnownRebecsMap();
        Map<String, List<String>> instanceKnownRebecs = buildInstanceKnownRebecsMap(instanceToClass);

        // 5) Analyze all calls
        Map<String, List<CallDetail>> callsByInstance = new HashMap<>();
        for (String inst : instanceToClass.keySet()) {
            callsByInstance.put(inst, new ArrayList<>());
        }
        analyzeAllCalls(instanceToClass, callsByInstance, classToKnownRebecs, instanceKnownRebecs);

        // 6) Generate struct definitions for external calls
        lfCode.append("public preamble {=\n");
        for (ReactiveClassDeclaration rc : classes) {
            String className = rc.getName();
            ConstructorInfo cInfo = constructorInfoMap.get(className);
            for (String msgsrvName : cInfo.msgsrvToParams.keySet()) {
                if (msgsrvName.startsWith("constructorOf")) {
                    continue;
                }
                boolean isUsedExternally = isMsgsrvExternallyUsed(msgsrvName, className, callsByInstance, instanceToClass);
                if (isUsedExternally) {
                    List<FormalParameterDeclaration> params = cInfo.msgsrvToParams.get(msgsrvName);
                    lfCode.append("    struct ")
                            .append(className).append("_").append(msgsrvName)
                            .append(" {\n");
                    if (params.isEmpty()) {
                        lfCode.append("        int default_arg;\n");
                    } else {
                        for (FormalParameterDeclaration p : params) {
                            lfCode.append("        ")
                                    .append(mapRebecaTypeToLF(p.getType().getTypeName()))
                                    .append(" ")
                                    .append(p.getName())
                                    .append(";\n");
                        }
                    }
                    lfCode.append("    };\n");
                }
            }
        }
        lfCode.append("=}\n\n");

        // 7) Generate one reactor per Rebeca class
        for (ReactiveClassDeclaration rc : classes) {
            String className = rc.getName();
            ConstructorInfo cInfo = constructorInfoMap.get(className);

            lfCode.append("reactor ").append(className);

            // If constructor has parameters => make them reactor parameters
            if (!cInfo.params.isEmpty()) {
                lfCode.append("(");
                for (int i = 0; i < cInfo.params.size(); i++) {
                    if (i > 0) lfCode.append(", ");
                    ConstructorParam cp = cInfo.params.get(i);
                    lfCode.append(cp.stateVarName)
                            .append(": ")
                            .append(cp.type)
                            .append(" = ")
                            .append(cp.defaultValue);
                }
                lfCode.append(")");
            }
            lfCode.append(" {\n");

            // A) Create I/O ports for external calls
            Set<String> declaredPorts = new LinkedHashSet<>();

            // (a) Outputs: calls made by any instance of this class
            for (Map.Entry<String, List<CallDetail>> entry : callsByInstance.entrySet()) {
                String callerInstance = entry.getKey();
                String callerClass = instanceToClass.get(callerInstance);
                if (!callerClass.equals(className)) {
                    continue;
                }
                for (CallDetail cd : entry.getValue()) {
                    if (!cd.isInternal) {
                        String calleeInst = cd.externalTargetInstance;
                        String outPortName = cd.msgName + "_to_" + calleeInst + "_from_" + callerInstance + "_out";
                        if (!declaredPorts.contains(outPortName)) {
                            declaredPorts.add(outPortName);
                            String calleeClass = instanceToClass.get(calleeInst);
                            List<FormalParameterDeclaration> fps = constructorInfoMap
                                    .get(calleeClass)
                                    .msgsrvToParams
                                    .getOrDefault(cd.msgName, Collections.emptyList());
                            String lfType = (fps.isEmpty()) ? "int" : (calleeClass + "_" + cd.msgName);
                            lfCode.append("    output ").append(outPortName).append(": ").append(lfType).append(";\n");
                        }
                    }
                }
            }

            // (b) Inputs: calls received by this class’s instances
            Map<String, Set<String>> inputsByMsgsrv = new HashMap<>();
            for (List<CallDetail> callList : callsByInstance.values()) {
                for (CallDetail cd : callList) {
                    if (!cd.isInternal && instanceToClass.get(cd.externalTargetInstance).equals(className)) {
                        String callerInst = findCallerInstanceFor(cd, callsByInstance);
                        if (callerInst == null) {
                            callerInst = "unknownCaller";
                        }
                        String portName = cd.msgName + "_to_" + cd.externalTargetInstance
                                + "_from_" + callerInst + "_in";
                        if (!declaredPorts.contains(portName)) {
                            declaredPorts.add(portName);
                            List<FormalParameterDeclaration> fps = cInfo.msgsrvToParams
                                    .getOrDefault(cd.msgName, Collections.emptyList());
                            String lfType = (fps.isEmpty()) ? "int" : (className + "_" + cd.msgName);
                            lfCode.append("    input ").append(portName).append(": ").append(lfType).append(";\n");
                        }
                        inputsByMsgsrv.computeIfAbsent(cd.msgName, k -> new LinkedHashSet<>())
                                .add(portName);
                    }
                }
            }

            // B) State variables
            for (StateVar sv : cInfo.regularStateVars) {
                lfCode.append("    state ").append(sv.name)
                        .append(": ").append(sv.type).append("\n");
            }
            Set<String> internalServers = internalMsgsrvs.getOrDefault(className, Collections.emptySet());
            for (String m : internalServers) {
                if (m.startsWith("constructorOf")) continue;
                MsgsrvDeclaration md = findMsgsrv(rc, m);
                if (md != null) {
                    for (FormalParameterDeclaration fp : md.getFormalParameters()) {
                        lfCode.append("    state ")
                                .append(fp.getName())
                                .append("_for_").append(m)
                                .append(": ")
                                .append(mapRebecaTypeToLF(fp.getType().getTypeName()))
                                .append("\n");
                    }
                }
            }

            // C) Logical actions for internal msgSrvs
            for (String m : internalServers) {
                if (!m.startsWith("constructorOf")) {
                    lfCode.append("    logical action ").append(m).append(";\n");
                }
            }

            // D) Reaction for each internal msgsrv
            for (String m : internalServers) {
                if (m.startsWith("constructorOf")) continue;
                ReactionContent rContent = generateMsgsrvReactionBody(rc, m, className, cInfo, instanceToClass, callsByInstance);
                lfCode.append("    reaction(").append(m).append(")");
                if (!rContent.scheduledActions.isEmpty() || !rContent.usedPorts.isEmpty()) {
                    lfCode.append(" -> ");
                    List<String> outputs = new ArrayList<>();
                    outputs.addAll(rContent.scheduledActions);
                    outputs.addAll(rContent.usedPorts);
                    for (int i = 0; i < outputs.size(); i++) {
                        if (i > 0) lfCode.append(", ");
                        lfCode.append(outputs.get(i));
                    }
                }
                lfCode.append(" {=\n");
                lfCode.append(rContent.code);
                lfCode.append("    =}\n");
            }

            // E) If there's a constructor => reaction(startup)
            ConstructorDeclaration theConstructor = rc.getConstructors().isEmpty() ? null : rc.getConstructors().get(0);
            if (theConstructor != null) {
                ReactionContent rContent = generateConstructorReactionBody(
                        theConstructor.getBlock(),
                        className, cInfo, internalMsgsrvs,
                        instanceToClass, callsByInstance
                );
                if (!rContent.code.isEmpty()) {
                    lfCode.append("    reaction(startup)");
                    if (!rContent.scheduledActions.isEmpty() || !rContent.usedPorts.isEmpty()) {
                        lfCode.append(" -> ");
                        List<String> outputs = new ArrayList<>();
                        outputs.addAll(rContent.scheduledActions);
                        outputs.addAll(rContent.usedPorts);
                        for (int i = 0; i < outputs.size(); i++) {
                            if (i > 0) lfCode.append(", ");
                            lfCode.append(outputs.get(i));
                        }
                    }
                    lfCode.append(" {=\n");
                    lfCode.append(rContent.code);
                    lfCode.append("    =}\n");
                }
            }

            // F) External msgSrvs => one reaction per input port
            for (Map.Entry<String, Set<String>> entry : inputsByMsgsrv.entrySet()) {
                String externalMsgsrvName = entry.getKey();
                Set<String> portNames = entry.getValue();
                if (portNames.isEmpty()) continue;
                MsgsrvDeclaration mDecl = findMsgsrv(rc, externalMsgsrvName);
                for (String portName : portNames) {
                    lfCode.append("    reaction(").append(portName).append(") {=\n");
                    if (mDecl != null && mDecl.getBlock() != null) {
                        ReactionContent rContent = generateExternalMsgsrvReactionBody(
                                mDecl, portName, className, cInfo, instanceToClass, callsByInstance
                        );
                        lfCode.append(rContent.code);
                    }
                    lfCode.append("    =}\n");
                }
            }

            lfCode.append("}\n\n");
        }

        // 8) Main reactor
        MainDeclaration mainDecl = rebecaModel.getRebecaCode().getMainDeclaration();
        if (mainDecl != null) {
            lfCode.append("main reactor {\n");
            for (MainRebecDefinition md : mainDecl.getMainRebecDefinition()) {
                String instName = md.getName();
                String clsName = md.getType().getTypeName();
                ConstructorInfo cInfo = constructorInfoMap.get(clsName);
                lfCode.append("    ").append(instName)
                        .append(" = new ")
                        .append(clsName);
                List<Expression> cArgs = md.getArguments();
                if (!cInfo.params.isEmpty()) {
                    lfCode.append("(");
                    for (int i = 0; i < cInfo.params.size(); i++) {
                        if (i > 0) lfCode.append(", ");
                        ConstructorParam cp = cInfo.params.get(i);
                        String paramVal = cp.defaultValue;
                        if (cArgs != null && i < cArgs.size()) {
                            paramVal = expressionToString(cArgs.get(i), cp.type, cp.defaultValue);
                        }
                        lfCode.append(cp.stateVarName).append(" = ").append(paramVal);
                    }
                    lfCode.append(")");
                } else {
                    lfCode.append("()");
                }
                lfCode.append(";\n");
            }
            lfCode.append(generateConnectionStatements(callsByInstance, instanceToClass));
            lfCode.append("}\n\n");
        }

        // 9) Write to file
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(outputPath))) {
            writer.write(lfCode.toString());
        } catch (IOException e) {
            e.printStackTrace();
        }

        // Optional: debug structure
        analyzeAndPrintStructureMap();
    }

    /* ----------------------------------------------------------------------
     * Private Methods (Ordering: High-level -> Utility)
     * ----------------------------------------------------------------------
     */

    /**
     * Determine which message servers are considered internal (called by self).
     */
    private Map<String, Set<String>> findInternalMsgServers(Map<String, ConstructorInfo> constructorInfoMap) {
        Map<String, Set<String>> internalMsgsrvs = new HashMap<>();
        for (ReactiveClassDeclaration rc : classes) {
            String cName = rc.getName();
            Set<String> internalCalls = new HashSet<>();
            for (ConstructorDeclaration cd : rc.getConstructors()) {
                analyzeBlockForInternalCalls(cd.getBlock(), cName, internalCalls);
            }
            for (MsgsrvDeclaration msgs : rc.getMsgsrvs()) {
                analyzeBlockForInternalCalls(msgs.getBlock(), cName, internalCalls);
            }
            for (MethodDeclaration md : rc.getSynchMethods()) {
                analyzeBlockForInternalCalls(md.getBlock(), cName, internalCalls);
            }
            Set<String> allMsgsrvs = new HashSet<>();
            if (!rc.getConstructors().isEmpty()) {
                allMsgsrvs.add("constructorOf" + cName);
            }
            for (MsgsrvDeclaration m : rc.getMsgsrvs()) {
                allMsgsrvs.add(m.getName());
            }
            for (MethodDeclaration syn : rc.getSynchMethods()) {
                allMsgsrvs.add(syn.getName());
            }
            Set<String> internalServerNames = new HashSet<>();
            for (String m : allMsgsrvs) {
                boolean isConstructor = m.startsWith("constructorOf");
                if (internalCalls.contains(m) || isConstructor) {
                    internalServerNames.add(m);
                }
            }
            internalMsgsrvs.put(cName, internalServerNames);
        }
        return internalMsgsrvs;
    }

    /**
     * Check if a msgSrv is actually used by some external caller.
     */
    private boolean isMsgsrvExternallyUsed(
            String msgsrvName,
            String className,
            Map<String, List<CallDetail>> callsByInstance,
            Map<String, String> instanceToClass
    ) {
        for (List<CallDetail> callList : callsByInstance.values()) {
            for (CallDetail cd : callList) {
                if (!cd.isInternal && cd.msgName.equals(msgsrvName)) {
                    String tgtCls = instanceToClass.get(cd.externalTargetInstance);
                    if (className.equals(tgtCls)) {
                        return true;
                    }
                }
            }
        }
        return false;
    }

    /**
     * Generate reaction for an internal msgsrv.
     */
    private ReactionContent generateMsgsrvReactionBody(
            ReactiveClassDeclaration rc,
            String msgsrvName,
            String className,
            ConstructorInfo cInfo,
            Map<String, String> instanceToClass,
            Map<String, List<CallDetail>> callsByInstance
    ) {
        ReactionContent rContent = new ReactionContent();
        MsgsrvDeclaration found = findMsgsrv(rc, msgsrvName);
        if (found == null || found.getBlock() == null) {
            return rContent;
        }
        rContent.code = parseBlockStatementInline(
                found.getBlock(),
                className,
                msgsrvName,
                cInfo,
                instanceToClass,
                callsByInstance,
                rContent.scheduledActions,
                rContent.usedPorts,
                null
        );
        return rContent;
    }

    /**
     * Generate code for a constructor => reaction(startup).
     */
    private ReactionContent generateConstructorReactionBody(
            Statement constructorBody,
            String className,
            ConstructorInfo cInfo,
            Map<String, Set<String>> internalMsgsrvs,
            Map<String, String> instanceToClass,
            Map<String, List<CallDetail>> callsByInstance
    ) {
        ReactionContent rc = new ReactionContent();
        if (constructorBody == null) return rc;
        rc.code = parseBlockStatementInline(
                constructorBody,
                className,
                "",
                cInfo,
                instanceToClass,
                callsByInstance,
                rc.scheduledActions,
                rc.usedPorts,
                null
        );
        return rc;
    }

    /**
     * Generate a reaction body for an external msgsrv triggered by some input port.
     */
    private ReactionContent generateExternalMsgsrvReactionBody(
            MsgsrvDeclaration externalMsgSrvDecl,
            String portName,
            String className,
            ConstructorInfo cInfo,
            Map<String, String> instanceToClass,
            Map<String, List<CallDetail>> callsByInstance
    ) {
        ReactionContent rc = new ReactionContent();
        if (externalMsgSrvDecl == null || externalMsgSrvDecl.getBlock() == null) {
            return rc;
        }
        Map<String, String> externalParamMapping = new HashMap<>();
        List<FormalParameterDeclaration> fps = cInfo.msgsrvToParams
                .getOrDefault(externalMsgSrvDecl.getName(), Collections.emptyList());
        for (FormalParameterDeclaration fp : fps) {
            externalParamMapping.put(fp.getName(), "(*" + portName + ".get())." + fp.getName());
        }
        rc.code = parseBlockStatementInline(
                externalMsgSrvDecl.getBlock(),
                className,
                externalMsgSrvDecl.getName(),
                cInfo,
                instanceToClass,
                callsByInstance,
                rc.scheduledActions,
                rc.usedPorts,
                externalParamMapping
        );
        return rc;
    }

    /**
     * Convert Rebeca statements into lines of LF code for a reaction body.
     */
    private String parseBlockStatementInline(
            Statement stmt,
            String className,
            String currentMsgsrvName,
            ConstructorInfo cInfo,
            Map<String, String> instanceToClass,
            Map<String, List<CallDetail>> callsByInstance,
            Set<String> scheduledActions,
            Set<String> usedPorts,
            Map<String, String> externalParamMapping
    ) {
        if (stmt == null) return "";
        StringBuilder sb = new StringBuilder();

        if (stmt instanceof BlockStatement bs) {
            for (Statement sub : bs.getStatements()) {
                sb.append(parseBlockStatementInline(
                        sub, className, currentMsgsrvName, cInfo,
                        instanceToClass, callsByInstance,
                        scheduledActions, usedPorts, externalParamMapping
                ));
            }
        } else if (stmt instanceof ConditionalStatement cs) {
            String condStr = transformExpression(cs.getCondition(), currentMsgsrvName, cInfo, externalParamMapping);
            sb.append("        if (").append(condStr).append(") {\n");
            sb.append(parseBlockStatementInline(
                    cs.getStatement(),
                    className, currentMsgsrvName, cInfo,
                    instanceToClass, callsByInstance,
                    scheduledActions, usedPorts, externalParamMapping
            ));
            sb.append("        }");
            if (cs.getElseStatement() != null) {
                sb.append(" else {\n");
                sb.append(parseBlockStatementInline(
                        cs.getElseStatement(),
                        className, currentMsgsrvName, cInfo,
                        instanceToClass, callsByInstance,
                        scheduledActions, usedPorts, externalParamMapping
                ));
                sb.append("        }");
            }
            sb.append("\n");
        } else if (stmt instanceof ForStatement fs) {
            String initPart = fs.getForInitializer().toString();
            String condStr = "";
            if (fs.getCondition() != null) {
                condStr = transformExpression(fs.getCondition(), currentMsgsrvName, cInfo, externalParamMapping);
            }
            String updatePart = fs.getForIncrement().toString();
            sb.append("        for (")
                    .append(initPart).append("; ")
                    .append(condStr).append("; ")
                    .append(updatePart).append(") {\n");
            sb.append(parseBlockStatementInline(
                    fs.getStatement(),
                    className, currentMsgsrvName, cInfo,
                    instanceToClass, callsByInstance,
                    scheduledActions, usedPorts,
                    externalParamMapping
            ));
            sb.append("        }\n");
        } else if (stmt instanceof WhileStatement ws) {
            String condStr = transformExpression(ws.getCondition(), currentMsgsrvName, cInfo, externalParamMapping);
            sb.append("        while (").append(condStr).append(") {\n");
            sb.append(parseBlockStatementInline(
                    ws.getStatement(),
                    className, currentMsgsrvName, cInfo,
                    instanceToClass, callsByInstance,
                    scheduledActions, usedPorts,
                    externalParamMapping
            ));
            sb.append("        }\n");
        } else if (stmt instanceof Expression expr) {
            sb.append(processExpressionInline(
                    expr,
                    className, currentMsgsrvName, cInfo,
                    instanceToClass, callsByInstance,
                    scheduledActions, usedPorts,
                    externalParamMapping
            ));
        } else {
            sb.append("        // Unhandled statement type: ")
                    .append(stmt.getClass().getSimpleName())
                    .append("\n");
        }
        return sb.toString();
    }

    /**
     * Process an expression statement in Rebeca and produce corresponding lines of LF code.
     */
    private String processExpressionInline(
            Expression expr,
            String className,
            String currentMsgsrvName,
            ConstructorInfo cInfo,
            Map<String, String> instanceToClass,
            Map<String, List<CallDetail>> callsByInstance,
            Set<String> scheduledActions,
            Set<String> usedPorts,
            Map<String, String> externalParamMapping
    ) {
        if (expr == null) return "";
        StringBuilder sb = new StringBuilder();

        if (expr instanceof BinaryExpression be) {
            if ("=".equals(be.getOperator())) {
                String leftStr = transformExpression(be.getLeft(), currentMsgsrvName, cInfo, externalParamMapping);
                String rightStr = transformExpression(be.getRight(), currentMsgsrvName, cInfo, externalParamMapping);
                sb.append("        ").append(leftStr).append(" = ").append(rightStr).append(";\n");
            } else {
                sb.append(processExpressionInline(be.getLeft(),
                        className, currentMsgsrvName, cInfo,
                        instanceToClass, callsByInstance,
                        scheduledActions, usedPorts, externalParamMapping));
                sb.append(processExpressionInline(be.getRight(),
                        className, currentMsgsrvName, cInfo,
                        instanceToClass, callsByInstance,
                        scheduledActions, usedPorts, externalParamMapping));
            }
        } else if (expr instanceof DotPrimary dot) {
            sb.append(processExpressionInline(dot.getLeft(),
                    className, currentMsgsrvName, cInfo,
                    instanceToClass, callsByInstance,
                    scheduledActions, usedPorts, externalParamMapping));
            sb.append(processExpressionInline(dot.getRight(),
                    className, currentMsgsrvName, cInfo,
                    instanceToClass, callsByInstance,
                    scheduledActions, usedPorts, externalParamMapping));

            if (dot.getRight() instanceof TermPrimary methodTerm) {
                String methodName = methodTerm.getName();
                ParentSuffixPrimary psp = methodTerm.getParentSuffixPrimary();
                List<Expression> argList = (psp == null) ? Collections.emptyList() : psp.getArguments();

                // INTERNAL call => self.method(...)
                if (dot.getLeft() instanceof TermPrimary leftTerm && "self".equals(leftTerm.getName())) {
                    for (Map.Entry<String, List<CallDetail>> e : callsByInstance.entrySet()) {
                        String callerInstance = e.getKey();
                        String callerClass = instanceToClass.get(callerInstance);
                        if (!callerClass.equals(className)) continue;
                        for (CallDetail cd : e.getValue()) {
                            if (cd.isInternal && cd.msgName.equals(methodName)
                                    && currentMsgsrvName.equals(cd.callerMsgsrvName)) {
                                List<FormalParameterDeclaration> fps =
                                        cInfo.msgsrvToParams.getOrDefault(methodName, Collections.emptyList());
                                for (int i = 0; i < fps.size(); i++) {
                                    FormalParameterDeclaration fpd = fps.get(i);
                                    String paramName = fpd.getName() + "_for_" + methodName;
                                    String paramVal = (i < argList.size())
                                            ? transformExpression(argList.get(i), currentMsgsrvName, cInfo, externalParamMapping)
                                            : getDefaultValueForType(mapRebecaTypeToLF(fpd.getType().getTypeName()));
                                    sb.append("        ")
                                            .append(paramName)
                                            .append(" = ")
                                            .append(paramVal)
                                            .append(";\n");
                                }
                                String scheduleTime = (cd.afterDelayMs != null && !cd.afterDelayMs.isEmpty())
                                        ? cd.afterDelayMs + "ms"
                                        : "0ms";
                                sb.append("        ")
                                        .append(methodName)
                                        .append(".schedule(")
                                        .append(scheduleTime)
                                        .append(");\n");
                                scheduledActions.add(methodName);
                            }
                        }
                    }
                    // EXTERNAL call => knownRebec.method(...)
                } else if (dot.getLeft() instanceof TermPrimary knownField) {
                    for (Map.Entry<String, List<CallDetail>> e : callsByInstance.entrySet()) {
                        String callerInstance = e.getKey();
                        String callerClass = instanceToClass.get(callerInstance);
                        if (!callerClass.equals(className)) continue;
                        for (CallDetail cd : e.getValue()) {
                            if (!cd.isInternal && cd.msgName.equals(methodName)
                                    && currentMsgsrvName.equals(cd.callerMsgsrvName)) {
                                String outPort = methodName + "_to_"
                                        + cd.externalTargetInstance + "_from_"
                                        + callerInstance + "_out";
                                String calleeCls = cd.calleeClass;
                                List<FormalParameterDeclaration> fps =
                                        (calleeCls == null)
                                                ? Collections.emptyList()
                                                : cInfoFor(calleeCls, instanceToClass)
                                                .msgsrvToParams
                                                .getOrDefault(methodName, Collections.emptyList());
                                String structType = (fps.isEmpty())
                                        ? "int"
                                        : (calleeCls + "_" + methodName);
                                StringBuilder structInit = new StringBuilder();
                                structInit.append(structType).append("{");
                                for (int i = 0; i < argList.size(); i++) {
                                    if (i > 0) structInit.append(", ");
                                    String exprStr = transformExpression(argList.get(i),
                                            currentMsgsrvName, cInfo, externalParamMapping);
                                    structInit.append(exprStr);
                                }
                                structInit.append("}");
                                sb.append("        ")
                                        .append(outPort)
                                        .append(".set(")
                                        .append(structInit)
                                        .append(");\n");
                                usedPorts.add(outPort);
                            }
                        }
                    }
                }
            }
        } else if (expr instanceof UnaryExpression ue) {
            sb.append(processExpressionInline(ue.getExpression(),
                    className, currentMsgsrvName, cInfo,
                    instanceToClass, callsByInstance,
                    scheduledActions, usedPorts, externalParamMapping));
        } else if (expr instanceof Literal) {
            // no-op
        } else if (expr instanceof TermPrimary) {
            // no-op
        }
        return sb.toString();
    }

    /**
     * Locate the instance name that made this CallDetail, if any.
     */
    private String findCallerInstanceFor(CallDetail cd, Map<String, List<CallDetail>> callsByInstance) {
        for (Map.Entry<String, List<CallDetail>> e : callsByInstance.entrySet()) {
            List<CallDetail> list = e.getValue();
            if (list.contains(cd)) {
                return e.getKey();
            }
        }
        return null;
    }

    /**
     * Find a message server declaration by name in a given class.
     */
    private MsgsrvDeclaration findMsgsrv(ReactiveClassDeclaration rc, String msgsrvName) {
        for (MsgsrvDeclaration m : rc.getMsgsrvs()) {
            if (m.getName().equals(msgsrvName)) {
                return m;
            }
        }
        return null;
    }

    /**
     * Generate the connection statements in the main reactor for external calls.
     */
    private String generateConnectionStatements(
            Map<String, List<CallDetail>> callsByInstance,
            Map<String, String> instanceToClass
    ) {
        StringBuilder sb = new StringBuilder();
        Set<String> uniqueConnections = new LinkedHashSet<>();

        for (Map.Entry<String, List<CallDetail>> callerEntry : callsByInstance.entrySet()) {
            String callerInst = callerEntry.getKey();
            for (CallDetail cd : callerEntry.getValue()) {
                if (!cd.isInternal) {
                    String calleeInst = cd.externalTargetInstance;
                    String msg = cd.msgName;
                    String outPort = msg + "_to_" + calleeInst + "_from_" + callerInst + "_out";
                    String inPort = msg + "_to_" + calleeInst + "_from_" + callerInst + "_in";
                    String connection = callerInst + "." + outPort + " -> " + calleeInst + "." + inPort;
                    if (cd.afterDelayMs != null && !cd.afterDelayMs.isEmpty()) {
                        connection += " after " + cd.afterDelayMs + "ms";
                    }
                    uniqueConnections.add(connection);
                }
            }
        }

        for (String c : uniqueConnections) {
            sb.append("    ").append(c).append(";\n");
        }
        return sb.toString();
    }

    /**
     * Build constructor info for a given reactive class (constructor params vs. normal vars).
     */
    private ConstructorInfo buildConstructorInfo(ReactiveClassDeclaration rc) {
        ConstructorInfo cInfo = new ConstructorInfo();
        Map<String, String> statevarNameToType = new HashMap<>();
        if (rc.getStatevars() != null) {
            for (FieldDeclaration fd : rc.getStatevars()) {
                for (VariableDeclarator vd : fd.getVariableDeclarators()) {
                    statevarNameToType.put(vd.getVariableName(), fd.getType().getTypeName());
                }
            }
        }
        ConstructorDeclaration cDec = rc.getConstructors().isEmpty() ? null : rc.getConstructors().get(0);

        if (cDec == null) {
            for (var e : statevarNameToType.entrySet()) {
                StateVar sv = new StateVar();
                sv.name = e.getKey();
                sv.type = mapRebecaTypeToLF(e.getValue());
                cInfo.regularStateVars.add(sv);
            }
        } else {
            List<FormalParameterDeclaration> fps = cDec.getFormalParameters();
            Map<String, String> param2stateVar = new HashMap<>();
            parseConstructorBlockForAssignments(cDec.getBlock(), param2stateVar);

            for (FormalParameterDeclaration fp : fps) {
                String pName = fp.getName();
                String pType = fp.getType().getTypeName();
                String assignedVar = param2stateVar.get(pName);
                if (assignedVar != null && statevarNameToType.containsKey(assignedVar)) {
                    ConstructorParam cp = new ConstructorParam();
                    cp.paramName = pName;
                    cp.stateVarName = assignedVar;
                    cp.type = mapRebecaTypeToLF(pType);
                    cp.defaultValue = getDefaultValueForType(cp.type);
                    cInfo.params.add(cp);
                }
            }
            Set<String> paramVars = cInfo.params.stream()
                    .map(cp -> cp.stateVarName)
                    .collect(Collectors.toSet());
            for (var e : statevarNameToType.entrySet()) {
                if (!paramVars.contains(e.getKey())) {
                    StateVar sv = new StateVar();
                    sv.name = e.getKey();
                    sv.type = mapRebecaTypeToLF(e.getValue());
                    cInfo.regularStateVars.add(sv);
                }
            }
        }
        for (MsgsrvDeclaration md : rc.getMsgsrvs()) {
            cInfo.msgsrvToParams.put(md.getName(), md.getFormalParameters());
        }

        Set<String> internalCalls = new HashSet<>();
        if (cDec != null) {
            analyzeBlockForInternalCalls(cDec.getBlock(), rc.getName(), internalCalls);
        }
        for (MsgsrvDeclaration md : rc.getMsgsrvs()) {
            analyzeBlockForInternalCalls(md.getBlock(), rc.getName(), internalCalls);
        }
        for (MethodDeclaration syncM : rc.getSynchMethods()) {
            analyzeBlockForInternalCalls(syncM.getBlock(), rc.getName(), internalCalls);
        }
        for (MsgsrvDeclaration md : rc.getMsgsrvs()) {
            if (!internalCalls.contains(md.getName())) {
                cInfo.externalMsgsrvsToParams.put(md.getName(), md.getFormalParameters());
            }
        }
        return cInfo;
    }

    /**
     * If the constructor has param->stateVar assignments, capture them.
     */
    private void parseConstructorBlockForAssignments(Statement stmt, Map<String, String> paramToStateVar) {
        if (stmt == null) return;
        if (stmt instanceof BlockStatement bs) {
            for (Statement s : bs.getStatements()) {
                parseConstructorBlockForAssignments(s, paramToStateVar);
            }
        } else if (stmt instanceof ConditionalStatement cs) {
            parseConstructorBlockForAssignments(cs.getStatement(), paramToStateVar);
            if (cs.getElseStatement() != null) {
                parseConstructorBlockForAssignments(cs.getElseStatement(), paramToStateVar);
            }
        } else if (stmt instanceof Expression ex) {
            if (ex instanceof BinaryExpression be && "=".equals(be.getOperator())) {
                if (be.getLeft() instanceof TermPrimary leftTerm && be.getRight() instanceof TermPrimary rightTerm) {
                    paramToStateVar.put(rightTerm.getName(), leftTerm.getName());
                }
            }
        }
    }

    /**
     * Analyze a block to find any `self.foo(...)` calls, marking them as internal.
     */
    private void analyzeBlockForInternalCalls(Statement stmt, String className, Set<String> internalCalls) {
        if (stmt == null) return;
        if (stmt instanceof BlockStatement bs) {
            for (Statement s : bs.getStatements()) {
                analyzeBlockForInternalCalls(s, className, internalCalls);
            }
        } else if (stmt instanceof ConditionalStatement cs) {
            analyzeBlockForInternalCalls(cs.getStatement(), className, internalCalls);
            if (cs.getElseStatement() != null) {
                analyzeBlockForInternalCalls(cs.getElseStatement(), className, internalCalls);
            }
        } else if (stmt instanceof Expression ex) {
            analyzeExpressionForInternalCalls(ex, className, internalCalls);
        }
    }

    /**
     * Recursively check expressions for `self.someMsgSrv(...)` usage.
     */
    private void analyzeExpressionForInternalCalls(Expression expr, String className, Set<String> internalCalls) {
        if (expr == null) return;
        if (expr instanceof DotPrimary dot) {
            analyzeExpressionForInternalCalls(dot.getLeft(), className, internalCalls);
            analyzeExpressionForInternalCalls(dot.getRight(), className, internalCalls);
            if (dot.getLeft() instanceof TermPrimary leftTerm && "self".equals(leftTerm.getName())) {
                if (dot.getRight() instanceof TermPrimary methodTerm) {
                    internalCalls.add(methodTerm.getName());
                }
            }
        } else if (expr instanceof UnaryExpression ue) {
            analyzeExpressionForInternalCalls(ue.getExpression(), className, internalCalls);
        } else if (expr instanceof BinaryExpression be) {
            analyzeExpressionForInternalCalls(be.getLeft(), className, internalCalls);
            analyzeExpressionForInternalCalls(be.getRight(), className, internalCalls);
        }
    }

    /**
     * Build a map from rebec instance name to its class name.
     */
    private Map<String, String> buildInstanceToClassMap() {
        Map<String, String> map = new HashMap<>();
        MainDeclaration mainDecl = rebecaModel.getRebecaCode().getMainDeclaration();
        if (mainDecl != null) {
            for (MainRebecDefinition mrd : mainDecl.getMainRebecDefinition()) {
                map.put(mrd.getName(), mrd.getType().getTypeName());
            }
        }
        return map;
    }

    /**
     * For each reactive class, gather the known rebecs (fields).
     */
    private Map<String, List<String>> buildClassToKnownRebecsMap() {
        Map<String, List<String>> map = new HashMap<>();
        for (ReactiveClassDeclaration rc : classes) {
            List<String> knowns = new ArrayList<>();
            if (rc.getKnownRebecs() != null) {
                for (FieldDeclaration fd : rc.getKnownRebecs()) {
                    for (VariableDeclarator vd : fd.getVariableDeclarators()) {
                        knowns.add(vd.getVariableName());
                    }
                }
            }
            map.put(rc.getName(), knowns);
        }
        return map;
    }

    /**
     * Determine which rebecs are assigned to each instance's known fields.
     */
    private Map<String, List<String>> buildInstanceKnownRebecsMap(Map<String, String> instanceToClass) {
        Map<String, List<String>> res = new HashMap<>();
        MainDeclaration md = rebecaModel.getRebecaCode().getMainDeclaration();
        if (md == null) return res;
        Map<String, List<String>> classToKnownFields = new HashMap<>();
        for (ReactiveClassDeclaration rc : classes) {
            List<String> knownVars = new ArrayList<>();
            if (rc.getKnownRebecs() != null) {
                for (FieldDeclaration fd : rc.getKnownRebecs()) {
                    for (VariableDeclarator vd : fd.getVariableDeclarators()) {
                        knownVars.add(vd.getVariableName());
                    }
                }
            }
            classToKnownFields.put(rc.getName(), knownVars);
        }
        for (MainRebecDefinition def : md.getMainRebecDefinition()) {
            String instName = def.getName();
            String clsName = def.getType().getTypeName();
            List<String> fields = classToKnownFields.getOrDefault(clsName, Collections.emptyList());
            List<Expression> bindings = def.getBindings();
            List<String> actualKnown = new ArrayList<>();
            if (bindings != null && bindings.size() == fields.size()) {
                for (Expression e : bindings) {
                    if (e instanceof TermPrimary tp) {
                        actualKnown.add(tp.getName());
                    }
                }
            }
            res.put(instName, actualKnown);
        }
        return res;
    }

    /**
     * Gather internal/external calls across the model and fill callsByInstance.
     */
    private void analyzeAllCalls(
            Map<String, String> instanceToClass,
            Map<String, List<CallDetail>> callsByInstance,
            Map<String, List<String>> classToKnownRebecs,
            Map<String, List<String>> instanceKnownRebecs
    ) {
        for (ReactiveClassDeclaration rc : classes) {
            String cName = rc.getName();
            for (ConstructorDeclaration cDec : rc.getConstructors()) {
                parseBlockStatement(cDec.getBlock(), cName, instanceToClass, callsByInstance,
                        classToKnownRebecs, instanceKnownRebecs, "");
            }
            for (MsgsrvDeclaration md : rc.getMsgsrvs()) {
                parseBlockStatement(md.getBlock(), cName, instanceToClass, callsByInstance,
                        classToKnownRebecs, instanceKnownRebecs, md.getName());
            }
            for (MethodDeclaration synM : rc.getSynchMethods()) {
                parseBlockStatement(synM.getBlock(), cName, instanceToClass, callsByInstance,
                        classToKnownRebecs, instanceKnownRebecs, synM.getName());
            }
        }
    }

    /**
     * Parse a Rebeca statement recursively to detect calls and populate callsByInstance.
     */
    private void parseBlockStatement(
            Statement stmt,
            String currentClass,
            Map<String, String> instanceToClass,
            Map<String, List<CallDetail>> callsByInstance,
            Map<String, List<String>> classToKnownRebecs,
            Map<String, List<String>> instanceKnownRebecs,
            String currentMsgsrvName
    ) {
        if (stmt == null) return;
        if (stmt instanceof BlockStatement bs) {
            for (Statement s : bs.getStatements()) {
                parseBlockStatement(s, currentClass, instanceToClass, callsByInstance,
                        classToKnownRebecs, instanceKnownRebecs, currentMsgsrvName);
            }
        } else if (stmt instanceof ConditionalStatement cs) {
            parseBlockStatement(cs.getStatement(), currentClass, instanceToClass, callsByInstance,
                    classToKnownRebecs, instanceKnownRebecs, currentMsgsrvName);
            if (cs.getElseStatement() != null) {
                parseBlockStatement(cs.getElseStatement(), currentClass, instanceToClass, callsByInstance,
                        classToKnownRebecs, instanceKnownRebecs, currentMsgsrvName);
            }
        } else if (stmt instanceof Expression ex) {
            parseExpression(ex, currentClass, instanceToClass, callsByInstance,
                    classToKnownRebecs, instanceKnownRebecs, currentMsgsrvName);
        }
    }

    /**
     * Parse a Rebeca expression to detect calls and store them.
     */
    private void parseExpression(
            Expression expr,
            String currentClass,
            Map<String, String> instanceToClass,
            Map<String, List<CallDetail>> callsByInstance,
            Map<String, List<String>> classToKnownRebecs,
            Map<String, List<String>> instanceKnownRebecs,
            String currentMsgsrvName
    ) {
        if (expr == null) return;

        if (expr instanceof DotPrimary dot) {
            parseExpression(dot.getLeft(), currentClass, instanceToClass,
                    callsByInstance, classToKnownRebecs, instanceKnownRebecs,
                    currentMsgsrvName);
            parseExpression(dot.getRight(), currentClass, instanceToClass,
                    callsByInstance, classToKnownRebecs, instanceKnownRebecs,
                    currentMsgsrvName);

            if (dot.getRight() instanceof TermPrimary methodTerm) {
                String methodName = methodTerm.getName();
                ParentSuffixPrimary psp = methodTerm.getParentSuffixPrimary();
                List<Expression> argList = (psp == null) ? Collections.emptyList() : psp.getArguments();

                // Timed Rebeca 'after' handling
                String afterDelayMs = null;
                if (psp instanceof TimedRebecaParentSuffixPrimary timedPSP) {
                    Expression afterExpr = timedPSP.getAfterExpression();
                    if (afterExpr != null) {
                        afterDelayMs = expressionToString(afterExpr, "int", "0");
                    }
                }

                // self.method(...)
                if (dot.getLeft() instanceof TermPrimary leftTerm && "self".equals(leftTerm.getName())) {
                    for (Map.Entry<String, String> e : instanceToClass.entrySet()) {
                        if (e.getValue().equals(currentClass)) {
                            CallDetail cd = new CallDetail(methodName, true, "");
                            cd.arguments = argList;
                            cd.callerMsgsrvName = currentMsgsrvName;
                            cd.calleeClass = currentClass;
                            if (afterDelayMs != null) {
                                cd.afterDelayMs = afterDelayMs;
                            }
                            callsByInstance.get(e.getKey()).add(cd);
                        }
                    }
                    // knownRebec.method(...)
                } else if (dot.getLeft() instanceof TermPrimary knownField) {
                    if (classToKnownRebecs
                            .getOrDefault(currentClass, Collections.emptyList())
                            .contains(knownField.getName())) {
                        for (Map.Entry<String, String> e : instanceToClass.entrySet()) {
                            if (!e.getValue().equals(currentClass)) {
                                continue;
                            }
                            String callerInstance = e.getKey();
                            List<String> knownList = instanceKnownRebecs
                                    .getOrDefault(callerInstance, Collections.emptyList());
                            int idx = classToKnownRebecs.get(currentClass)
                                    .indexOf(knownField.getName());
                            if (idx >= 0 && idx < knownList.size()) {
                                String targetInstance = knownList.get(idx);
                                String calleeCls = instanceToClass.get(targetInstance);
                                CallDetail cd = new CallDetail(methodName, false, targetInstance);
                                cd.arguments = argList;
                                cd.callerMsgsrvName = currentMsgsrvName;
                                cd.calleeClass = calleeCls;
                                if (afterDelayMs != null) {
                                    cd.afterDelayMs = afterDelayMs;
                                }
                                callsByInstance.get(callerInstance).add(cd);
                            }
                        }
                    }
                }
            }
        } else if (expr instanceof UnaryExpression ue) {
            parseExpression(ue.getExpression(), currentClass, instanceToClass,
                    callsByInstance, classToKnownRebecs, instanceKnownRebecs,
                    currentMsgsrvName);
        } else if (expr instanceof BinaryExpression be) {
            parseExpression(be.getLeft(), currentClass, instanceToClass,
                    callsByInstance, classToKnownRebecs, instanceKnownRebecs,
                    currentMsgsrvName);
            parseExpression(be.getRight(), currentClass, instanceToClass,
                    callsByInstance, classToKnownRebecs, instanceKnownRebecs,
                    currentMsgsrvName);
        }
    }

    /**
     * Transform a Rebeca Expression into a string for insertion into generated code.
     */
    private String transformExpression(
            Expression expr,
            String msgsrvName,
            ConstructorInfo cInfo,
            Map<String, String> externalParamMapping
    ) {
        if (expr == null) return "";
        if (expr instanceof Literal lit) {
            return lit.getLiteralValue();
        }
        if (expr instanceof TermPrimary tp) {
            String raw = tp.getName();
            if (externalParamMapping != null && externalParamMapping.containsKey(raw)) {
                return externalParamMapping.get(raw);
            }
            return renameIfParam(raw, msgsrvName, cInfo);
        }
        if (expr instanceof BinaryExpression be) {
            String l = transformExpression(be.getLeft(), msgsrvName, cInfo, externalParamMapping);
            String r = transformExpression(be.getRight(), msgsrvName, cInfo, externalParamMapping);
            return l + " " + be.getOperator() + " " + r;
        }
        if (expr instanceof UnaryExpression ue) {
            String sub = transformExpression(ue.getExpression(), msgsrvName, cInfo, externalParamMapping);
            return ue.getOperator() + sub;
        }
        if (expr instanceof DotPrimary dp) {
            String left = transformExpression(dp.getLeft(), msgsrvName, cInfo, externalParamMapping);
            String right = transformExpression(dp.getRight(), msgsrvName, cInfo, externalParamMapping);
            if (left.isEmpty()) return right;
            return left + "." + right;
        }
        return "";
    }

    /**
     * Rename a msgSrv parameter in local usage, e.g. param -> param_for_msgSrvName.
     */
    private String renameIfParam(String rawName, String msgsrvName, ConstructorInfo cInfo) {
        if (msgsrvName == null || msgsrvName.isEmpty()) return rawName;
        List<FormalParameterDeclaration> fps = cInfo.msgsrvToParams
                .getOrDefault(msgsrvName, Collections.emptyList());
        for (FormalParameterDeclaration fp : fps) {
            if (fp.getName().equals(rawName)) {
                return rawName + "_for_" + msgsrvName;
            }
        }
        return rawName;
    }

    /**
     * Map a Rebeca type name to the Lingua Franca/C++ equivalent.
     */
    private String mapRebecaTypeToLF(String rebType) {
        return switch (rebType) {
            case "boolean" -> "bool";
            case "int", "byte" -> "int";
            case "double" -> "double";
            default -> rebType;
        };
    }

    /**
     * Provide a default value for a given type (bool->false, int->0, etc.).
     */
    private String getDefaultValueForType(String lfType) {
        return switch (lfType) {
            case "bool" -> "false";
            case "double" -> "0.0";
            default -> "0";
        };
    }

    /**
     * Convert a Rebeca expression (used as a constructor argument, or 'after') to string.
     */
    private String expressionToString(Expression expr, String lfType, String fallback) {
        if (expr == null) return fallback;
        if (expr instanceof Literal lit) {
            return lit.getLiteralValue();
        }
        if (expr instanceof TermPrimary tp) {
            return tp.getName();
        }
        if (expr instanceof BinaryExpression be) {
            String leftStr = expressionToString(be.getLeft(), lfType, fallback);
            String rightStr = expressionToString(be.getRight(), lfType, fallback);
            return leftStr + " " + be.getOperator() + " " + rightStr;
        }
        return fallback;
    }

    /**
     * Retrieve constructor info for a given callee class (non-optimized approach).
     */
    private ConstructorInfo cInfoFor(String cls, Map<String, String> inst2cls) {
        for (ReactiveClassDeclaration rcd : classes) {
            if (rcd.getName().equals(cls)) {
                return buildConstructorInfo(rcd);
            }
        }
        return new ConstructorInfo();
    }

    /* ----------------------------------------------------------------------
     * Optional Debug Structure
     * ----------------------------------------------------------------------
     */

    private void analyzeAndPrintStructureMap() {
        Map<String, String> instanceToClass = buildInstanceToClassMap();
        Map<String, List<String>> instanceKnownRebecs = buildInstanceKnownRebecsMap(instanceToClass);
        Map<String, Set<String>> classToMsgServers = collectMessageServers();
        Map<String, List<CallDetail>> callsByInstance = new HashMap<>();
        for (String inst : instanceToClass.keySet()) {
            callsByInstance.put(inst, new ArrayList<>());
        }
        Map<String, List<String>> classToKnownRebecs = buildClassToKnownRebecsMap();
        Map<String, List<String>> instanceKnownRebecs_ = buildInstanceKnownRebecsMap(instanceToClass);
        analyzeAllCalls(instanceToClass, callsByInstance, classToKnownRebecs, instanceKnownRebecs_);
        printStructureMap(instanceToClass, instanceKnownRebecs, classToMsgServers, callsByInstance);
    }

    private Map<String, Set<String>> collectMessageServers() {
        Map<String, Set<String>> result = new HashMap<>();
        for (ReactiveClassDeclaration rc : classes) {
            Set<String> ms = new HashSet<>();
            if (!rc.getConstructors().isEmpty()) {
                ms.add("constructorOf" + rc.getName());
            }
            for (MsgsrvDeclaration m : rc.getMsgsrvs()) {
                ms.add(m.getName());
            }
            for (MethodDeclaration md : rc.getSynchMethods()) {
                ms.add(md.getName());
            }
            result.put(rc.getName(), ms);
        }
        return result;
    }

    private void printStructureMap(
            Map<String, String> instanceToClass,
            Map<String, List<String>> instanceKnownRebecs,
            Map<String, Set<String>> classToMsgServers,
            Map<String, List<CallDetail>> callsByInstance
    ) {
        System.out.println("=== Rebeca Structure Map ===\n");
        System.out.println("1) Rebecs and their known rebecs:");
        for (String inst : instanceToClass.keySet()) {
            String cls = instanceToClass.get(inst);
            List<String> known = instanceKnownRebecs.getOrDefault(inst, Collections.emptyList());
            System.out.printf("   - %s (Reactive Class: %s) knows: %s\n", inst, cls, known);
        }

        Map<String, List<String>> classToInstances = instanceToClass.entrySet().stream()
                .collect(Collectors.groupingBy(
                        Map.Entry::getValue,
                        Collectors.mapping(Map.Entry::getKey, Collectors.toList())
                ));

        System.out.println("\n2) Declared message servers and calls made by each rebec:");
        for (var cEntry : classToInstances.entrySet()) {
            String cls = cEntry.getKey();
            List<String> insts = cEntry.getValue();
            Set<String> declaredServers = classToMsgServers.getOrDefault(cls, Collections.emptySet());

            System.out.println("   Reactive Class: " + cls);
            for (String inst : insts) {
                System.out.println("      Instance: " + inst);
                for (String s : declaredServers) {
                    System.out.println("         Declares msgSrv: " + s);
                }
                List<CallDetail> callList = callsByInstance.getOrDefault(inst, Collections.emptyList());
                if (callList.isEmpty()) {
                    System.out.println("         (No calls made.)");
                } else {
                    Map<String, Integer> callTally = new HashMap<>();
                    for (CallDetail cd : callList) {
                        callTally.put(cd.msgName, callTally.getOrDefault(cd.msgName, 0) + 1);
                    }
                    System.out.println("         Calls made by " + inst + ":");
                    for (CallDetail cd : callList) {
                        if (cd.isInternal) {
                            System.out.printf("            -> INTERNAL call to %s()\n", cd.msgName);
                        } else {
                            System.out.printf("            -> EXTERNAL call to %s() in rebec '%s'\n",
                                    cd.msgName, cd.externalTargetInstance);
                        }
                    }
                    System.out.println("         Call counts:");
                    for (var c : callTally.entrySet()) {
                        System.out.printf("            %s: %d times\n", c.getKey(), c.getValue());
                    }
                }
            }
        }
    }
}
