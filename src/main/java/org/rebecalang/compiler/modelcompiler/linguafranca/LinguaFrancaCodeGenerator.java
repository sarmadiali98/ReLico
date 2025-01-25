package org.rebecalang.compiler.modelcompiler.linguafranca;

import org.rebecalang.compiler.modelcompiler.corerebeca.objectmodel.*;
import org.rebecalang.compiler.modelcompiler.timedrebeca.objectmodel.TimedRebecaParentSuffixPrimary;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.util.*;
import java.util.stream.Collectors;

public class LinguaFrancaCodeGenerator {

    private final RebecaModel rebecaModel;
    private List<ReactiveClassDeclaration> classes;

    // -----------------------------------------------------------------------
    // Helper Data Classes
    // -----------------------------------------------------------------------

    private static class ConstructorInfo {
        List<ConstructorParam> params = new ArrayList<>();
        List<StateVar> regularStateVars = new ArrayList<>();
        // For each msgsrv name => list of formal parameters
        Map<String, List<FormalParameterDeclaration>> msgsrvToParams = new HashMap<>();
        // Subset of msgsrvToParams that are "external" from Rebeca's perspective
        Map<String, List<FormalParameterDeclaration>> externalMsgsrvsToParams = new HashMap<>();
    }

    private static class ConstructorParam {
        String paramName;     // formal param name
        String stateVarName;  // name of the actual state var
        String type;
        String defaultValue;
    }

    private static class StateVar {
        String name;
        String type;
    }

    /**
     * CallDetail: an invocation of a methodName (msgSrv) either internally (self.foo)
     * or externally (knownRebec.foo). If external, externalTargetInstance is the name
     * of the instance being invoked.
     */
    private static class CallDetail {
        final String msgName;
        final boolean isInternal;
        final String externalTargetInstance;
        String callerMsgsrvName;       // which msgSrv or constructor made this call
        List<Expression> arguments = new ArrayList<>();
        String calleeClass;            // for external calls
        String afterDelayMs;

        CallDetail(String msgName, boolean isInternal, String externalTargetInstance) {
            this.msgName = msgName;
            this.isInternal = isInternal;
            this.externalTargetInstance = externalTargetInstance;
        }
    }

    /**
     * Identify which msgsrvs in each class are considered "internal"
     * based on the fact that they get called via `self.msgsrvName(...)`.
     */
    private Map<String, Set<String>> findInternalMsgServers(Map<String, ConstructorInfo> constructorInfoMap) {
        Map<String, Set<String>> internalMsgsrvs = new HashMap<>();

        // For each reactive class
        for (ReactiveClassDeclaration rc : classes) {
            String cName = rc.getName();

            // We'll collect any msgsrvs that appear in "self.xyz(...)" calls
            Set<String> internalCalls = new HashSet<>();

            // 1) If there's a constructor, analyze it
            for (ConstructorDeclaration cd : rc.getConstructors()) {
                analyzeBlockForInternalCalls(cd.getBlock(), cName, internalCalls);
            }
            // 2) Analyze each msgsrv block
            for (MsgsrvDeclaration msgs : rc.getMsgsrvs()) {
                analyzeBlockForInternalCalls(msgs.getBlock(), cName, internalCalls);
            }
            // 3) Analyze each synchronous method block
            for (MethodDeclaration md : rc.getSynchMethods()) {
                analyzeBlockForInternalCalls(md.getBlock(), cName, internalCalls);
            }

            // Next, gather all possible msgsrvs (including the pseudo "constructorOf<Class>")
            Set<String> allMsgsrvs = new HashSet<>();
            if (!rc.getConstructors().isEmpty()) {
                allMsgsrvs.add("constructorOf" + cName);
            }
            for (MsgsrvDeclaration m : rc.getMsgsrvs()) {
                allMsgsrvs.add(m.getName());
            }
            // If your code also treats synch methods like msgsrvs, include them here:
            for (MethodDeclaration syn : rc.getSynchMethods()) {
                allMsgsrvs.add(syn.getName());
            }

            // Now filter out which of those are "internal" by seeing if they appear in `internalCalls`
            // Also, we often treat the constructorOfX as implicitly "internal"
            Set<String> internalServerNames = new HashSet<>();
            for (String m : allMsgsrvs) {
                // If you want the constructor always to be considered internal:
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
     * Holds the lines of code generated for a reaction, plus the sets
     * of actions or ports used (so we can put them in the reaction signature).
     */
    private static class ReactionContent {
        String code = "";
        Set<String> scheduledActions = new LinkedHashSet<>();
        Set<String> usedPorts = new LinkedHashSet<>();
    }

    public LinguaFrancaCodeGenerator(RebecaModel rebecaModel) {
        this.rebecaModel = rebecaModel;
    }

    // -----------------------------------------------------------------------
    // Public method: main entry
    // -----------------------------------------------------------------------
    public void generateCode(String outputPath) {

        StringBuilder lfCode = new StringBuilder();
        lfCode.append("target Cpp;\n\n");

        // 1) Gather classes
        classes = rebecaModel.getRebecaCode().getReactiveClassDeclaration();

        // 2) Build constructor info (which state vars are from constructor params, etc.)
        Map<String, ConstructorInfo> constructorInfoMap = new HashMap<>();
        for (ReactiveClassDeclaration rc : classes) {
            ConstructorInfo cInfo = buildConstructorInfo(rc);
            constructorInfoMap.put(rc.getName(), cInfo);
        }

        // 3) Find internal vs. external msgSrvs
        Map<String, Set<String>> internalMsgsrvs = findInternalMsgServers(constructorInfoMap);

        // 4) instance->class map, known rebecs, etc.
        Map<String, String> instanceToClass = buildInstanceToClassMap();
        Map<String, List<String>> classToKnownRebecs = buildClassToKnownRebecsMap();
        Map<String, List<String>> instanceKnownRebecs = buildInstanceKnownRebecsMap(instanceToClass);

        // 5) Analyze all calls => callsByInstance
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

            // For each msgsrv, if used externally => define a struct
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

        // 7) Generate one LF reactor per Rebeca class
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

            // --- Step A: create I/O ports for external calls ---
            Set<String> declaredPorts = new LinkedHashSet<>();
            // (a) Outputs: for calls *made by* any instance of this class
            for (Map.Entry<String, List<CallDetail>> entry : callsByInstance.entrySet()) {
                String callerInstance = entry.getKey();
                String callerClass = instanceToClass.get(callerInstance);
                if (!callerClass.equals(className)) {
                    continue; // not relevant to this class
                }
                // calls from this instance => create out ports
                for (CallDetail cd : entry.getValue()) {
                    if (!cd.isInternal) {
                        // external call => need an out port
                        String calleeInst = cd.externalTargetInstance;
                        String outPortName = cd.msgName + "_to_" + calleeInst + "_from_" + callerInstance + "_out";
                        if (!declaredPorts.contains(outPortName)) {
                            declaredPorts.add(outPortName);
                            // figure out struct name / type
                            String calleeClass = instanceToClass.get(calleeInst);
                            List<FormalParameterDeclaration> fps = constructorInfoMap.get(calleeClass)
                                    .msgsrvToParams
                                    .getOrDefault(cd.msgName, Collections.emptyList());
                            String lfType = (fps.isEmpty()) ? "int" : (calleeClass + "_" + cd.msgName);
                            lfCode.append("    output ").append(outPortName).append(": ").append(lfType).append(";\n");
                        }
                    }
                }
            }

            // (b) Inputs: for calls *received by* this class’s instances
            //    i.e., if some other instance calls <thisClassInstance>.<msgName>
            //    we need "input <msgName>_to_<thisInstance>_from_<thatInstance>_in"
            Map<String,Set<String>> inputsByMsgsrv = new HashMap<>();
            for (List<CallDetail> callList : callsByInstance.values()) {
                for (CallDetail cd : callList) {
                    if (!cd.isInternal && instanceToClass.get(cd.externalTargetInstance).equals(className)) {
                        // we are the callee
                        String callerInst = findCallerInstanceFor(cd, callsByInstance);
                        if (callerInst == null) {
                            callerInst = "unknownCaller"; // fallback
                        }
                        String portName = cd.msgName + "_to_" + cd.externalTargetInstance
                                + "_from_" + callerInst
                                + "_in";
                        if (!declaredPorts.contains(portName)) {
                            declaredPorts.add(portName);
                            // figure out struct type
                            List<FormalParameterDeclaration> fps = cInfo.msgsrvToParams.getOrDefault(cd.msgName, Collections.emptyList());
                            String lfType = (fps.isEmpty()) ? "int" : (className + "_" + cd.msgName);
                            lfCode.append("    input ").append(portName).append(": ").append(lfType).append(";\n");
                        }
                        // keep track so we can generate a reaction for that msgsrv
                        inputsByMsgsrv.computeIfAbsent(cd.msgName, k -> new LinkedHashSet<>())
                                .add(portName);
                    }
                }
            }

            // --- Step B: State variables ---
            //  - normal ones
            for (StateVar sv : cInfo.regularStateVars) {
                lfCode.append("    state ").append(sv.name)
                        .append(": ").append(sv.type).append("\n");
            }
            //  - param placeholders for internal msgSrv calls
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

            // --- Step C: create logical actions for internal msgSrvs ---
            for (String m : internalServers) {
                if (!m.startsWith("constructorOf")) {
                    lfCode.append("    logical action ").append(m).append(";\n");
                }
            }

            // --- Step D: Generate Reaction for each internal msgsrv ---
            for (String m : internalServers) {
                if (m.startsWith("constructorOf")) continue;
                ReactionContent rContent = generateMsgsrvReactionBody(rc, m, className, cInfo, instanceToClass, callsByInstance);
                lfCode.append("    reaction(").append(m).append(")");
                // combine scheduledActions + usedPorts into arrow signature
                if (!rContent.scheduledActions.isEmpty() || !rContent.usedPorts.isEmpty()) {
                    lfCode.append(" -> ");
                    List<String> outputs = new ArrayList<>();
                    outputs.addAll(rContent.scheduledActions);
                    outputs.addAll(rContent.usedPorts);
                    for (int i = 0; i < outputs.size(); i++) {
                        if (i>0) lfCode.append(", ");
                        lfCode.append(outputs.get(i));
                    }
                }
                lfCode.append(" {=\n");
                lfCode.append(rContent.code);
                lfCode.append("    =}\n");
            }

            // --- Step E: If there's a constructor => reaction(startup) with inline code ---
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
                            if (i>0) lfCode.append(", ");
                            lfCode.append(outputs.get(i));
                        }
                    }
                    lfCode.append(" {=\n");
                    lfCode.append(rContent.code);
                    lfCode.append("    =}\n");
                }
            }

            // --- Step F: External msgSrvs => one reaction per input port ---
            for (Map.Entry<String,Set<String>> entry : inputsByMsgsrv.entrySet()) {
                String externalMsgsrvName = entry.getKey();
                Set<String> portNames = entry.getValue();
                if (portNames.isEmpty()) continue;

                // find that message declaration
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

        // 8) main reactor
        MainDeclaration mainDecl = rebecaModel.getRebecaCode().getMainDeclaration();
        if (mainDecl != null) {
            lfCode.append("main reactor {\n");

            // Instantiate each rebec
            for (MainRebecDefinition md : mainDecl.getMainRebecDefinition()) {
                String instName = md.getName();
                String clsName = md.getType().getTypeName();
                ConstructorInfo cInfo = constructorInfoMap.get(clsName);

                lfCode.append("    ")
                        .append(instName)
                        .append(" = new ")
                        .append(clsName);

                List<Expression> cArgs = md.getArguments();
                if (!cInfo.params.isEmpty()) {
                    lfCode.append("(");
                    for (int i = 0; i < cInfo.params.size(); i++) {
                        if (i>0) lfCode.append(", ");
                        ConstructorParam cp = cInfo.params.get(i);
                        String paramVal = cp.defaultValue;
                        if (cArgs!=null && i<cArgs.size()) {
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

            // Create connections for external calls
            lfCode.append(generateConnectionStatements(callsByInstance, instanceToClass));
            lfCode.append("}\n\n");
        }

        // 9) Write to file
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(outputPath))) {
            writer.write(lfCode.toString());
        } catch (IOException e) {
            e.printStackTrace();
        }

        // (Optional) structure map
        analyzeAndPrintStructureMap();
    }

    // -----------------------------------------------------------------------
    // Check if a msgsrv is actually used externally (i.e. some other rebec calls it)
    // -----------------------------------------------------------------------
    private boolean isMsgsrvExternallyUsed(
            String msgsrvName,
            String className,
            Map<String, List<CallDetail>> callsByInstance,
            Map<String, String> instanceToClass
    ) {
        for (List<CallDetail> callList : callsByInstance.values()) {
            for (CallDetail cd : callList) {
                if (!cd.isInternal && cd.msgName.equals(msgsrvName)) {
                    // see if the target class is className
                    String tgtCls = instanceToClass.get(cd.externalTargetInstance);
                    if (className.equals(tgtCls)) {
                        return true;
                    }
                }
            }
        }
        return false;
    }

    // -----------------------------------------------------------------------
    // Reaction generation for an internal msgSrv
    // -----------------------------------------------------------------------
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
        if (found == null || found.getBlock()==null) {
            return rContent;
        }
        // parse block inline
        rContent.code = parseBlockStatementInline(
                found.getBlock(),
                className,
                msgsrvName,
                cInfo,
                instanceToClass,
                callsByInstance,
                rContent.scheduledActions,
                rContent.usedPorts,
                /* externalParamMapping = */null
        );
        return rContent;
    }

    // -----------------------------------------------------------------------
    // Reaction generation for the constructor => reaction(startup)
    // -----------------------------------------------------------------------
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
                /* no msgsrv => use empty string */ "",
                cInfo,
                instanceToClass,
                callsByInstance,
                rc.scheduledActions,
                rc.usedPorts,
                null
        );
        return rc;
    }

    // -----------------------------------------------------------------------
    // Reaction generation for an external msgsrv triggered by some input port
    // We pass the portName to allow param references like "(*portName.get()).x"
    // -----------------------------------------------------------------------
    private ReactionContent generateExternalMsgsrvReactionBody(
            MsgsrvDeclaration externalMsgSrvDecl,
            String portName,
            String className,
            ConstructorInfo cInfo,
            Map<String, String> instanceToClass,
            Map<String, List<CallDetail>> callsByInstance
    ) {
        ReactionContent rc = new ReactionContent();
        if (externalMsgSrvDecl == null || externalMsgSrvDecl.getBlock()==null) {
            return rc;
        }

        // Build "externalParamMapping": formalParamName -> "(*portName.get()).paramName"
        Map<String,String> externalParamMapping = new HashMap<>();
        List<FormalParameterDeclaration> fps = cInfo.msgsrvToParams.getOrDefault(externalMsgSrvDecl.getName(), Collections.emptyList());
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



    // -----------------------------------------------------------------------
    // parseBlockStatementInline => walk Rebeca statements in order, building code lines
    // -----------------------------------------------------------------------
    /**
     * Transforms Rebeca statements into lines of LF code placed in the reaction body.
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
            // (existing logic for block statements)
            for (Statement sub : bs.getStatements()) {
                sb.append(parseBlockStatementInline(
                        sub, className, currentMsgsrvName, cInfo,
                        instanceToClass, callsByInstance,
                        scheduledActions, usedPorts, externalParamMapping
                ));
            }

        } else if (stmt instanceof ConditionalStatement cs) {
            // (existing logic for if/else)
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
            // NEW LOGIC for for-loops
            String initPart = fs.getForInitializer().toString();

            String condStr = "";
            if (fs.getCondition() != null) {
                condStr = transformExpression(fs.getCondition(), currentMsgsrvName, cInfo, externalParamMapping);
            }

            // parse updates
            String updatePart = fs.getForIncrement().toString();

            // produce the 'for(...)' line
            sb.append("        for (")
                    .append(initPart).append("; ")
                    .append(condStr).append("; ")
                    .append(updatePart).append(") {\n");

            // parse the loop body
            sb.append(parseBlockStatementInline(
                    fs.getStatement(),
                    className, currentMsgsrvName, cInfo,
                    instanceToClass, callsByInstance,
                    scheduledActions, usedPorts,
                    externalParamMapping
            ));
            sb.append("        }\n");

        } else if (stmt instanceof WhileStatement ws) {
            // Example for while
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
            // (existing logic for expression statements)
            sb.append(
                    processExpressionInline(
                            expr,
                            className, currentMsgsrvName, cInfo,
                            instanceToClass, callsByInstance,
                            scheduledActions, usedPorts,
                            externalParamMapping
                    )
            );

        } else {
            // fallback for unhandled statement types
            sb.append("        // Unhandled statement type: ")
                    .append(stmt.getClass().getSimpleName())
                    .append("\n");
        }
        return sb.toString();
    }


    // -----------------------------------------------------------------------
    // processExpressionInline => produce code lines for assignment, internal calls, or external calls
    // in the exact order we see them in Rebeca code
    // -----------------------------------------------------------------------
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
            // Handle assignment or other binary ops
            if ("=".equals(be.getOperator())) {
                String leftStr  = transformExpression(be.getLeft(),
                        currentMsgsrvName, cInfo, externalParamMapping);
                String rightStr = transformExpression(be.getRight(),
                        currentMsgsrvName, cInfo, externalParamMapping);
                sb.append("        ").append(leftStr).append(" = ").append(rightStr).append(";\n");
            } else {
                // Recurse on subexpressions
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
            // Recurse first
            sb.append(processExpressionInline(dot.getLeft(),
                    className, currentMsgsrvName, cInfo,
                    instanceToClass, callsByInstance,
                    scheduledActions, usedPorts, externalParamMapping));
            sb.append(processExpressionInline(dot.getRight(),
                    className, currentMsgsrvName, cInfo,
                    instanceToClass, callsByInstance,
                    scheduledActions, usedPorts, externalParamMapping));

            // Check if it's a method call
            if (dot.getRight() instanceof TermPrimary methodTerm) {
                String methodName = methodTerm.getName();
                ParentSuffixPrimary psp = methodTerm.getParentSuffixPrimary();
                List<Expression> argList = (psp == null) ? Collections.emptyList() : psp.getArguments();

                // 1) INTERNAL CALL: self.method(...)
                if (dot.getLeft() instanceof TermPrimary leftTerm && "self".equals(leftTerm.getName())) {

                    // Find the matching CallDetail for the current msgsrv
                    for (Map.Entry<String, List<CallDetail>> e : callsByInstance.entrySet()) {
                        String callerInstance = e.getKey();
                        String callerClass    = instanceToClass.get(callerInstance);
                        if (!callerClass.equals(className)) {
                            continue;
                        }
                        for (CallDetail cd : e.getValue()) {
                            if (cd.isInternal && cd.msgName.equals(methodName)
                                    && currentMsgsrvName.equals(cd.callerMsgsrvName)) {

                                // A) Assign parameters
                                List<FormalParameterDeclaration> fps =
                                        cInfo.msgsrvToParams.getOrDefault(methodName, Collections.emptyList());
                                for (int i = 0; i < fps.size(); i++) {
                                    FormalParameterDeclaration fpd = fps.get(i);
                                    String paramName = fpd.getName() + "_for_" + methodName;
                                    String paramVal  = (i < argList.size())
                                            ? transformExpression(argList.get(i), currentMsgsrvName, cInfo, externalParamMapping)
                                            : getDefaultValueForType(mapRebecaTypeToLF(fpd.getType().getTypeName()));
                                    sb.append("        ")
                                            .append(paramName)
                                            .append(" = ")
                                            .append(paramVal)
                                            .append(";\n");
                                }

                                // B) Schedule the action with delay (if any)
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

                    // 2) EXTERNAL CALL: knownRebec.method(...)
                } else if (dot.getLeft() instanceof TermPrimary knownField) {
                    // Generate .set(...) lines for external calls
                    for (Map.Entry<String, List<CallDetail>> e : callsByInstance.entrySet()) {
                        String callerInstance = e.getKey();
                        String callerClass    = instanceToClass.get(callerInstance);
                        if (!callerClass.equals(className)) {
                            continue;
                        }
                        for (CallDetail cd : e.getValue()) {
                            if (!cd.isInternal && cd.msgName.equals(methodName)
                                    && currentMsgsrvName.equals(cd.callerMsgsrvName)) {

                                // We won't do the 'after(...)' delay here for external calls.
                                // That belongs in the main reactor with "-> ... after Xms".
                                String outPort = methodName + "_to_"
                                        + cd.externalTargetInstance + "_from_"
                                        + callerInstance + "_out";

                                // Figure out struct type
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

                                // Build struct initializer
                                StringBuilder structInit = new StringBuilder();
                                structInit.append(structType).append("{");
                                for (int i = 0; i < argList.size(); i++) {
                                    if (i > 0) structInit.append(", ");
                                    String exprStr = transformExpression(argList.get(i),
                                            currentMsgsrvName, cInfo, externalParamMapping);
                                    structInit.append(exprStr);
                                }
                                structInit.append("}");

                                // Output the .set(...) line
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
            // No action needed for a literal alone

        } else if (expr instanceof TermPrimary) {
            // Single identifier statement => no-op
        }

        return sb.toString();
    }

    // -----------------------------------------------------------------------
    // Utility: find which instance actually invoked a given CallDetail (heuristic)
    // If we can't find it, returns null.
    // -----------------------------------------------------------------------
    private String findCallerInstanceFor(CallDetail cd, Map<String, List<CallDetail>> callsByInstance) {
        for (Map.Entry<String, List<CallDetail>> e : callsByInstance.entrySet()) {
            List<CallDetail> list = e.getValue();
            if (list.contains(cd)) {
                return e.getKey();
            }
        }
        return null;
    }

    // -----------------------------------------------------------------------
    // lookup the msgsrv in a class's list
    // -----------------------------------------------------------------------
    private MsgsrvDeclaration findMsgsrv(ReactiveClassDeclaration rc, String msgsrvName) {
        for (MsgsrvDeclaration m : rc.getMsgsrvs()) {
            if (m.getName().equals(msgsrvName)) {
                return m;
            }
        }
        return null;
    }

    // -----------------------------------------------------------------------
    // Build the "a.out -> b.in" lines in main
    // -----------------------------------------------------------------------
    private String generateConnectionStatements(
            Map<String, List<CallDetail>> callsByInstance,
            Map<String, String> instanceToClass
    ) {
        StringBuilder sb = new StringBuilder();
        Set<String> uniqueConnections = new LinkedHashSet<>();

        for (Map.Entry<String, List<CallDetail>> callerEntry : callsByInstance.entrySet()) {
            String callerInst = callerEntry.getKey();
            for (CallDetail cd : callerEntry.getValue()) {
                // Only for external calls
                if (!cd.isInternal) {
                    String calleeInst = cd.externalTargetInstance;
                    String msg = cd.msgName;
                    String outPort = msg + "_to_" + calleeInst + "_from_" + callerInst + "_out";
                    String inPort  = msg + "_to_" + calleeInst + "_from_" + callerInst + "_in";

                    // Base connection line
                    String connection = callerInst + "." + outPort
                            + " -> "
                            + calleeInst + "." + inPort;

                    // If there's an after(...) delay, place it in the main reactor connection
                    if (cd.afterDelayMs != null && !cd.afterDelayMs.isEmpty()) {
                        connection += " after " + cd.afterDelayMs + "ms";
                    }

                    uniqueConnections.add(connection);
                }
            }
        }

        // Output each unique connection
        for (String c : uniqueConnections) {
            sb.append("    ").append(c).append(";\n");
        }
        return sb.toString();
    }

    // -----------------------------------------------------------------------
    // Build constructor info for a class
    // -----------------------------------------------------------------------
    private ConstructorInfo buildConstructorInfo(ReactiveClassDeclaration rc) {
        ConstructorInfo cInfo = new ConstructorInfo();
        // gather all state vars
        Map<String,String> statevarNameToType = new HashMap<>();
        if (rc.getStatevars()!=null) {
            for (FieldDeclaration fd : rc.getStatevars()) {
                for (VariableDeclarator vd : fd.getVariableDeclarators()) {
                    statevarNameToType.put(vd.getVariableName(), fd.getType().getTypeName());
                }
            }
        }
        // check if we have a constructor
        ConstructorDeclaration cDec = rc.getConstructors().isEmpty() ? null : rc.getConstructors().get(0);

        if (cDec == null) {
            // no explicit constructor => everything is a normal var
            for (var e : statevarNameToType.entrySet()) {
                StateVar sv = new StateVar();
                sv.name = e.getKey();
                sv.type = mapRebecaTypeToLF(e.getValue());
                cInfo.regularStateVars.add(sv);
            }
        } else {
            // parse the constructor's param->statevar assignment
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
            // the rest become normal vars
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

        // fill in msgsrv->params
        for (MsgsrvDeclaration md : rc.getMsgsrvs()) {
            cInfo.msgsrvToParams.put(md.getName(), md.getFormalParameters());
        }

        // figure out external vs. internal from Rebeca's standpoint
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

    private void parseConstructorBlockForAssignments(Statement stmt, Map<String, String> paramToStateVar) {
        if (stmt == null) return;
        if (stmt instanceof BlockStatement bs) {
            for (Statement s : bs.getStatements()) {
                parseConstructorBlockForAssignments(s, paramToStateVar);
            }
        } else if (stmt instanceof ConditionalStatement cs) {
            parseConstructorBlockForAssignments(cs.getStatement(), paramToStateVar);
            if (cs.getElseStatement()!=null) {
                parseConstructorBlockForAssignments(cs.getElseStatement(), paramToStateVar);
            }
        } else if (stmt instanceof Expression ex) {
            if (ex instanceof BinaryExpression be && "=".equals(be.getOperator())) {
                // typically "stateVar = param"
                if (be.getLeft() instanceof TermPrimary leftTerm && be.getRight() instanceof TermPrimary rightTerm) {
                    // param => leftTerm
                    paramToStateVar.put(rightTerm.getName(), leftTerm.getName());
                }
            }
        }
    }

    private void analyzeBlockForInternalCalls(Statement stmt, String className, Set<String> internalCalls) {
        if (stmt == null) return;
        if (stmt instanceof BlockStatement bs) {
            for (Statement s : bs.getStatements()) {
                analyzeBlockForInternalCalls(s, className, internalCalls);
            }
        } else if (stmt instanceof ConditionalStatement cs) {
            analyzeBlockForInternalCalls(cs.getStatement(), className, internalCalls);
            if (cs.getElseStatement()!=null) {
                analyzeBlockForInternalCalls(cs.getElseStatement(), className, internalCalls);
            }
        } else if (stmt instanceof Expression ex) {
            analyzeExpressionForInternalCalls(ex, className, internalCalls);
        }
    }

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

    private Map<String,String> buildInstanceToClassMap() {
        Map<String,String> map = new HashMap<>();
        MainDeclaration mainDecl = rebecaModel.getRebecaCode().getMainDeclaration();
        if (mainDecl!=null) {
            for (MainRebecDefinition mrd : mainDecl.getMainRebecDefinition()) {
                map.put(mrd.getName(), mrd.getType().getTypeName());
            }
        }
        return map;
    }

    private Map<String,List<String>> buildClassToKnownRebecsMap() {
        Map<String,List<String>> map = new HashMap<>();
        for (ReactiveClassDeclaration rc : classes) {
            List<String> knowns = new ArrayList<>();
            if (rc.getKnownRebecs()!=null) {
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

    private Map<String,List<String>> buildInstanceKnownRebecsMap(Map<String,String> instanceToClass) {
        Map<String,List<String>> res = new HashMap<>();
        MainDeclaration md = rebecaModel.getRebecaCode().getMainDeclaration();
        if (md==null) return res;

        // gather class->listOfKnownFields
        Map<String,List<String>> classToKnownFields = new HashMap<>();
        for (ReactiveClassDeclaration rc : classes) {
            List<String> knownVars = new ArrayList<>();
            if (rc.getKnownRebecs()!=null) {
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
            if (bindings!=null && bindings.size()==fields.size()) {
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

    // -----------------------------------------------------------------------
    // analyzeAllCalls => fill callsByInstance with internal or external calls
    // -----------------------------------------------------------------------
    private void analyzeAllCalls(
            Map<String, String> instanceToClass,
            Map<String, List<CallDetail>> callsByInstance,
            Map<String, List<String>> classToKnownRebecs,
            Map<String, List<String>> instanceKnownRebecs
    ) {
        for (ReactiveClassDeclaration rc : classes) {
            String cName = rc.getName();
            // constructor
            for (ConstructorDeclaration cDec : rc.getConstructors()) {
                parseBlockStatement(cDec.getBlock(), cName, instanceToClass, callsByInstance,
                        classToKnownRebecs, instanceKnownRebecs, "");
            }
            // msgsrv
            for (MsgsrvDeclaration md : rc.getMsgsrvs()) {
                parseBlockStatement(md.getBlock(), cName, instanceToClass, callsByInstance,
                        classToKnownRebecs, instanceKnownRebecs, md.getName());
            }
            // synch methods
            for (MethodDeclaration synM : rc.getSynchMethods()) {
                parseBlockStatement(synM.getBlock(), cName, instanceToClass, callsByInstance,
                        classToKnownRebecs, instanceKnownRebecs, synM.getName());
            }
        }
    }

    private void parseBlockStatement(
            Statement stmt,
            String currentClass,
            Map<String,String> instanceToClass,
            Map<String,List<CallDetail>> callsByInstance,
            Map<String,List<String>> classToKnownRebecs,
            Map<String,List<String>> instanceKnownRebecs,
            String currentMsgsrvName
    ) {
        if (stmt==null) return;
        if (stmt instanceof BlockStatement bs) {
            for (Statement s : bs.getStatements()) {
                parseBlockStatement(s, currentClass, instanceToClass, callsByInstance,
                        classToKnownRebecs, instanceKnownRebecs, currentMsgsrvName);
            }
        } else if (stmt instanceof ConditionalStatement cs) {
            parseBlockStatement(cs.getStatement(), currentClass, instanceToClass, callsByInstance,
                    classToKnownRebecs, instanceKnownRebecs, currentMsgsrvName);
            if (cs.getElseStatement()!=null) {
                parseBlockStatement(cs.getElseStatement(), currentClass, instanceToClass, callsByInstance,
                        classToKnownRebecs, instanceKnownRebecs, currentMsgsrvName);
            }
        } else if (stmt instanceof Expression ex) {
            parseExpression(ex, currentClass, instanceToClass, callsByInstance,
                    classToKnownRebecs, instanceKnownRebecs, currentMsgsrvName);
        }
    }

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
            // (1) Recurse on subexpressions first
            parseExpression(dot.getLeft(), currentClass, instanceToClass,
                    callsByInstance, classToKnownRebecs, instanceKnownRebecs,
                    currentMsgsrvName);
            parseExpression(dot.getRight(), currentClass, instanceToClass,
                    callsByInstance, classToKnownRebecs, instanceKnownRebecs,
                    currentMsgsrvName);

            // (2) Check if the right side is a method call
            if (dot.getRight() instanceof TermPrimary methodTerm) {
                String methodName = methodTerm.getName();
                ParentSuffixPrimary psp = methodTerm.getParentSuffixPrimary();
                List<Expression> argList = (psp == null)
                        ? Collections.emptyList()
                        : psp.getArguments();

                // Extract the 'after(...)' delay if it's a TimedRebecaParentSuffixPrimary
                String afterDelayMs = null;
                if (psp instanceof TimedRebecaParentSuffixPrimary timedPSP) {
                    Expression afterExpr = timedPSP.getAfterExpression();
                    if (afterExpr != null) {
                        // Convert the 'after' expression to a string, e.g. "1" in after(1)
                        afterDelayMs = expressionToString(afterExpr, "int", "0");
                    }
                }

                // A) "self.method(...)"
                if (dot.getLeft() instanceof TermPrimary leftTerm && "self".equals(leftTerm.getName())) {
                    // => internal call
                    for (Map.Entry<String, String> e : instanceToClass.entrySet()) {
                        if (e.getValue().equals(currentClass)) {
                            CallDetail cd = new CallDetail(methodName, true, "");
                            cd.arguments         = argList;
                            cd.callerMsgsrvName = currentMsgsrvName;
                            cd.calleeClass      = currentClass;

                            // If there's an after(...) expression, store it
                            if (afterDelayMs != null) {
                                cd.afterDelayMs = afterDelayMs;
                            }

                            callsByInstance.get(e.getKey()).add(cd);
                        }
                    }

                    // B) "knownRebec.method(...)"
                } else if (dot.getLeft() instanceof TermPrimary knownField) {
                    // => external call if knownField is in known rebecs of currentClass
                    if (classToKnownRebecs
                            .getOrDefault(currentClass, Collections.emptyList())
                            .contains(knownField.getName())) {

                        // For each instance that belongs to currentClass, figure out which rebec is bound
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
                                String calleeCls     = instanceToClass.get(targetInstance);

                                CallDetail cd = new CallDetail(methodName, false, targetInstance);
                                cd.arguments         = argList;
                                cd.callerMsgsrvName = currentMsgsrvName;
                                cd.calleeClass      = calleeCls;

                                // If there's an after(...) expression, store it
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

    // -----------------------------------------------------------------------
    // Expression -> textual representation (for arguments etc.)
    // -----------------------------------------------------------------------
    private String transformExpression(
            Expression expr,
            String msgsrvName,
            ConstructorInfo cInfo,
            Map<String,String> externalParamMapping
    ) {
        if (expr==null) return "";
        if (expr instanceof Literal lit) {
            return lit.getLiteralValue();
        }
        if (expr instanceof TermPrimary tp) {
            String raw = tp.getName();
            if (externalParamMapping!=null && externalParamMapping.containsKey(raw)) {
                return externalParamMapping.get(raw);
            }
            // see if it's a msgsrv param
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
            // we'll produce something like "left.right" but ignoring the argument list
            String left = transformExpression(dp.getLeft(), msgsrvName, cInfo, externalParamMapping);
            String right = transformExpression(dp.getRight(), msgsrvName, cInfo, externalParamMapping);
            if (left.isEmpty()) return right;
            return left + "." + right;
        }
        return "";
    }

    // rename msgSrv param => param_for_msgSrvName
    private String renameIfParam(String rawName, String msgsrvName, ConstructorInfo cInfo) {
        if (msgsrvName==null || msgsrvName.isEmpty()) return rawName;
        List<FormalParameterDeclaration> fps = cInfo.msgsrvToParams.getOrDefault(msgsrvName, Collections.emptyList());
        for (FormalParameterDeclaration fp : fps) {
            if (fp.getName().equals(rawName)) {
                return rawName + "_for_" + msgsrvName;
            }
        }
        return rawName;
    }

    private String mapRebecaTypeToLF(String rebType) {
        return switch(rebType) {
            case "boolean" -> "bool";
            case "int","byte" -> "int";
            case "double" -> "double";
            default -> rebType;
        };
    }

    private String getDefaultValueForType(String lfType) {
        return switch(lfType) {
            case "bool" -> "false";
            case "double" -> "0.0";
            default -> "0";
        };
    }

    // For printing constructor arguments in main
    private String expressionToString(Expression expr, String lfType, String fallback) {
        if (expr==null) return fallback;
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
        // fallback
        return fallback;
    }

    // quick helper to retrieve constructor info for some callee class
    private ConstructorInfo cInfoFor(String cls, Map<String,String> inst2cls) {
        // not the best signature, but let's assume we have a global map in real code
        // we can do a loop or store a global. For brevity, let's do a quick search in the fields:
        // Actually let's keep a field "Map<String, ConstructorInfo>" as a member so, we can do: constructorInfoMap.get(cls)
        // ... But let's do a hack here:
        for (ReactiveClassDeclaration rcd : classes) {
            if (rcd.getName().equals(cls)) {
                return buildConstructorInfo(rcd); // or cached
            }
        }
        return new ConstructorInfo(); // fallback
    }

    // -----------------------------------------------------------------------
    // (Optional) Debug: structure analysis
    // -----------------------------------------------------------------------
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
    // -----------------------------------------------------------------------
    // Print final structure for debugging
    // -----------------------------------------------------------------------
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
