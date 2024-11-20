package org.rebecalang.compiler.modelcompiler.linguafranca;

import org.rebecalang.compiler.modelcompiler.corerebeca.objectmodel.*;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.util.*;
import java.util.stream.Collectors;

/**
 * LinguaFrancaCodeGenerator is responsible for translating Rebeca models into Lingua Franca (LF) code.
 */
public class LinguaFrancaCodeGenerator {
    private final RebecaModel rebecaModel;
    // communicationMap tracks: senderClass -> receiverClass -> message -> count
    private Map<String, Map<String, Map<String, Integer>>> communicationMap;
    // msgsrvSendersMap tracks: receiverClass -> message -> set of senderClasses
    private Map<String, Map<String, Set<String>>> msgsrvSendersMap;
    // instanceClassMap tracks instanceName -> className
    private final Map<String, String> instanceClassMap = new HashMap<>();

    /**
     * Constructor to initialize the code generator with a Rebeca model.
     * @param rebecaModel The Rebeca model to be translated.
     */
    public LinguaFrancaCodeGenerator(RebecaModel rebecaModel) {
        this.rebecaModel = rebecaModel;
    }

    /**
     * Generates Lingua Franca (LF) code from the Rebeca model and writes it to the specified output path.
     * @param outputPath The directory path where the LF code will be written.
     */
    public void generateCode(String outputPath) {
        StringBuilder code = new StringBuilder();
        // Add the target language declaration at the top
        code.append("target Cpp;\n\n");

        // First, process the main reactor to populate instanceClassMap
        processMainReactor();

        // Collect communication patterns
        communicationMap = collectCommunicationPatterns();
        msgsrvSendersMap = collectMsgsrvSenders();

        // Debugging: Print the communication map
        System.out.println("Communication Map:");
        for (Map.Entry<String, Map<String, Map<String, Integer>>> senderEntry : communicationMap.entrySet()) {
            String senderClass = senderEntry.getKey();
            Map<String, Map<String, Integer>> receiversMap = senderEntry.getValue();
            for (Map.Entry<String, Map<String, Integer>> receiverEntry : receiversMap.entrySet()) {
                String receiverClass = receiverEntry.getKey();
                Map<String, Integer> messages = receiverEntry.getValue();
                for (Map.Entry<String, Integer> messageEntry : messages.entrySet()) {
                    String message = messageEntry.getKey();
                    int count = messageEntry.getValue();
                    System.out.println(senderClass + " -> " + receiverClass + " : " + message + " x" + count);
                }
            }
        }

        // Generate code for each reactive class
        List<ReactiveClassDeclaration> reactiveClasses = rebecaModel.getRebecaCode()
                .getReactiveClassDeclaration();
        for (ReactiveClassDeclaration reactiveClass : reactiveClasses) {
            String className = reactiveClass.getName();
            // Start the reactor declaration
            code.append("reactor ").append(className).append(" {\n");

            // Generate inputs and outputs based on communication map
            generateReactorPorts(code, className, communicationMap);

            // Generate reactions for input ports
            generateInputReactions(code, className, communicationMap);

            // Generate state variables with default initialization for integers
            generateStateVariables(code, reactiveClass);

            // Generate constructor reaction
            generateConstructorReaction(code, reactiveClass, className);

            // Generate message servers
            generateMessageServers(code, reactiveClass, communicationMap, msgsrvSendersMap);

            // End of reactor declaration
            code.append("}\n\n");
        }

        // Generate the main reactor with connections
        generateMainReactor(code);

        // Write the generated code to a file
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(outputPath))) {
            writer.write(code.toString());
            System.out.println("Lingua Franca code generated at: " + outputPath);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * Processes the main reactor to populate instanceClassMap.
     */
    private void processMainReactor() {
        MainDeclaration mainDecl = rebecaModel.getRebecaCode().getMainDeclaration();
        if (mainDecl == null) {
            return; // No main block to process
        }

        // First, collect instance mappings
        for (MainRebecDefinition mainRebecDef : mainDecl.getMainRebecDefinition()) {
            String className = mainRebecDef.getType().getTypeName();
            String instanceName = mainRebecDef.getName();

            // Store the instance and class mapping
            instanceClassMap.put(instanceName, className);
        }
    }

    /**
     * Collects communication patterns between reactive classes.
     * Maps sender class -> receiver class -> message -> count.
     * @return The communication map.
     */
    private Map<String, Map<String, Map<String, Integer>>> collectCommunicationPatterns() {
        Map<String, Map<String, Map<String, Integer>>> communicationMap = new HashMap<>();
        // Iterate over reactive classes to find message sends
        List<ReactiveClassDeclaration> reactiveClasses = rebecaModel.getRebecaCode()
                .getReactiveClassDeclaration();
        for (ReactiveClassDeclaration reactiveClass : reactiveClasses) {
            String senderClassName = reactiveClass.getName();

            // Collect send statements from message servers and synchronous methods
            List<MethodDeclaration> methods = new ArrayList<>();
            methods.addAll(reactiveClass.getMsgsrvs());
            methods.addAll(reactiveClass.getSynchMethods());
            for (MethodDeclaration method : methods) {
                collectSendStatements(method.getBlock(), senderClassName, communicationMap);
            }

            // Collect send statements from constructors
            for (ConstructorDeclaration constructor : reactiveClass.getConstructors()) {
                collectSendStatements(constructor.getBlock(), senderClassName, communicationMap);
            }
        }
        return communicationMap;
    }

    /**
     * Collects message server senders by analyzing which classes send to which message servers.
     * Maps receiverClass -> message -> set of senderClasses
     * @return The message server senders map.
     */
    private Map<String, Map<String, Set<String>>> collectMsgsrvSenders() {
        Map<String, Map<String, Set<String>>> msgsrvSendersMap = new HashMap<>();
        // Iterate over reactive classes to find message sends
        List<ReactiveClassDeclaration> reactiveClasses = rebecaModel.getRebecaCode()
                .getReactiveClassDeclaration();
        for (ReactiveClassDeclaration reactiveClass : reactiveClasses) {
            String senderClassName = reactiveClass.getName();

            // Collect send statements from message servers and synchronous methods
            List<MethodDeclaration> methods = new ArrayList<>();
            methods.addAll(reactiveClass.getMsgsrvs());
            methods.addAll(reactiveClass.getSynchMethods());
            for (MethodDeclaration method : methods) {
                collectMsgsrvSenders(method.getBlock(), senderClassName, msgsrvSendersMap);
            }

            // Collect send statements from constructors
            for (ConstructorDeclaration constructor : reactiveClass.getConstructors()) {
                collectMsgsrvSenders(constructor.getBlock(), senderClassName, msgsrvSendersMap);
            }
        }
        return msgsrvSendersMap;
    }

    /**
     * Recursively collects send statements from a given block of statements and updates the communication map.
     * @param stmt The statement to process.
     * @param senderClassName The name of the sender class.
     * @param communicationMap The communication map to update.
     */
    private void collectSendStatements(Statement stmt, String senderClassName,
                                       Map<String, Map<String, Map<String, Integer>>> communicationMap) {
        if (stmt == null) return;

        if (stmt instanceof BlockStatement blockStmt) {
            for (Statement s : blockStmt.getStatements()) {
                collectSendStatements(s, senderClassName, communicationMap);
            }
        } else if (stmt instanceof Expression exprStmt) {
            processExpression(exprStmt, senderClassName, communicationMap);
        } else if (stmt instanceof ConditionalStatement ifStmt) {
            collectSendStatements(ifStmt.getStatement(), senderClassName, communicationMap);
            if (ifStmt.getElseStatement() != null) {
                collectSendStatements(ifStmt.getElseStatement(), senderClassName, communicationMap);
            }
        }
        // Handle other statement types here if necessary
    }

    /**
     * Recursively collects send statements from a given block of statements and updates the message server senders map.
     * @param stmt The statement to process.
     * @param senderClassName The name of the sender class.
     * @param msgsrvSendersMap The message server senders map to update.
     */
    private void collectMsgsrvSenders(Statement stmt, String senderClassName,
                                      Map<String, Map<String, Set<String>>> msgsrvSendersMap) {
        if (stmt == null) return;

        if (stmt instanceof BlockStatement blockStmt) {
            for (Statement s : blockStmt.getStatements()) {
                collectMsgsrvSenders(s, senderClassName, msgsrvSendersMap);
            }
        } else if (stmt instanceof Expression exprStmt) {
            processMsgsrvSenders(exprStmt, senderClassName, msgsrvSendersMap);
        } else if (stmt instanceof ConditionalStatement ifStmt) {
            collectMsgsrvSenders(ifStmt.getStatement(), senderClassName, msgsrvSendersMap);
            if (ifStmt.getElseStatement() != null) {
                collectMsgsrvSenders(ifStmt.getElseStatement(), senderClassName, msgsrvSendersMap);
            }
        }
        // Handle other statement types here if necessary
    }

    /**
     * Processes an expression to identify message sends and updates the communication map.
     * @param expr The expression to process.
     * @param senderClassName The name of the sender class.
     * @param communicationMap The communication map to update.
     */
    private void processExpression(Expression expr, String senderClassName,
                                   Map<String, Map<String, Map<String, Integer>>> communicationMap) {
        if (expr instanceof DotPrimary dotPrimary) {
            // Left is the receiver (could be an output port or a known rebec)
            Expression receiverExpr = dotPrimary.getLeft();
            Expression methodExpr = dotPrimary.getRight();

            if (methodExpr instanceof TermPrimary termPrimary) {
                String methodName = termPrimary.getName();
                ParentSuffixPrimary psp = termPrimary.getParentSuffixPrimary();

                if (methodName.equals("set") && psp != null) {
                    // Detected a 'set' method call on an output port (external message send)
                    if (receiverExpr instanceof TermPrimary receiverTerm) {
                        String outputPortName = receiverTerm.getName(); // e.g., runme_to_Node
                        String[] parts = outputPortName.split("_to_");
                        if (parts.length == 2) {
                            String message = parts[0];
                            String receiverClassName = parts[1];

                            // Update communication map with count
                            communicationMap
                                    .computeIfAbsent(senderClassName, k -> new HashMap<>())
                                    .computeIfAbsent(receiverClassName, k -> new HashMap<>())
                                    .merge(message, 1, Integer::sum);
                        }
                    }
                } else {
                    // Potential direct method call to a known rebec's message server (external or internal)
                    if (receiverExpr instanceof TermPrimary receiverTerm) {
                        String receiverInstanceName = receiverTerm.getName();
                        String receiverClassName = getClassNameForInstance(receiverInstanceName);

                        if (receiverClassName != null && !receiverClassName.equals(senderClassName)) {
                            // External message send
                            // Assume the methodName corresponds to a message server in the receiver class
                            communicationMap
                                    .computeIfAbsent(senderClassName, k -> new HashMap<>())
                                    .computeIfAbsent(receiverClassName, k -> new HashMap<>())
                                    .merge(methodName, 1, Integer::sum);
                        } else if (receiverClassName != null && receiverClassName.equals(senderClassName)) {
                            // Internal message send (self-send)
                            communicationMap
                                    .computeIfAbsent(senderClassName, k -> new HashMap<>())
                                    .computeIfAbsent(senderClassName, k -> new HashMap<>())
                                    .merge(methodName, 1, Integer::sum);
                        }
                    }
                }
            }
        } else if (expr instanceof TermPrimary termPrimary) {
            if (termPrimary.getParentSuffixPrimary() != null) {
                // Possible self message send (e.g., runme2())
                String msgsrvName = termPrimary.getName();

                // Update communication map for self-send with count
                communicationMap
                        .computeIfAbsent(senderClassName, k -> new HashMap<>())
                        .computeIfAbsent(senderClassName, k -> new HashMap<>())
                        .merge(msgsrvName, 1, Integer::sum);
            }
        } else if (expr instanceof UnaryExpression unaryExpr) {
            processExpression(unaryExpr.getExpression(), senderClassName, communicationMap);
        } else if (expr instanceof BinaryExpression binaryExpr) {
            processExpression(binaryExpr.getLeft(), senderClassName, communicationMap);
            processExpression(binaryExpr.getRight(), senderClassName, communicationMap);
        }
        // Handle other expression types here if necessary
    }

    /**
     * Processes an expression to identify message sends and updates the message server senders map.
     * @param expr The expression to process.
     * @param senderClassName The name of the sender class.
     * @param msgsrvSendersMap The message server senders map to update.
     */
    private void processMsgsrvSenders(Expression expr, String senderClassName,
                                      Map<String, Map<String, Set<String>>> msgsrvSendersMap) {
        if (expr instanceof DotPrimary dotPrimary) {
            // Left is the receiver (could be an output port or a known rebec)
            Expression receiverExpr = dotPrimary.getLeft();
            Expression methodExpr = dotPrimary.getRight();

            if (methodExpr instanceof TermPrimary termPrimary) {
                String methodName = termPrimary.getName();
                ParentSuffixPrimary psp = termPrimary.getParentSuffixPrimary();

                if (methodName.equals("set") && psp != null) {
                    // Detected a 'set' method call on an output port (external message send)
                    if (receiverExpr instanceof TermPrimary receiverTerm) {
                        String outputPortName = receiverTerm.getName(); // e.g., runme_to_Node
                        String[] parts = outputPortName.split("_to_");
                        if (parts.length == 2) {
                            String message = parts[0];
                            String receiverClassName = parts[1];

                            // Update message server senders map
                            msgsrvSendersMap
                                    .computeIfAbsent(receiverClassName, k -> new HashMap<>())
                                    .computeIfAbsent(message, k -> new HashSet<>())
                                    .add(senderClassName);
                        }
                    }
                } else {
                    // Potential direct method call to a known rebec's message server (external or internal)
                    if (receiverExpr instanceof TermPrimary receiverTerm) {
                        String receiverInstanceName = receiverTerm.getName();
                        String receiverClassName = getClassNameForInstance(receiverInstanceName);

                        if (receiverClassName != null && !receiverClassName.equals(senderClassName)) {
                            // External message send
                            // Assume the methodName corresponds to a message server in the receiver class
                            msgsrvSendersMap
                                    .computeIfAbsent(receiverClassName, k -> new HashMap<>())
                                    .computeIfAbsent(methodName, k -> new HashSet<>())
                                    .add(senderClassName);
                        } else if (receiverClassName != null && receiverClassName.equals(senderClassName)) {
                            // Internal message send (self-send)
                            msgsrvSendersMap
                                    .computeIfAbsent(senderClassName, k -> new HashMap<>())
                                    .computeIfAbsent(methodName, k -> new HashSet<>())
                                    .add(senderClassName);
                        }
                    }
                }
            }
        } else if (expr instanceof TermPrimary termPrimary) {
            if (termPrimary.getParentSuffixPrimary() != null) {
                // Possible self message send (e.g., runme2())
                String msgsrvName = termPrimary.getName();

                // Update message server senders map for self-send
                msgsrvSendersMap
                        .computeIfAbsent(senderClassName, k -> new HashMap<>())
                        .computeIfAbsent(msgsrvName, k -> new HashSet<>())
                        .add(senderClassName);
            }
        } else if (expr instanceof UnaryExpression unaryExpr) {
            processMsgsrvSenders(unaryExpr.getExpression(), senderClassName, msgsrvSendersMap);
        } else if (expr instanceof BinaryExpression binaryExpr) {
            processMsgsrvSenders(binaryExpr.getLeft(), senderClassName, msgsrvSendersMap);
            processMsgsrvSenders(binaryExpr.getRight(), senderClassName, msgsrvSendersMap);
        }
        // Handle other expression types here if necessary
    }

    /**
     * Generates input and output ports for a given reactor based on communication map.
     * Only inputs and their reactions are duplicated based on the count.
     * Outputs are declared once per message per sender class.
     * @param code The StringBuilder to append code to.
     * @param className The name of the reactor class.
     * @param communicationMap The communication map.
     */
    private void generateReactorPorts(StringBuilder code, String className,
                                      Map<String, Map<String, Map<String, Integer>>> communicationMap) {
        // Generate inputs
        Set<String> inputSet = new HashSet<>();
        for (Map.Entry<String, Map<String, Map<String, Integer>>> entry : communicationMap.entrySet()) {
            String senderClass = entry.getKey();
            Map<String, Map<String, Integer>> receivers = entry.getValue();
            if (receivers.containsKey(className) && !senderClass.equals(className)) {
                Map<String, Integer> messages = receivers.get(className);
                for (Map.Entry<String, Integer> msgEntry : messages.entrySet()) {
                    String message = msgEntry.getKey();
                    int count = msgEntry.getValue();
                    for (int i = 1; i <= count; i++) {
                        String inputName = message + "_from_" + senderClass + "_" + i;
                        if (!inputSet.contains(inputName)) {
                            code.append("    input ").append(inputName).append(": int;\n");
                            inputSet.add(inputName);
                        }
                    }
                }
            }
        }

        // Generate outputs
        // Outputs are declared once per message, regardless of the count
        Set<String> outputSet = new HashSet<>();
        Map<String, Map<String, Integer>> outgoingMessages = communicationMap.getOrDefault(className,
                Collections.emptyMap());
        for (Map.Entry<String, Map<String, Integer>> entry : outgoingMessages.entrySet()) {
            String receiverClass = entry.getKey();
            if (!receiverClass.equals(className)) { // Skip outputs to self
                Map<String, Integer> messages = entry.getValue();
                for (String message : messages.keySet()) {
                    String outputName = message + "_to_" + receiverClass;
                    if (!outputSet.contains(outputName)) {
                        code.append("    output ").append(outputName).append(": int;\n");
                        outputSet.add(outputName);
                    }
                }
            }
        }
    }

    /**
     * Generates reactions for each input port with empty bodies.
     * @param code The StringBuilder to append code to.
     * @param className The name of the reactor class.
     * @param communicationMap The communication map.
     */
    private void generateInputReactions(StringBuilder code, String className,
                                        Map<String, Map<String, Map<String, Integer>>> communicationMap) {
        // Iterate over communicationMap to find inputs for this reactor
        for (Map.Entry<String, Map<String, Map<String, Integer>>> senderEntry : communicationMap.entrySet()) {
            String senderClass = senderEntry.getKey();
            Map<String, Map<String, Integer>> receiversMap = senderEntry.getValue();
            if (receiversMap.containsKey(className) && !senderClass.equals(className)) {
                Map<String, Integer> messages = receiversMap.get(className);
                for (Map.Entry<String, Integer> msgEntry : messages.entrySet()) {
                    String message = msgEntry.getKey();
                    int count = msgEntry.getValue();
                    for (int i = 1; i <= count; i++) {
                        String inputName = message + "_from_" + senderClass + "_" + i;
                        code.append("    reaction(").append(inputName).append(") {=\n");
                        code.append("    =}\n");
                    }
                }
            }
        }
    }

    /**
     * Generates state variable declarations for a given reactor.
     * Integers are initialized with a default value of 0.
     * @param code The StringBuilder to append code to.
     * @param reactiveClass The reactor class declaration.
     */
    private void generateStateVariables(StringBuilder code, ReactiveClassDeclaration reactiveClass) {
        List<FieldDeclaration> stateVars = reactiveClass.getStatevars();
        for (FieldDeclaration fieldDecl : stateVars) {
            // Get the type
            Type type = fieldDecl.getType();
            String lfType = getLinguaFrancaType(type);

            // Get variable declarators
            List<VariableDeclarator> variableDeclarators = fieldDecl.getVariableDeclarators();
            for (VariableDeclarator varDecl : variableDeclarators) {
                String varName = varDecl.getVariableName();

                // Generate state variable declaration with default initialization for integers
                code.append("    state ").append(varName).append(": ").append(lfType);
                if (lfType.equals("int")) {
                    code.append(" = 0");
                }
                code.append(";\n");
            }
        }
    }

    /**
     * Generates the constructor reaction for a given reactor.
     * @param code The StringBuilder to append code to.
     * @param reactiveClass The reactor class declaration.
     * @param className The name of the reactor class.
     */
    private void generateConstructorReaction(StringBuilder code, ReactiveClassDeclaration reactiveClass, String className) {
        for (ConstructorDeclaration constructor : reactiveClass.getConstructors()) {
            BlockStatement body = constructor.getBlock();
            if (body != null && !body.getStatements().isEmpty()) {
                // Exclude variable initialization statements
                List<Statement> nonInitStatements = excludeVariableInitializations(body.getStatements());

                if (!nonInitStatements.isEmpty()) {
                    // Collect actions to be scheduled
                    List<String> actions = new ArrayList<>();
                    List<String> otherStatements = new ArrayList<>();
                    for (Statement stmt : nonInitStatements) {
                        String action = translateSelfMessageSend(stmt);
                        if (action != null) {
                            actions.add(action);
                        } else {
                            // Translate other statements
                            Set<String> dummySet = new HashSet<>();
                            String translatedStmt = translateStatement(stmt, className, dummySet);
                            if (!translatedStmt.isEmpty()) {
                                otherStatements.add(translatedStmt);
                            }
                        }
                    }

                    if (!actions.isEmpty() || !otherStatements.isEmpty()) {
                        code.append("\n    reaction(startup");
                        if (!actions.isEmpty()) {
                            code.append(") -> ");
                            code.append(String.join(", ", actions));
                        } else {
                            code.append(")");
                        }
                        code.append(" {=\n");
                        for (String action : actions) {
                            code.append("        ").append(action).append(".schedule(0ms);\n");
                        }
                        for (String stmt : otherStatements) {
                            code.append("        ").append(stmt).append("\n");
                        }
                        code.append("    =}\n");
                    }
                }
            }
        }
    }

    /**
     * Generates message servers for a given reactor based on communication patterns.
     * Differentiates between external and internal message servers.
     * @param code The StringBuilder to append code to.
     * @param reactiveClass The reactor class declaration.
     * @param communicationMap The communication map.
     * @param msgsrvSendersMap The message server senders map.
     */
    private void generateMessageServers(StringBuilder code, ReactiveClassDeclaration reactiveClass,
                                        Map<String, Map<String, Map<String, Integer>>> communicationMap,
                                        Map<String, Map<String, Set<String>>> msgsrvSendersMap) {
        String className = reactiveClass.getName();

        List<MsgsrvDeclaration> msgSrvs = reactiveClass.getMsgsrvs();
        for (MsgsrvDeclaration msgSrv : msgSrvs) {
            String msgSrvName = msgSrv.getName();
            boolean isExternal = false;

            // Determine if this message server is external by checking if it's called by other classes
            Set<String> senders = msgsrvSendersMap.getOrDefault(className, Collections.emptyMap())
                    .getOrDefault(msgSrvName, Collections.emptySet());
            // If any sender is not the class itself, it's external
            for (String senderClass : senders) {
                if (!senderClass.equals(className)) {
                    isExternal = true;
                    break;
                }
            }

            if (isExternal) {
                // External message server: Generate reactions based on input ports
                int count = communicationMap.getOrDefault(className, Collections.emptyMap())
                        .getOrDefault(className, Collections.emptyMap())
                        .getOrDefault(msgSrvName, 0);
                for (int i = 1; i <= count; i++) {
                    generateExternalMessageServer(code, msgSrv, className, i);
                }
            } else {
                // Internal message server: Generate reactions that set output ports
                generateInternalMessageServer(code, msgSrv, className);
            }
        }
    }

    /**
     * Generates internal message servers as reactions that set output ports.
     * Tracks affected outputs/actions and includes them in the reaction header.
     * @param code The StringBuilder to append code to.
     * @param msgSrv The message server declaration.
     * @param className The name of the reactor class.
     */
    private void generateInternalMessageServer(StringBuilder code, MsgsrvDeclaration msgSrv, String className) {
        String actionName = msgSrv.getName();

        // **Add Logical Action Declaration**
        code.append("    logical action ").append(actionName).append(";\n");

        // Track affected outputs/actions
        Set<String> affectedPorts = new HashSet<>();

        // Translate statements, tracking affected ports
        List<String> reactionStatements = new ArrayList<>();
        for (Statement stmt : msgSrv.getBlock().getStatements()) {
            String translated = translateStatement(stmt, className, affectedPorts);
            if (!translated.isEmpty()) {
                reactionStatements.add(translated);
            }
        }

        // Generate reaction header with affected ports/actions
        code.append("    reaction(").append(actionName);
        if (!affectedPorts.isEmpty()) {
            code.append(") -> ").append(String.join(", ", affectedPorts));
        } else {
            code.append(")");
        }
        code.append(" {=\n");

        // Append translated statements
        for (String stmt : reactionStatements) {
            code.append("        ").append(stmt).append("\n");
        }
        code.append("    =}\n");
    }

    /**
     * Generates external message servers as reactions to input ports.
     * @param code The StringBuilder to append code to.
     * @param msgSrv The message server declaration.
     * @param className The name of the reactor class.
     * @param sendIndex The index of the send operation.
     */
    private void generateExternalMessageServer(StringBuilder code, MsgsrvDeclaration msgSrv, String className, int sendIndex) {
        String msgSrvName = msgSrv.getName();

        // Generate reaction to the corresponding input port with unique suffix
        String inputName = msgSrvName + "_from_Switch_" + sendIndex;

        // Track affected outputs/actions
        Set<String> affectedPorts = new HashSet<>();

        // Translate statements, tracking affected ports
        List<String> reactionStatements = new ArrayList<>();
        for (Statement stmt : msgSrv.getBlock().getStatements()) {
            String translatedStmt = translateStatement(stmt, className, affectedPorts);
            if (!translatedStmt.isEmpty()) {
                reactionStatements.add(translatedStmt);
            }
        }

        // Generate reaction header with affected ports/actions
        code.append("    reaction(").append(inputName);
        if (!affectedPorts.isEmpty()) {
            code.append(") -> ").append(String.join(", ", affectedPorts));
        } else {
            code.append(")");
        }
        code.append(" {=\n");

        // Append translated statements
        for (String stmt : reactionStatements) {
            code.append("        ").append(stmt).append("\n");
        }
        code.append("    =}\n");
    }

    /**
     * Translates a statement into Lingua Franca code.
     * Tracks affected outputs/actions by adding them to the affectedPorts set.
     * @param stmt The statement to translate.
     * @param className The name of the reactor class.
     * @param affectedPorts The set to track affected outputs/actions.
     * @return The translated LF code for the statement.
     */
    private String translateStatement(Statement stmt, String className, Set<String> affectedPorts) {
        if (stmt instanceof BlockStatement blockStmt) {
            StringBuilder code = new StringBuilder();
            code.append("{\n");
            for (Statement s : blockStmt.getStatements()) {
                String translated = translateStatement(s, className, affectedPorts);
                if (!translated.isEmpty()) {
                    code.append("    ").append(translated).append("\n");
                }
            }
            code.append("}");
            return code.toString();
        } else if (stmt instanceof Expression exprStmt) {
            return translateExpression(exprStmt, className, affectedPorts);
        } else if (stmt instanceof ConditionalStatement ifStmt) {
            String condition = translateExpression(ifStmt.getCondition(), className, affectedPorts);
            String thenPart = translateStatement(ifStmt.getStatement(), className, affectedPorts);
            String elsePart = ifStmt.getElseStatement() != null
                    ? translateStatement(ifStmt.getElseStatement(), className, affectedPorts) : "";
            String elseClause = elsePart.isEmpty() ? "" : " else " + elsePart;
            return "if (" + condition + ") " + thenPart + elseClause;
        }
        // Handle other statement types here if necessary
        return "";
    }

    /**
     * Translates an expression into Lingua Franca code.
     * External message sends are translated as outputPort.set(0);
     * Internal message sends are translated as action.schedule(0ms);
     * Tracks affected outputs/actions by adding them to the affectedPorts set.
     * @param expr The expression to translate.
     * @param className The name of the reactor class.
     * @param affectedPorts The set to track affected outputs/actions.
     * @return The translated LF code for the expression.
     */
    private String translateExpression(Expression expr, String className, Set<String> affectedPorts) {
        if (expr instanceof DotPrimary dotPrimary) {
            Expression receiverExpr = dotPrimary.getLeft();
            Expression methodExpr = dotPrimary.getRight();

            if (methodExpr instanceof TermPrimary termPrimary) {
                if (termPrimary.getParentSuffixPrimary() != null) {
                    // Method call
                    String methodName = termPrimary.getName();
                    ParentSuffixPrimary psp = termPrimary.getParentSuffixPrimary();

                    if (methodName.equals("set") && psp != null) {
                        // Detected a 'set' method call on an output port (external message send)
                        if (receiverExpr instanceof TermPrimary receiverTerm) {
                            String outputPortName = receiverTerm.getName(); // e.g., runme_to_Node
                            String[] parts = outputPortName.split("_to_");
                            if (parts.length == 2) {
                                String message = parts[0];
                                String receiverClassName = parts[1];

                                // Update communication map with count
                                communicationMap
                                        .computeIfAbsent(className, k -> new HashMap<>())
                                        .computeIfAbsent(receiverClassName, k -> new HashMap<>())
                                        .merge(message, 1, Integer::sum);

                                // Return the LF code to set the output port
                                return outputPortName + ".set(0);";
                            }
                        }
                    } else {
                        // Potential direct method call to a known rebec's message server (external or internal)
                        if (receiverExpr instanceof TermPrimary receiverTerm) {
                            String receiverInstanceName = receiverTerm.getName();
                            String receiverClassName = getClassNameForInstance(receiverInstanceName);

                            if (receiverClassName != null && !receiverClassName.equals(className)) {
                                // External message send
                                // Assume the methodName corresponds to a message server in the receiver class
                                String outputName = methodName + "_to_" + receiverClassName;
                                affectedPorts.add(outputName);
                                return outputName + ".set(0);"; // Set to 0 as per requirement
                            } else if (receiverClassName != null && receiverClassName.equals(className)) {
                                // Internal message send (self-send)
                                String actionName = methodName;
                                affectedPorts.add(actionName);
                                return actionName + ".schedule(0ms);";
                            }
                        }
                    }
                }
            }

            // Not a method call
            String receiver = translateExpression(receiverExpr, className, affectedPorts);
            String methodCall = translateExpression(methodExpr, className, affectedPorts);
            return receiver + "." + methodCall;
        } else if (expr instanceof TermPrimary termPrimary) {
            if (termPrimary.getParentSuffixPrimary() != null) {
                // Method call
                String methodName = termPrimary.getName();
                ParentSuffixPrimary psp = termPrimary.getParentSuffixPrimary();
                List<String> argList = new ArrayList<>();
                for (Expression arg : psp.getArguments()) {
                    argList.add(translateExpression(arg, className, affectedPorts));
                }
                String args = String.join(", ", argList);

                // Internal message send: schedule logical action
                String actionName = methodName;
                affectedPorts.add(actionName);
                return actionName + ".schedule(0ms);";
            } else {
                // Variable or constant
                return termPrimary.getName();
            }
        } else if (expr instanceof Literal literal) {
            return literal.getLiteralValue();
        } else if (expr instanceof BinaryExpression binExpr) {
            String left = translateExpression(binExpr.getLeft(), className, affectedPorts);
            String right = translateExpression(binExpr.getRight(), className, affectedPorts);
            String operator = binExpr.getOperator();
            return "(" + left + " " + operator + " " + right + ")";
        }
        // Handle other expression types here if necessary
        return "";
    }

    /**
     * Translates a self message send statement to the action name.
     * @param stmt The statement to translate.
     * @return The action name if it's a self message send; otherwise, null.
     */
    private String translateSelfMessageSend(Statement stmt) {
        if (stmt instanceof Expression expr) {
            if (expr instanceof TermPrimary termPrimary) {
                if (termPrimary.getParentSuffixPrimary() != null) {
                    // Self message send like `runme2()`
                    return termPrimary.getName();
                }
            } else if (expr instanceof DotPrimary dotPrimary) {
                // Handle expressions like `self.runme2()`
                Expression receiverExpr = dotPrimary.getLeft();
                if (receiverExpr instanceof TermPrimary termPrimaryReceiver) {
                    if (termPrimaryReceiver.getName().equals("self")) {
                        Expression methodExpr = dotPrimary.getRight();
                        if (methodExpr instanceof TermPrimary termPrimaryMethod) {
                            if (termPrimaryMethod.getParentSuffixPrimary() != null) {
                                return termPrimaryMethod.getName();
                            }
                        }
                    }
                }
            }
        }
        return null;
    }

    /**
     * Maps instance names to class names by analyzing known rebecs.
     * @param instanceName The instance name to map.
     * @return The class name if found; otherwise, null.
     */
    private String getClassNameForInstance(String instanceName) {
        // Iterate through all reactive classes
        for (ReactiveClassDeclaration reactiveClass : rebecaModel.getRebecaCode()
                .getReactiveClassDeclaration()) {
            // Iterate through known rebecs of each class
            List<FieldDeclaration> knownRebecs = reactiveClass.getKnownRebecs();
            if (knownRebecs != null) {
                for (FieldDeclaration fieldDecl : knownRebecs) {
                    List<VariableDeclarator> vars = fieldDecl.getVariableDeclarators();
                    for (VariableDeclarator var : vars) {
                        if (var.getVariableName().equals(instanceName)) {
                            return fieldDecl.getType().getTypeName();
                        }
                    }
                }
            }
        }
        // If not found, return null
        return null;
    }

    /**
     * Maps Rebeca types to Lingua Franca types.
     * @param type The Rebeca type.
     * @return The corresponding Lingua Franca type.
     */
    private String getLinguaFrancaType(Type type) {
        if (type == null) {
            return "void"; // or handle error
        }
        String typeName = type.getTypeName();
        return switch (typeName) {
            case "int" -> "int";
            case "boolean" -> "bool";
            case "double" -> "double";
            case "String" -> "string"; // if supported
            // Add other type mappings as needed
            default -> typeName; // For user-defined types
        };
    }

    /**
     * Excludes variable initialization statements from a list of statements.
     * Currently assumes no variable initializations in constructors.
     * @param statements The list of statements.
     * @return The list excluding variable initialization statements.
     */
    private List<Statement> excludeVariableInitializations(List<Statement> statements) {
        // Implement logic to exclude variable initialization statements
        // For simplicity, we assume no variable initializations in constructors
        return statements;
    }

    /**
     * Generates the main reactor with reactor instantiations and connections.
     * Only inputs and their reactions are duplicated based on the count.
     * Outputs remain singular.
     * @param code The StringBuilder to append code to.
     */
    private void generateMainReactor(StringBuilder code) {
        MainDeclaration mainDecl = rebecaModel.getRebecaCode().getMainDeclaration();
        if (mainDecl == null) {
            return; // No main block to process
        }

        code.append("main reactor {\n");

        // First, instantiate the reactors
        for (MainRebecDefinition mainRebecDef : mainDecl.getMainRebecDefinition()) {
            String className = mainRebecDef.getType().getTypeName();
            String instanceName = mainRebecDef.getName();

            // Generate reactor instantiation
            // Pass known rebecs as constructor arguments if any
            List<Expression> args = mainRebecDef.getArguments();
            if (args != null && !args.isEmpty()) {
                List<String> argList = new ArrayList<>();
                for (Expression arg : args) {
                    String argInstanceName = getInstanceNameFromExpression(arg);
                    if (argInstanceName != null && !argInstanceName.isEmpty()) {
                        argList.add(argInstanceName);
                    }
                }
                String argsStr = String.join(", ", argList);
                code.append("    ").append(instanceName).append(" = new ").append(className)
                        .append("(").append(argsStr).append(");\n");
            } else {
                code.append("    ").append(instanceName).append(" = new ").append(className).append("();\n");
            }
        }

        code.append("\n");

        // Now, generate connections based on communicationMap
        for (Map.Entry<String, Map<String, Map<String, Integer>>> senderEntry : communicationMap.entrySet()) {
            String senderClass = senderEntry.getKey();
            Map<String, Map<String, Integer>> receiversMap = senderEntry.getValue();

            // Find all sender instances of senderClass
            List<String> senderInstances = instanceClassMap.entrySet().stream()
                    .filter(entry -> entry.getValue().equals(senderClass))
                    .map(Map.Entry::getKey)
                    .collect(Collectors.toList());

            for (Map.Entry<String, Map<String, Integer>> receiverEntry : receiversMap.entrySet()) {
                String receiverClass = receiverEntry.getKey();
                Map<String, Integer> messages = receiverEntry.getValue();

                // Find all receiver instances of receiverClass
                List<String> receiverInstances = instanceClassMap.entrySet().stream()
                        .filter(entry -> entry.getValue().equals(receiverClass))
                        .map(Map.Entry::getKey)
                        .collect(Collectors.toList());

                for (Map.Entry<String, Integer> msgEntry : messages.entrySet()) {
                    String message = msgEntry.getKey();
                    int count = msgEntry.getValue();

                    for (int i = 1; i <= count; i++) {
                        // Assign sender_instance in round-robin fashion
                        String senderInstance = senderInstances.get((i - 1) % senderInstances.size());

                        // Assign receiver_instance in round-robin fashion (if multiple)
                        String receiverInstance = receiverInstances.get((i - 1) % receiverInstances.size());

                        // Construct input port name with unique index
                        String inputPort = message + "_from_" + senderClass + "_" + i;

                        // Output port remains singular per sender class
                        String outputPort = message + "_to_" + receiverClass;

                        String uniqueConnection = senderInstance + "." + outputPort + " -> " + receiverInstance + "." + inputPort + ";";

                        // Prevent duplicate connections
                        if (!code.toString().contains(uniqueConnection)) {
                            code.append("    ").append(uniqueConnection).append("\n");
                        }
                    }
                }
            }
        }

        code.append("}\n");
    }

    /**
     * Helper method to extract instance name from an expression.
     * @param expr The expression to extract from.
     * @return The instance name if found; otherwise, null.
     */
    private String getInstanceNameFromExpression(Expression expr) {
        if (expr instanceof TermPrimary termPrimary) {
            return termPrimary.getName();
        }
        // Handle other expression types here if necessary
        return null;
    }

    /**
     * Helper method to get class name of a reactor instance.
     * @param instanceName The instance name.
     * @return The class name if found; otherwise, an empty string.
     */
    private String classNameOfInstance(String instanceName) {
        return instanceClassMap.getOrDefault(instanceName, "");
    }

    /**
     * Helper method to get messages between two reactors based on the communication map.
     * @param senderInstance The sender instance name.
     * @param receiverInstance The receiver instance name.
     * @return A set of messages between the reactors.
     */
    private Set<String> getMessagesBetweenReactors(String senderInstance, String receiverInstance) {
        // We need to map instance names to class names
        String senderClass = instanceClassMap.get(senderInstance);
        String receiverClass = instanceClassMap.get(receiverInstance);

        if (senderClass == null || receiverClass == null) {
            return Collections.emptySet();
        }

        Map<String, Map<String, Integer>> senderMap = communicationMap.getOrDefault(senderClass, Collections.emptyMap());
        return senderMap.getOrDefault(receiverClass, Collections.emptyMap()).keySet();
    }
}
