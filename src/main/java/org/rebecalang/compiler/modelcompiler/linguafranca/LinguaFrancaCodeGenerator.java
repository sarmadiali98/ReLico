package org.rebecalang.compiler.modelcompiler.linguafranca;

import org.rebecalang.compiler.modelcompiler.corerebeca.objectmodel.*;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.util.*;
import java.util.stream.Collectors;

public class LinguaFrancaCodeGenerator {
    private final RebecaModel rebecaModel;
    private List<ReactiveClassDeclaration> classes;

    public LinguaFrancaCodeGenerator(RebecaModel rebecaModel) {
        this.rebecaModel = rebecaModel;
    }

    public void generateCode(String outputPath) {
        StringBuilder lfCode = new StringBuilder();

        // 1) "target Cpp;"
        lfCode.append("target Cpp;\n\n");

        // 2) Gather all Rebeca classes
        classes = rebecaModel.getRebecaCode().getReactiveClassDeclaration();
        //System.out.println("DEBUG: Found " + classes.size() + " reactive classes.");

        // 3) Precompute constructor + statevar info
        Map<String, ConstructorInfo> constructorInfoMap = new HashMap<>();
        for (ReactiveClassDeclaration rc : classes) {
            ConstructorInfo cInfo = buildConstructorInfo(rc);
            constructorInfoMap.put(rc.getName(), cInfo);
            //System.out.println("DEBUG: Built ConstructorInfo for class " + rc.getName());
        }

        // 4) Collect Internal Message Servers
        Map<String, Set<String>> internalMsgsrvs = findInternalMsgServers(constructorInfoMap);

        // (D) callsByInstance
        Map<String, List<CallDetail>> callsByInstance = new HashMap<>();
        Map<String, String> instanceToClass = buildInstanceToClassMap();
        for (String inst : instanceToClass.keySet()) {
            callsByInstance.put(inst, new ArrayList<>());
        }

        // (E) class->list of known rebecs
        Map<String, List<String>> classToKnownRebecs = buildClassToKnownRebecsMap();
        // (F) instance->list of known rebecs
        Map<String, List<String>> instanceKnownRebecs = buildInstanceKnownRebecsMap(instanceToClass);

        // Parse all code blocks to discover calls (internal/external)
        analyzeAllCalls(instanceToClass, callsByInstance, classToKnownRebecs, instanceKnownRebecs);

        // 5) Generate structs (for external msgsrvs)
        lfCode.append("public preamble {=\n");
        for (ReactiveClassDeclaration rc : classes) {
            String className = rc.getName();
            ConstructorInfo cInfo = constructorInfoMap.get(className);

            // For each external msgsrv in the class => create a struct
            for (String msgsrvName : cInfo.externalMsgsrvsToParams.keySet()) {
                List<FormalParameterDeclaration> params = cInfo.externalMsgsrvsToParams.get(msgsrvName);
                lfCode.append("    struct ")
                        .append(className).append("_").append(msgsrvName)
                        .append(" {\n");
                if (params.isEmpty()) {
                    // If no parameters => default_arg
                    lfCode.append("        int default_arg;\n");
                } else {
                    for (FormalParameterDeclaration param : params) {
                        lfCode.append("        ")
                                .append(mapRebecaTypeToLF(param.getType().getTypeName()))
                                .append(" ")
                                .append(param.getName())
                                .append(";\n");
                    }
                }
                lfCode.append("    };\n");
            }
        }
        lfCode.append("=}\n\n");

        // 6) Group external calls by class + generate I/O declarations
        Map<String, Map<String, Map<String, List<ExternalCall>>>> externalCallsByClass =
                groupExternalCallsByClass(callsByInstance, instanceToClass, constructorInfoMap);

        //System.out.println("DEBUG: externalCallsByClass: " + externalCallsByClass);

        // 7) Generate the reactors (one per reactive class)
        for (ReactiveClassDeclaration rc : classes) {
            String className = rc.getName();
            //System.out.println("\n\nDEBUG: Starting reactor generation for " + className);
            ConstructorInfo cInfo = constructorInfoMap.get(className);

            lfCode.append("reactor ").append(className);

            // If we have constructor-based statevars => they become parameters
            if (!cInfo.params.isEmpty()) {
                lfCode.append("(");
                for (int i = 0; i < cInfo.params.size(); i++) {
                    if (i > 0) lfCode.append(", ");
                    ConstructorParam param = cInfo.params.get(i);
                    lfCode.append(param.stateVarName)
                            .append(": ")
                            .append(param.type)
                            .append(" = ")
                            .append(param.defaultValue);
                }
                lfCode.append(")");
            }
            lfCode.append(" {\n");

            // We'll track which ports have already been created in this reactor
            Set<String> alreadyGeneratedPorts = new HashSet<>();
            // We'll store input ports in a map: msgsrvName -> list of portNames
            Map<String, List<String>> inputsByMsgsrv = new HashMap<>();

            // Instead of only checking externalCallsByClass.get(className),
            // we iterate over ALL entries and create outputs if we're the caller,
            // inputs if we're the callee. This allows a once-callee to also be a caller.
            for (Map<String, Map<String, List<ExternalCall>>> mapPerInstance : externalCallsByClass.values()) {
                for (Map<String, List<ExternalCall>> mapPerMsgName : mapPerInstance.values()) {
                    for (List<ExternalCall> relevantCalls : mapPerMsgName.values()) {
                        for (ExternalCall ec : relevantCalls) {
                            // If this class is the caller => output port
                            if (ec.getCallerClass().equals(className)) {
                                String portName = ec.getMsgsrvName() + "_to_"
                                        + ec.getTargetInstance() + "_from_" + ec.getCallerInstance()
                                        + "_out";
                                if (!alreadyGeneratedPorts.contains(portName)) {
                                    //System.out.println("DEBUG: Creating output port "
                                            //+ portName + " in class " + className);
                                    alreadyGeneratedPorts.add(portName);
                                    lfCode.append("    output ")
                                            .append(portName)
                                            .append(": ")
                                            .append(ec.getLfType())
                                            .append(";\n");
                                }
                            }
                            // If this class is the callee => input port
                            if (ec.getCalleeClass().equals(className)) {
                                String portName = ec.getMsgsrvName() + "_to_"
                                        + ec.getTargetInstance() + "_from_" + ec.getCallerInstance()
                                        + "_in";
                                if (!alreadyGeneratedPorts.contains(portName)) {
                                    //System.out.println("DEBUG: Creating input port "
                                            //+ portName + " in class " + className);
                                    alreadyGeneratedPorts.add(portName);
                                    lfCode.append("    input ")
                                            .append(portName)
                                            .append(": ")
                                            .append(ec.getLfType())
                                            .append(";\n");
                                }
                                // Group this input port under its msgsrvName
                                inputsByMsgsrv.computeIfAbsent(ec.getMsgsrvName(), k -> new ArrayList<>())
                                        .add(portName);
                            }
                        }
                    }
                }
            }

            // For non-constructor-based statevars => "state foo: bool"
            for (StateVar sv : cInfo.regularStateVars) {
                lfCode.append("    state ")
                        .append(sv.name)
                        .append(": ")
                        .append(sv.type)
                        .append("\n");
            }

            // For each internal msgsrv => create state variables for formal params
            Set<String> internalServers = internalMsgsrvs.getOrDefault(className, Collections.emptySet());
            for (String msgsrvName : internalServers) {
                if (msgsrvName.startsWith("constructorOf")) continue;
                for (MsgsrvDeclaration msgsrv : rc.getMsgsrvs()) {
                    if (msgsrv.getName().equals(msgsrvName)) {
                        for (FormalParameterDeclaration param : msgsrv.getFormalParameters()) {
                            lfCode.append("    state ")
                                    .append(param.getName())
                                    .append("_for_")
                                    .append(msgsrvName)
                                    .append(": ")
                                    .append(mapRebecaTypeToLF(param.getType().getTypeName()))
                                    .append("\n");
                        }
                    }
                }
            }

            // Generate a reactor-level "logical action" + "reaction" for each internal msgsrv
            for (String msgsrvName : internalServers) {
                if (msgsrvName.startsWith("constructorOf")) continue; // skip constructor-of

                lfCode.append("    logical action ").append(msgsrvName).append(";\n");

                // We gather lines from the Rebeca code => scheduled actions, external outputs
                Set<String> scheduledActions = new LinkedHashSet<>();
                Set<String> externalPortsToEmit = new LinkedHashSet<>();

                StringBuilder body = new StringBuilder();
                // Only generate for the matching msgsrv
                for (MsgsrvDeclaration msgsrv : rc.getMsgsrvs()) {
                    if (msgsrv.getName().equals(msgsrvName)) {
                        //System.out.println("DEBUG: Generating msgsrv body for INTERNAL "
                                //+ msgsrvName + " in class " + className);
                        body.append(
                                generateMsgsrvBody(
                                        msgsrv.getBlock(),
                                        className,
                                        cInfo,
                                        internalMsgsrvs,
                                        scheduledActions,
                                        externalPortsToEmit,
                                        classes,
                                        instanceToClass,
                                        callsByInstance,
                                        msgsrvName,
                                        externalCallsByClass,
                                        /* externalParamMapping */ null
                                )
                        );
                    }
                }

                // Build the reaction signature -> includes scheduled actions + external outputs
                lfCode.append("    reaction(").append(msgsrvName).append(")");
                if (!scheduledActions.isEmpty() || !externalPortsToEmit.isEmpty()) {
                    lfCode.append(" -> ");
                    boolean first = true;
                    for (String sa : scheduledActions) {
                        if (!first) lfCode.append(", ");
                        lfCode.append(sa);
                        first = false;
                    }
                    for (String port : externalPortsToEmit) {
                        if (!first) lfCode.append(", ");
                        lfCode.append(port);
                        first = false;
                    }
                }
                lfCode.append(" {=\n");
                lfCode.append(body);
                lfCode.append("    =}\n");
            }

            // Handle constructor => "reaction(startup)"
            ConstructorDeclaration constructor = null;
            if (!rc.getConstructors().isEmpty()) {
                constructor = rc.getConstructors().get(0);
            }
            if (constructor != null) {
                //System.out.println("DEBUG: Generating startup reaction for class " + className);
                Set<String> scheduledActions = new LinkedHashSet<>();
                Set<String> externalPortsToEmit = new LinkedHashSet<>();

                String startupCode = generateConstructorBodyForStartupReaction(
                        constructor.getBlock(),
                        className,
                        cInfo,
                        internalMsgsrvs,
                        scheduledActions,
                        externalPortsToEmit,
                        classes,
                        instanceToClass,
                        callsByInstance,
                        externalCallsByClass
                );
                if (!startupCode.trim().isEmpty()) {
                    lfCode.append("    reaction(startup)");
                    if (!scheduledActions.isEmpty() || !externalPortsToEmit.isEmpty()) {
                        lfCode.append(" -> ");
                        boolean first = true;
                        for (String sa : scheduledActions) {
                            if (!first) lfCode.append(", ");
                            lfCode.append(sa);
                            first = false;
                        }
                        for (String port : externalPortsToEmit) {
                            if (!first) lfCode.append(", ");
                            lfCode.append(port);
                            first = false;
                        }
                    }
                    lfCode.append(" {=\n");
                    lfCode.append(startupCode);
                    lfCode.append("    =}\n");
                }
            }

            // === Create ONE reaction PER input port, with external param logic
            for (Map.Entry<String, List<String>> entry : inputsByMsgsrv.entrySet()) {
                String externalMsgsrvName = entry.getKey();
                List<String> inputPorts = entry.getValue();
                if (inputPorts.isEmpty()) continue;

                // De-duplicate in case the same portName appears multiple times
                Set<String> uniquePorts = new LinkedHashSet<>(inputPorts);

                // We'll find the external msgsrv block in rc.getMsgsrvs().
                List<FormalParameterDeclaration> extParams =
                        cInfo.externalMsgsrvsToParams.getOrDefault(externalMsgsrvName, Collections.emptyList());

                MsgsrvDeclaration externalMsgDecl = null;
                for (MsgsrvDeclaration mdecl : rc.getMsgsrvs()) {
                    if (mdecl.getName().equals(externalMsgsrvName)) {
                        externalMsgDecl = mdecl;
                        break;
                    }
                }

                for (String portName : uniquePorts) {
                    // param->"(*portName.get()).param"
                    Map<String, String> externalParamMapping = new HashMap<>();
                    for (FormalParameterDeclaration fp : extParams) {
                        externalParamMapping.put(
                                fp.getName(),
                                "(*" + portName + ".get())." + fp.getName()
                        );
                    }

                    //System.out.println("DEBUG: Generating EXTERNAL reaction for "
                            //+ externalMsgsrvName + " port=" + portName
                            //+ " in class " + className);

                    lfCode.append("    reaction(").append(portName).append(") {=\n");

                    if (externalMsgDecl != null && externalMsgDecl.getBlock() != null) {
                        //System.out.println("DEBUG: Found Rebeca block for external msgsrv "
                                //+ externalMsgsrvName + " in class " + className);
                        Set<String> scheduledActions = new LinkedHashSet<>();
                        Set<String> externalPortsToEmit = new LinkedHashSet<>();

                        String externalBody = generateMsgsrvBody(
                                externalMsgDecl.getBlock(),
                                className,
                                cInfo,
                                internalMsgsrvs,
                                scheduledActions,
                                externalPortsToEmit,
                                classes,
                                instanceToClass,
                                callsByInstance,
                                externalMsgsrvName,
                                externalCallsByClass,
                                externalParamMapping // pass param->(*port.get()).param
                        );
                        lfCode.append(externalBody);
                    } else {
                        //System.out.println("DEBUG: No code block found for external msgsrv "
                                //+ externalMsgsrvName + " in class " + className);
                    }

                    lfCode.append("    =}\n");
                }
            }

            lfCode.append("}\n\n");
        }

        // 8) Translate main block => "main reactor { ... }"
        MainDeclaration mainDecl = rebecaModel.getRebecaCode().getMainDeclaration();
        if (mainDecl != null) {
            lfCode.append("main reactor {\n");

            // Instantiate each rebec
            for (MainRebecDefinition mainDef : mainDecl.getMainRebecDefinition()) {
                String instName = mainDef.getName();
                String clsName = mainDef.getType().getTypeName();
                ConstructorInfo cInfo = constructorInfoMap.get(clsName);

                lfCode.append("    ")
                        .append(instName)
                        .append(" = new ")
                        .append(clsName);

                List<Expression> constructorArgs = mainDef.getArguments();
                if (!cInfo.params.isEmpty()) {
                    lfCode.append("(");
                    for (int i = 0; i < cInfo.params.size(); i++) {
                        ConstructorParam p = cInfo.params.get(i);
                        String paramValue = p.defaultValue;
                        if (constructorArgs != null && i < constructorArgs.size()) {
                            Expression expr = constructorArgs.get(i);
                            paramValue = expressionToString(expr, p.type, p.defaultValue);
                        }
                        if (i > 0) lfCode.append(", ");
                        lfCode.append(p.stateVarName)
                                .append(" = ")
                                .append(paramValue);
                    }
                    lfCode.append(")");
                } else {
                    lfCode.append("()");
                }
                lfCode.append(";\n");
            }

            // Add connections for external calls
            //System.out.println("DEBUG: Generating connections");
            lfCode.append(generateConnectionStatements(callsByInstance, instanceToClass, constructorInfoMap, externalCallsByClass));
            lfCode.append("}\n\n");
        }

        // 9) Write LF code to file
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(outputPath))) {
            writer.write(lfCode.toString());
        } catch (IOException e) {
            e.printStackTrace();
        }

        // (Optional) structure map
        analyzeAndPrintStructureMap();
    }

    // -----------------------------------------------------------------------
    // Add connections in main
    // -----------------------------------------------------------------------
    private String generateConnectionStatements(
            Map<String, List<CallDetail>> callsByInstance,
            Map<String, String> instanceToClass,
            Map<String, ConstructorInfo> constructorInfoMap,
            Map<String, Map<String, Map<String, List<ExternalCall>>>> externalCallsByClass
    ) {
        StringBuilder sb = new StringBuilder();
        for (var entry : externalCallsByClass.entrySet()) {
            String calleeClass = entry.getKey();
            for (var entry1 : entry.getValue().entrySet()) {
                String calleeInst = entry1.getKey();
                for (var entry2 : entry1.getValue().entrySet()) {
                    String msgName = entry2.getKey();
                    List<ExternalCall> calls = entry2.getValue();
                    if (calls.isEmpty()) continue;
                    String callerInst = calls.get(0).getCallerInstance();
                    String outPort = msgName + "_to_" + calleeInst + "_from_" + callerInst + "_out";
                    String inPort = msgName + "_to_" + calleeInst + "_from_" + callerInst + "_in";
                    sb.append("    ")
                            .append(callerInst).append(".").append(outPort)
                            .append(" -> ")
                            .append(calleeInst).append(".").append(inPort)
                            .append(";\n");
                }
            }
        }
        return sb.toString();
    }

    // -----------------------------------------------------------------------
    // Group external calls by class
    // -----------------------------------------------------------------------
    private Map<String, Map<String, Map<String, List<ExternalCall>>>> groupExternalCallsByClass(
            Map<String, List<CallDetail>> callsByInstance,
            Map<String, String> instanceToClass,
            Map<String, ConstructorInfo> constructorInfoMap
    ) {
        Map<String, Map<String, Map<String, List<ExternalCall>>>> result = new HashMap<>();

        for (String inst : callsByInstance.keySet()) {
            String callerClass = instanceToClass.get(inst);
            for (CallDetail cd : callsByInstance.get(inst)) {
                if (!cd.isInternal) {
                    // External call => build ExternalCall
                    String calleeInst = cd.externalTargetInstance;
                    String calleeClass = instanceToClass.getOrDefault(calleeInst, "");
                    String methodName = cd.msgName;
                    //System.out.println("DEBUG: Grouping external call: " + methodName
                            //+ " from " + callerClass + " to " + calleeClass
                            //+ " instance " + calleeInst );

                    ExternalCall ec = new ExternalCall(
                            inst, callerClass,
                            calleeInst, calleeClass,
                            methodName
                    );

                    // Derive LF type from callee's external msgsrv
                    ConstructorInfo calleeCInfo = constructorInfoMap.get(calleeClass);
                    if (calleeCInfo != null &&
                            calleeCInfo.externalMsgsrvsToParams.containsKey(methodName)) {
                        List<FormalParameterDeclaration> params =
                                calleeCInfo.externalMsgsrvsToParams.get(methodName);
                        if (params.isEmpty()) {
                            ec.setLfType("int");
                        } else {
                            ec.setLfType(calleeClass + "_" + methodName);
                        }
                    } else {
                        ec.setLfType("int"); // fallback
                    }

                    result.putIfAbsent(calleeClass, new HashMap<>());
                    result.get(calleeClass).putIfAbsent(calleeInst, new HashMap<>());
                    result.get(calleeClass).get(calleeInst).putIfAbsent(methodName, new ArrayList<>());
                    result.get(calleeClass).get(calleeInst).get(methodName).add(ec);
                }
            }
        }
        return result;
    }

    private static class ExternalCall {
        private final String callerInstance;
        private final String callerClass;
        private final String targetInstance;
        private final String calleeClass;
        private final String msgsrvName;
        private String lfType;

        public ExternalCall(String callerInstance, String callerClass,
                            String targetInstance, String calleeClass,
                            String msgsrvName) {
            this.callerInstance = callerInstance;
            this.callerClass = callerClass;
            this.targetInstance = targetInstance;
            this.calleeClass = calleeClass;
            this.msgsrvName = msgsrvName;
        }
        public String getCallerInstance() { return callerInstance; }
        public String getCallerClass() { return callerClass; }
        public String getTargetInstance() { return targetInstance; }
        public String getCalleeClass() { return calleeClass; }
        public String getMsgsrvName() { return msgsrvName; }
        public String getLfType() { return lfType; }
        public void setLfType(String lfType) { this.lfType = lfType; }
    }

    // -----------------------------------------------------------------------
    // For Reaction Bodies (Constructor or Msgsrv)
    // -----------------------------------------------------------------------
    private String generateConstructorBodyForStartupReaction(
            Statement stmt,
            String className,
            ConstructorInfo cInfo,
            Map<String, Set<String>> internalMsgsrvs,
            Set<String> scheduledActions,
            Set<String> externalPortsToEmit,
            List<ReactiveClassDeclaration> classes,
            Map<String, String> instanceToClass,
            Map<String, List<CallDetail>> callsByInstance,
            Map<String, Map<String, Map<String, List<ExternalCall>>>> externalCallsByClass
    ) {
        StringBuilder lfCode = new StringBuilder();
        if (stmt == null) return lfCode.toString();

        if (stmt instanceof BlockStatement block) {
            for (Statement s : block.getStatements()) {
                lfCode.append(
                        generateConstructorBodyForStartupReaction(
                                s, className, cInfo, internalMsgsrvs, scheduledActions, externalPortsToEmit,
                                classes, instanceToClass, callsByInstance, externalCallsByClass
                        )
                );
            }
        } else if (stmt instanceof ConditionalStatement cs) {
            lfCode.append(
                    generateConstructorBodyForStartupReaction(
                            cs.getStatement(), className, cInfo, internalMsgsrvs,
                            scheduledActions, externalPortsToEmit, classes, instanceToClass,
                            callsByInstance, externalCallsByClass
                    )
            );
            if (cs.getElseStatement() != null) {
                lfCode.append(
                        generateConstructorBodyForStartupReaction(
                                cs.getElseStatement(), className, cInfo, internalMsgsrvs,
                                scheduledActions, externalPortsToEmit, classes, instanceToClass,
                                callsByInstance, externalCallsByClass
                        )
                );
            }
        } else if (stmt instanceof Expression expr) {
            // For the constructor, treat "startup" as no msgsrv name => pass empty
            lfCode.append(
                    processExpressionInReaction(
                            expr,
                            className,
                            cInfo,
                            internalMsgsrvs,
                            scheduledActions,
                            externalPortsToEmit,
                            instanceToClass,
                            callsByInstance,
                            "", // no specific msgsrv for constructor
                            null, // externalParamMapping for constructor = null
                            externalCallsByClass
                    )
            );
        }
        return lfCode.toString();
    }

    private String generateMsgsrvBody(
            Statement stmt,
            String className,
            ConstructorInfo cInfo,
            Map<String, Set<String>> internalMsgsrvs,
            Set<String> scheduledActions,
            Set<String> externalPortsToEmit,
            List<ReactiveClassDeclaration> classes,
            Map<String, String> instanceToClass,
            Map<String, List<CallDetail>> callsByInstance,
            String currentMsgsrvName,
            Map<String, Map<String, Map<String, List<ExternalCall>>>> externalCallsByClass,
            Map<String, String> externalParamMapping
    ) {
        StringBuilder lfCode = new StringBuilder();
        if (stmt == null) return lfCode.toString();

        if (stmt instanceof BlockStatement block) {
            for (Statement s : block.getStatements()) {
                lfCode.append(
                        generateMsgsrvBody(
                                s, className, cInfo,
                                internalMsgsrvs, scheduledActions, externalPortsToEmit,
                                classes, instanceToClass, callsByInstance,
                                currentMsgsrvName, externalCallsByClass,
                                externalParamMapping
                        )
                );
            }
        } else if (stmt instanceof ConditionalStatement cs) {
            lfCode.append(
                    generateMsgsrvBody(
                            cs.getStatement(), className, cInfo,
                            internalMsgsrvs, scheduledActions, externalPortsToEmit,
                            classes, instanceToClass, callsByInstance,
                            currentMsgsrvName, externalCallsByClass,
                            externalParamMapping
                    )
            );
            if (cs.getElseStatement() != null) {
                lfCode.append(
                        generateMsgsrvBody(
                                cs.getElseStatement(), className, cInfo,
                                internalMsgsrvs, scheduledActions, externalPortsToEmit,
                                classes, instanceToClass, callsByInstance,
                                currentMsgsrvName, externalCallsByClass,
                                externalParamMapping
                        )
                );
            }
        } else if (stmt instanceof Expression expr) {
            lfCode.append(
                    processExpressionInReaction(
                            expr, className, cInfo,
                            internalMsgsrvs, scheduledActions, externalPortsToEmit,
                            instanceToClass, callsByInstance,
                            currentMsgsrvName,
                            externalParamMapping,
                            externalCallsByClass
                    )
            );
        }
        return lfCode.toString();
    }

    private String processExpressionInReaction(
            Expression expr,
            String className,
            ConstructorInfo cInfo,
            Map<String, Set<String>> internalMsgsrvs,
            Set<String> scheduledActions,
            Set<String> externalPortsToEmit,
            Map<String, String> instanceToClass,
            Map<String, List<CallDetail>> callsByInstance,
            String currentMsgsrvName,
            Map<String, String> externalParamMapping,
            Map<String, Map<String, Map<String, List<ExternalCall>>>> externalCallsByClass
    ) {
        StringBuilder code = new StringBuilder();
        Set<String> externalPortsAlreadySet = new HashSet<>();

        if (expr instanceof BinaryExpression be && "=".equals(be.getOperator())) {
            String leftStr = transformExpression(be.getLeft(), currentMsgsrvName, cInfo, externalParamMapping);
            String rightStr = transformExpression(be.getRight(), currentMsgsrvName, cInfo, externalParamMapping);

            // Skip initialization of constructor parameters in the startup reaction.
            if (currentMsgsrvName.equals("") && be.getLeft() instanceof TermPrimary leftTerm) {
                boolean isParamBased = false;
                for (ConstructorParam cp : cInfo.params) {
                    if (cp.stateVarName.equals(leftTerm.getName())) {
                        isParamBased = true;
                        break;
                    }
                }
                if (isParamBased) {
                    return code.toString();
                }
            }

            code.append("        ").append(leftStr).append(" = ").append(rightStr).append(";\n");

        } else if (expr instanceof DotPrimary dot) {
            Expression left = dot.getLeft();
            Expression right = dot.getRight();
            if (right instanceof TermPrimary methodTerm && left instanceof TermPrimary leftTerm) {
                String methodName = methodTerm.getName();
                ParentSuffixPrimary psp = methodTerm.getParentSuffixPrimary();
                List<Expression> args = (psp == null) ? Collections.emptyList() : psp.getArguments();

                if ("self".equals(leftTerm.getName())) {
                    // Internal => schedule(0ms) + param state sets
                    if (internalMsgsrvs.getOrDefault(className, Collections.emptySet()).contains(methodName)) {
                        if (cInfo.msgsrvToParams.containsKey(methodName)) {
                            List<FormalParameterDeclaration> params = cInfo.msgsrvToParams.get(methodName);
                            for (int i = 0; i < params.size(); i++) {
                                FormalParameterDeclaration fp = params.get(i);
                                String paramName = fp.getName();
                                String paramType = mapRebecaTypeToLF(fp.getType().getTypeName());

                                // rename paramName => e.g. "msg_for_sendMsg"
                                String targetVar = renameIfParam(paramName, methodName, cInfo);

                                String argStr = (i < args.size())
                                        ? transformExpression(args.get(i), currentMsgsrvName, cInfo, externalParamMapping)
                                        : getDefaultValueForType(paramType);

                                code.append("        ")
                                        .append(targetVar)
                                        .append(" = ")
                                        .append(argStr)
                                        .append(";\n");
                            }
                        }
                        code.append("        ").append(methodName).append(".schedule(0ms);\n");
                        scheduledActions.add(methodName);
                    }

                } else {
                    // === NEW for external->external ===
                    // Even if 'Switch' is an external callee from 'Node',
                    // it can still call 'Router' externally. We must record that call.
                    // We'll find the caller instance => any instance matching className.
                    String instanceName = "";
                    // We'll gather possible calls
                    List<CallDetail> callDetails = new ArrayList<>();
                    for (Map.Entry<String, List<CallDetail>> e : callsByInstance.entrySet()) {
                        if (!instanceToClass.get(e.getKey()).equals(className)) continue;
                        for (CallDetail cd : e.getValue()) {
                            // match method name, plus ensure same caller msgsrv (if relevant)
                            if (cd.msgName.equals(methodName)
                                    && (currentMsgsrvName.isEmpty() || cd.callerMsgsrvName.equals(currentMsgsrvName))) {
                                callDetails.add(cd);
                                instanceName = e.getKey();
                            }
                        }
                    }

                    // For each matching call detail
                    for (CallDetail cd : callDetails) {
                        if (!cd.isInternal) {
                            // build .set(...) line
                            String outPort = methodName + "_to_"
                                    + cd.externalTargetInstance + "_from_"
                                    + instanceToClass.entrySet().stream()
                                    .filter(ev -> ev.getValue().equals(className))
                                    .filter(ev -> callsByInstance.get(ev.getKey()).contains(cd))
                                    .findFirst().get().getKey()
                                    + "_out";
                            if (externalCallsByClass.containsKey(cd.calleeClass)
                                    && externalCallsByClass.get(cd.calleeClass).containsKey(cd.externalTargetInstance)
                                    && externalCallsByClass.get(cd.calleeClass).get(cd.externalTargetInstance).containsKey(methodName)) {

                                String calleeClass = instanceToClass.get(cd.externalTargetInstance);
                                String structName  = calleeClass + "_" + methodName;

                                // param list from cd.arguments
                                List<String> paramVals = new ArrayList<>();
                                for (Expression argExp : cd.arguments) {
                                    String argStr = transformExpression(argExp, currentMsgsrvName, cInfo, externalParamMapping);
                                    paramVals.add(argStr);
                                }
                                if (!externalPortsAlreadySet.contains(outPort)) {
                                    externalPortsToEmit.add(outPort);
                                    externalPortsAlreadySet.add(outPort);
                                }

                                code.append("        ")
                                        .append(outPort)
                                        .append(".set(")
                                        .append(structName)
                                        .append("{");
                                for (int i = 0; i < paramVals.size(); i++) {
                                    if (i > 0) code.append(", ");
                                    code.append(paramVals.get(i));
                                }
                                code.append("});\n");
                            }
                        }
                    }
                }
            }

        } else if (expr instanceof UnaryExpression ue) {
            code.append(
                    processExpressionInReaction(
                            ue.getExpression(), className, cInfo,
                            internalMsgsrvs, scheduledActions, externalPortsToEmit,
                            instanceToClass, callsByInstance,
                            currentMsgsrvName,
                            externalParamMapping,
                            externalCallsByClass
                    )
            );

        } else if (expr instanceof BinaryExpression be) {
            code.append(
                    processExpressionInReaction(
                            be.getLeft(), className, cInfo,
                            internalMsgsrvs, scheduledActions, externalPortsToEmit,
                            instanceToClass, callsByInstance,
                            currentMsgsrvName,
                            externalParamMapping,
                            externalCallsByClass
                    )
            );
            code.append(
                    processExpressionInReaction(
                            be.getRight(), className, cInfo,
                            internalMsgsrvs, scheduledActions, externalPortsToEmit,
                            instanceToClass, callsByInstance,
                            currentMsgsrvName,
                            externalParamMapping,
                            externalCallsByClass
                    )
            );
        }

        return code.toString();
    }

    private String transformExpression(
            Expression expr,
            String msgsrvName,
            ConstructorInfo cInfo,
            Map<String, String> externalParamMapping
    ) {
        if (expr == null) {
            return ""; // Or a default value
        }
        if (expr instanceof BinaryExpression be) {
            String op = be.getOperator();
            String left = transformExpression(be.getLeft(), msgsrvName, cInfo, externalParamMapping);
            String right = transformExpression(be.getRight(), msgsrvName, cInfo, externalParamMapping);
            return left + " " + op + " " + right;
        }
        if (expr instanceof Literal lit) {
            return lit.getLiteralValue();
        }
        if (expr instanceof TermPrimary tp) {
            String rawName = tp.getName();

            // 1) Check external param mapping first
            if (externalParamMapping != null && externalParamMapping.containsKey(rawName)) {
                // e.g. "msg" => "(*rcvMsg_to_sw0_from_node0_in.get()).msg"
                return externalParamMapping.get(rawName);
            }

            // 2) Otherwise do internal rename check
            String renamedIfInternal = renameIfParam(rawName, msgsrvName, cInfo);
            if (!renamedIfInternal.equals(rawName)) {
                return renamedIfInternal;
            }

            // 3) Fallback
            return rawName;
        }
        if (expr instanceof UnaryExpression ue) {
            return ue.getOperator()
                    + transformExpression(ue.getExpression(), msgsrvName, cInfo, externalParamMapping);
        }
        return "";
    }

    private String renameIfParam(String rawName, String msgsrvName, ConstructorInfo cInfo) {
        if (msgsrvName == null || msgsrvName.isEmpty()) {
            // no msgsrv context
            return rawName;
        }
        List<FormalParameterDeclaration> params = cInfo.msgsrvToParams.get(msgsrvName);
        if (params == null) {
            return rawName;
        }
        for (FormalParameterDeclaration p : params) {
            if (rawName.equals(p.getName())) {
                // e.g. "msg" => "msg_for_sendMsg"
                return p.getName() + "_for_" + msgsrvName;
            }
        }
        return rawName;
    }

    private ConstructorInfo buildConstructorInfo(ReactiveClassDeclaration rc) {
        ConstructorInfo cInfo = new ConstructorInfo();

        // gather statevars
        List<FieldDeclaration> statevars = rc.getStatevars();
        Map<String, String> statevarNameToType = new HashMap<>();
        if (statevars != null) {
            for (FieldDeclaration fd : statevars) {
                for (VariableDeclarator vd : fd.getVariableDeclarators()) {
                    String typeName = fd.getType().getTypeName();
                    statevarNameToType.put(vd.getVariableName(), typeName);
                }
            }
        }

        // find first constructor, if any
        ConstructorDeclaration constructor = null;
        if (!rc.getConstructors().isEmpty()) {
            constructor = rc.getConstructors().get(0);
        }

        if (constructor == null) {
            for (var entry : statevarNameToType.entrySet()) {
                StateVar sv = new StateVar();
                sv.name = entry.getKey();
                sv.type = mapRebecaTypeToLF(entry.getValue());
                cInfo.regularStateVars.add(sv);
            }
        } else {
            List<FormalParameterDeclaration> params = constructor.getFormalParameters();
            Map<String, String> paramToStateVar = new HashMap<>();
            parseConstructorBlockForAssignments(constructor.getBlock(), paramToStateVar);

            for (FormalParameterDeclaration p : params) {
                String paramName = p.getName();
                String paramType = p.getType().getTypeName();
                String assignedSV = paramToStateVar.get(paramName);

                if (assignedSV != null && statevarNameToType.containsKey(assignedSV)) {
                    ConstructorParam cp = new ConstructorParam();
                    cp.paramName = paramName;
                    cp.stateVarName = assignedSV;
                    cp.type = mapRebecaTypeToLF(paramType);
                    cp.defaultValue = getDefaultValueForType(cp.type);
                    cInfo.params.add(cp);
                }
            }
            // skip param-based statevars
            Set<String> paramBasedVars = cInfo.params.stream()
                    .map(cp -> cp.stateVarName)
                    .collect(Collectors.toSet());

            for (var entry : statevarNameToType.entrySet()) {
                if (!paramBasedVars.contains(entry.getKey())) {
                    StateVar sv = new StateVar();
                    sv.name = entry.getKey();
                    sv.type = mapRebecaTypeToLF(entry.getValue());
                    cInfo.regularStateVars.add(sv);
                }
            }
        }

        // Collect msgsrv formal parameters
        for (MsgsrvDeclaration msgsrv : rc.getMsgsrvs()) {
            cInfo.msgsrvToParams.put(msgsrv.getName(), msgsrv.getFormalParameters());
        }

        // Distinguish external vs internal
        for (MsgsrvDeclaration msgsrv : rc.getMsgsrvs()) {
            if (!isInternal(msgsrv, rc, constructor)) {
                cInfo.externalMsgsrvsToParams.put(msgsrv.getName(), msgsrv.getFormalParameters());
            }
        }
        return cInfo;
    }

    private boolean isInternal(MsgsrvDeclaration msgsrv, ReactiveClassDeclaration rc, ConstructorDeclaration constructor) {
        Set<String> internalCalls = new HashSet<>();
        String cName = rc.getName();
        if (constructor != null) {
            analyzeBlockForInternalCalls(constructor.getBlock(), cName, internalCalls);
        }
        analyzeBlockForInternalCalls(msgsrv.getBlock(), cName, internalCalls);
        for (MethodDeclaration md : rc.getSynchMethods()) {
            analyzeBlockForInternalCalls(md.getBlock(), cName, internalCalls);
        }
        return internalCalls.contains(msgsrv.getName());
    }

    private void parseConstructorBlockForAssignments(Statement stmt, Map<String, String> paramToStateVar) {
        if (stmt == null) return;
        if (stmt instanceof BlockStatement block) {
            for (Statement s : block.getStatements()) {
                parseConstructorBlockForAssignments(s, paramToStateVar);
            }
        } else if (stmt instanceof Expression expr) {
            if (expr instanceof BinaryExpression be && "=".equals(be.getOperator())) {
                Expression left = be.getLeft();
                Expression right = be.getRight();
                if (left instanceof TermPrimary leftTerm && right instanceof TermPrimary rightTerm) {
                    paramToStateVar.put(rightTerm.getName(), leftTerm.getName());
                }
            }
        } else if (stmt instanceof ConditionalStatement cs) {
            parseConstructorBlockForAssignments(cs.getStatement(), paramToStateVar);
            if (cs.getElseStatement() != null) {
                parseConstructorBlockForAssignments(cs.getElseStatement(), paramToStateVar);
            }
        }
    }

    // -----------------------------------------------------------------------
    //  Type Mappings, Expression to String
    // -----------------------------------------------------------------------
    private String mapRebecaTypeToLF(String rebType) {
        return switch (rebType) {
            case "boolean" -> "bool";
            case "int" -> "int";
            case "double" -> "double";
            case "String" -> "string";
            default -> rebType; // fallback
        };
    }

    private String getDefaultValueForType(String lfType) {
        return switch (lfType) {
            case "bool" -> "false";
            case "int" -> "0";
            case "double" -> "0.0";
            case "string" -> "\"\"";
            default -> "0"; // fallback
        };
    }

    private String expressionToString(Expression expr, String lfType, String fallback) {
        if (expr == null) {
            return fallback;
        }
        if (expr instanceof BinaryExpression be) {
            return expressionToString(be.getLeft(), lfType, fallback)
                    + " " + be.getOperator() + " "
                    + expressionToString(be.getRight(), lfType, fallback);
        }
        if (expr instanceof Literal lit) {
            return lit.getLiteralValue();
        }
        if (expr instanceof TermPrimary tp) {
            return tp.getName();
        }
        return fallback;
    }

    // -----------------------------------------------------------------------
    //  Data classes
    // -----------------------------------------------------------------------
    private static class ConstructorInfo {
        List<ConstructorParam> params = new ArrayList<>();
        List<StateVar> regularStateVars = new ArrayList<>();
        Map<String, List<FormalParameterDeclaration>> msgsrvToParams = new HashMap<>();
        Map<String, List<FormalParameterDeclaration>> externalMsgsrvsToParams = new HashMap<>();
    }

    private static class ConstructorParam {
        String paramName;
        String stateVarName;
        String type;
        String defaultValue;
    }

    private static class StateVar {
        String name;
        String type;
    }

    private static class CallDetail {
        final String msgName;
        final boolean isInternal;
        final String externalTargetInstance;
        String callerMsgsrvName;
        List<Expression> arguments = new ArrayList<>();
        String calleeClass;

        CallDetail(String msgName, boolean isInternal, String externalTargetInstance) {
            this.msgName = msgName;
            this.isInternal = isInternal;
            this.externalTargetInstance = externalTargetInstance;
        }
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

    private Map<String, String> buildInstanceToClassMap() {
        Map<String, String> result = new HashMap<>();
        MainDeclaration mainDecl = rebecaModel.getRebecaCode().getMainDeclaration();
        if (mainDecl == null) {
            return result;
        }
        for (MainRebecDefinition mainDef : mainDecl.getMainRebecDefinition()) {
            String instName = mainDef.getName();
            String clsName = mainDef.getType().getTypeName();
            result.put(instName, clsName);
        }
        return result;
    }

    private Map<String, List<String>> buildInstanceKnownRebecsMap(Map<String, String> instanceToClass) {
        Map<String, List<String>> instanceKnownMap = new HashMap<>();

        List<ReactiveClassDeclaration> classList = rebecaModel.getRebecaCode().getReactiveClassDeclaration();
        Map<String, List<String>> classToKnownFields = new HashMap<>();
        for (ReactiveClassDeclaration rc : classList) {
            List<FieldDeclaration> knownRebecFields = rc.getKnownRebecs();
            List<String> knownFields = new ArrayList<>();
            if (knownRebecFields != null) {
                for (FieldDeclaration fd : knownRebecFields) {
                    for (VariableDeclarator vd : fd.getVariableDeclarators()) {
                        knownFields.add(vd.getVariableName());
                    }
                }
            }
            classToKnownFields.put(rc.getName(), knownFields);
        }

        // parse main
        MainDeclaration mainDecl = rebecaModel.getRebecaCode().getMainDeclaration();
        if (mainDecl == null) {
            return instanceKnownMap;
        }

        for (MainRebecDefinition mainDef : mainDecl.getMainRebecDefinition()) {
            String instName = mainDef.getName();
            String clsName = mainDef.getType().getTypeName();
            List<String> fields = classToKnownFields.getOrDefault(clsName, Collections.emptyList());
            List<Expression> knownBindings = mainDef.getBindings();
            List<String> actualKnown = new ArrayList<>();

            if (knownBindings != null && knownBindings.size() == fields.size()) {
                for (Expression expr : knownBindings) {
                    if (expr instanceof TermPrimary tp) {
                        actualKnown.add(tp.getName());
                    }
                }
            }
            instanceKnownMap.put(instName, actualKnown);
        }

        return instanceKnownMap;
    }

    private Map<String, List<String>> buildClassToKnownRebecsMap() {
        Map<String, List<String>> classToKnownRebecs = new HashMap<>();
        for (ReactiveClassDeclaration rc : classes) {
            List<String> knownRebecs = new ArrayList<>();
            List<FieldDeclaration> knownRebecFields = rc.getKnownRebecs();
            if (knownRebecFields != null) {
                for (FieldDeclaration fd : knownRebecFields) {
                    for (VariableDeclarator vd : fd.getVariableDeclarators()) {
                        knownRebecs.add(vd.getVariableName());
                    }
                }
            }
            classToKnownRebecs.put(rc.getName(), knownRebecs);
        }
        return classToKnownRebecs;
    }

    private Map<String, Set<String>> findInternalMsgServers(Map<String, ConstructorInfo> constructorInfoMap) {
        Map<String, Set<String>> internalMsgsrvs = new HashMap<>();
        Map<String, Set<String>> classToInternalCalls = new HashMap<>();

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
            classToInternalCalls.put(cName, internalCalls);
        }

        Map<String, Set<String>> allMsgsrvs = collectMessageServers();
        for (var classEntry : allMsgsrvs.entrySet()) {
            String clsName = classEntry.getKey();
            Set<String> msgsrvs = classEntry.getValue();
            Set<String> internal = new HashSet<>();
            for (String msgsrvName : msgsrvs) {
                if (classToInternalCalls.getOrDefault(clsName, Collections.emptySet()).contains(msgsrvName)) {
                    internal.add(msgsrvName);
                }
            }
            if (!internal.isEmpty()) {
                internalMsgsrvs.put(clsName, internal);
            }
        }
        return internalMsgsrvs;
    }

    private void analyzeBlockForInternalCalls(Statement stmt, String currentClass, Set<String> internalCalls) {
        if (stmt == null) return;
        if (stmt instanceof BlockStatement block) {
            for (Statement s : block.getStatements()) {
                analyzeBlockForInternalCalls(s, currentClass, internalCalls);
            }
        } else if (stmt instanceof ConditionalStatement cs) {
            analyzeBlockForInternalCalls(cs.getStatement(), currentClass, internalCalls);
            if (cs.getElseStatement() != null) {
                analyzeBlockForInternalCalls(cs.getElseStatement(), currentClass, internalCalls);
            }
        } else if (stmt instanceof Expression expr) {
            analyzeExpressionForInternalCalls(expr, currentClass, internalCalls);
        }
    }

    private void analyzeExpressionForInternalCalls(Expression expr, String currentClass, Set<String> internalCalls) {
        if (expr == null) return;
        if (expr instanceof DotPrimary dot) {
            Expression left = dot.getLeft();
            Expression right = dot.getRight();
            if (right instanceof TermPrimary term) {
                String methodName = term.getName();
                if (left instanceof TermPrimary leftTerm && "self".equals(leftTerm.getName())) {
                    internalCalls.add(methodName);
                }
            }
            analyzeExpressionForInternalCalls(left, currentClass, internalCalls);
            analyzeExpressionForInternalCalls(right, currentClass, internalCalls);
        } else if (expr instanceof UnaryExpression ue) {
            analyzeExpressionForInternalCalls(ue.getExpression(), currentClass, internalCalls);
        } else if (expr instanceof BinaryExpression be) {
            analyzeExpressionForInternalCalls(be.getLeft(), currentClass, internalCalls);
            analyzeExpressionForInternalCalls(be.getRight(), currentClass, internalCalls);
        }
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

    // === NEW for external->external: we parse calls to known rebecs within ANY msgsrv
    // even if that msgsrv is external.
    private void analyzeAllCalls(
            Map<String, String> instanceToClass,
            Map<String, List<CallDetail>> callsByInstance,
            Map<String, List<String>> classToKnownRebecs,
            Map<String, List<String>> instanceKnownRebecs
    ) {
        for (ReactiveClassDeclaration rc : classes) {
            String cName = rc.getName();
            for (ConstructorDeclaration cd : rc.getConstructors()) {
                parseBlockStatement(cd.getBlock(), cName, instanceToClass, callsByInstance,
                        classToKnownRebecs, instanceKnownRebecs, "");
            }
            for (MsgsrvDeclaration msgs : rc.getMsgsrvs()) {
                parseBlockStatement(msgs.getBlock(), cName, instanceToClass, callsByInstance,
                        classToKnownRebecs, instanceKnownRebecs, msgs.getName());
            }
            for (MethodDeclaration md : rc.getSynchMethods()) {
                parseBlockStatement(md.getBlock(), cName, instanceToClass, callsByInstance,
                        classToKnownRebecs, instanceKnownRebecs, md.getName());
            }
        }
    }

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
        if (stmt instanceof BlockStatement block) {
            for (Statement s : block.getStatements()) {
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
        } else if (stmt instanceof Expression expr) {
            parseExpression(expr, currentClass, instanceToClass, callsByInstance,
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
            Expression left = dot.getLeft();
            Expression right = dot.getRight();

            if (right instanceof TermPrimary term) {
                String methodName = term.getName();
                ParentSuffixPrimary psp = term.getParentSuffixPrimary();
                List<Expression> arguments = (psp == null) ? Collections.emptyList() : psp.getArguments();

                if (left instanceof TermPrimary leftTerm) {
                    // If "self" => internal
                    if ("self".equals(leftTerm.getName())) {
                        List<String> sameClassInstances = instanceToClass.entrySet()
                                .stream()
                                .filter(e -> e.getValue().equals(currentClass))
                                .map(Map.Entry::getKey)
                                .toList();
                        for (String caller : sameClassInstances) {
                            CallDetail cd = new CallDetail(methodName, true, "");
                            cd.arguments = arguments;
                            cd.callerMsgsrvName = currentMsgsrvName;
                            callsByInstance.get(caller).add(cd);
                        }
                    } else {
                        // might be external => check if leftTerm is a known rebec
                        List<String> knowns = classToKnownRebecs.getOrDefault(currentClass, Collections.emptyList());
                        if (knowns.contains(leftTerm.getName())) {
                            // external
                            List<String> sameClassInstances = instanceToClass.entrySet()
                                    .stream()
                                    .filter(e -> e.getValue().equals(currentClass))
                                    .map(Map.Entry::getKey)
                                    .toList();
                            for (String caller : sameClassInstances) {
                                // see which known rebec is being addressed
                                List<String> knownRebecsForCaller =
                                        instanceKnownRebecs.getOrDefault(caller, Collections.emptyList());
                                int idx = knowns.indexOf(leftTerm.getName());
                                String targetInstance = "";
                                if (idx >= 0 && idx < knownRebecsForCaller.size()) {
                                    targetInstance = knownRebecsForCaller.get(idx);
                                    String calleeClass = instanceToClass.get(targetInstance);

                                    CallDetail cd = new CallDetail(methodName, false, targetInstance);
                                    cd.arguments = arguments;
                                    cd.callerMsgsrvName = currentMsgsrvName;
                                    cd.calleeClass = calleeClass;
                                    callsByInstance.get(caller).add(cd);
                                }
                            }
                        }
                    }
                }
            }
            parseExpression(left, currentClass, instanceToClass, callsByInstance, classToKnownRebecs, instanceKnownRebecs, currentMsgsrvName);
            parseExpression(right, currentClass, instanceToClass, callsByInstance, classToKnownRebecs, instanceKnownRebecs, currentMsgsrvName);

        } else if (expr instanceof UnaryExpression ue) {
            parseExpression(ue.getExpression(), currentClass, instanceToClass, callsByInstance,
                    classToKnownRebecs, instanceKnownRebecs, currentMsgsrvName);

        } else if (expr instanceof BinaryExpression be) {
            parseExpression(be.getLeft(), currentClass, instanceToClass, callsByInstance,
                    classToKnownRebecs, instanceKnownRebecs, currentMsgsrvName);
            parseExpression(be.getRight(), currentClass, instanceToClass, callsByInstance,
                    classToKnownRebecs, instanceKnownRebecs, currentMsgsrvName);
        }
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

        // Reverse map: class->instances
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
        System.out.println("\n========================================\n");
    }
}
