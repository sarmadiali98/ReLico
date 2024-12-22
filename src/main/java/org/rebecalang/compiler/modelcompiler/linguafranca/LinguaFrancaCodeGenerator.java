package org.rebecalang.compiler.modelcompiler.linguafranca;

import org.rebecalang.compiler.modelcompiler.corerebeca.objectmodel.*;
import org.rebecalang.compiler.modelcompiler.timedrebeca.objectmodel.TimedRebecaParentSuffixPrimary;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.util.*;
import java.util.stream.Collectors;

/**
 * LinguaFrancaCodeGenerator that translates Rebeca models into Lingua Franca code.
 * It handles unique port naming, connection mapping between reactor instances,
 * and ensures correct reaction generation without duplicated inputs or outputs.
 */
public class LinguaFrancaCodeGenerator {
    // Maps sender instance -> receiver instance -> message name -> send count
    private Map<String, Map<String, Map<String, Integer>>> communicationMapInstance;
    // Maps receiver instance -> message name -> set of sender instances
    private Map<String, Map<String, Set<String>>> msgsrvSendersMap;
    // Maps instance name to class name
    private final Map<String, String> instanceClassMap = new HashMap<>();
    // Records after times for external message sends with unique keys
    private final Map<String, Long> externalAfterTimes = new HashMap<>();
    // Tracks send counts for unique sender-receiver-message combinations
    private final Map<String, Integer> sendCountMap = new HashMap<>();

    private final RebecaModel rebecaModel;

    public LinguaFrancaCodeGenerator(RebecaModel rebecaModel) {
        this.rebecaModel = rebecaModel;
    }

    /**
     * Generates Lingua Franca code from the Rebeca model.
     *
     * @param outputPath The path where the LF code will be written.
     */
    public void generateCode(String outputPath) {
        StringBuilder code = new StringBuilder();
        code.append("target Cpp;\n\n");

        processMainReactor();
        communicationMapInstance = collectCommunicationPatterns();
        msgsrvSendersMap = collectMsgsrvSenders();

        // Detect standalone cycles and emit warnings
        detectStandaloneCycles();

        List<ReactiveClassDeclaration> reactiveClasses = rebecaModel.getRebecaCode().getReactiveClassDeclaration();
        for (ReactiveClassDeclaration reactiveClass : reactiveClasses) {
            String className = reactiveClass.getName();
            code.append("reactor ").append(className).append(" {\n");

            generateReactorPorts(code, className, communicationMapInstance);
            generateInputReactions(code, className, communicationMapInstance);
            generateStateVariables(code, reactiveClass);
            generateConstructorReaction(code, reactiveClass, className);
            generateMessageServers(code, reactiveClass, communicationMapInstance, msgsrvSendersMap);

            code.append("}\n\n");
        }

        generateMainReactor(code);

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(outputPath))) {
            writer.write(code.toString());
            System.out.println("Lingua Franca code generated at: " + outputPath);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * Processes the main reactor to map instance names to their corresponding classes.
     */
    private void processMainReactor() {
        MainDeclaration mainDecl = rebecaModel.getRebecaCode().getMainDeclaration();
        if (mainDecl == null) return;
        for (MainRebecDefinition mainRebecDef : mainDecl.getMainRebecDefinition()) {
            String className = mainRebecDef.getType().getTypeName();
            String instanceName = mainRebecDef.getName();
            instanceClassMap.put(instanceName, className);
        }
    }

    /**
     * Collects communication patterns by mapping senders to receivers and messages.
     * Now instance-based.
     *
     * @return A map representing communication patterns.
     */
    private Map<String, Map<String, Map<String, Integer>>> collectCommunicationPatterns() {
        Map<String, Map<String, Map<String, Integer>>> commMap = new HashMap<>();
        List<ReactiveClassDeclaration> reactiveClasses = rebecaModel.getRebecaCode().getReactiveClassDeclaration();
        for (ReactiveClassDeclaration rc : reactiveClasses) {
            String senderClassName = rc.getName();
            List<MethodDeclaration> methods = new ArrayList<>(rc.getMsgsrvs());
            methods.addAll(rc.getSynchMethods());
            for (MethodDeclaration method : methods) {
                collectSendStatementsInstance(method.getBlock(), rc, commMap);
            }
            for (ConstructorDeclaration constructor : rc.getConstructors()) {
                collectSendStatementsInstance(constructor.getBlock(), rc, commMap);
            }
        }
        return commMap;
    }

    /**
     * Collects message server senders by mapping receivers and messages to their senders.
     *
     * @return A map representing message server senders.
     */
    private Map<String, Map<String, Set<String>>> collectMsgsrvSenders() {
        Map<String, Map<String, Set<String>>> map = new HashMap<>();
        List<ReactiveClassDeclaration> reactiveClasses = rebecaModel.getRebecaCode().getReactiveClassDeclaration();
        for (ReactiveClassDeclaration rc : reactiveClasses) {
            String senderClassName = rc.getName();
            List<MethodDeclaration> methods = new ArrayList<>(rc.getMsgsrvs());
            methods.addAll(rc.getSynchMethods());
            for (MethodDeclaration method : methods) {
                collectMsgsrvSendersInstance(method.getBlock(), rc, map);
            }
            for (ConstructorDeclaration constructor : rc.getConstructors()) {
                collectMsgsrvSendersInstance(constructor.getBlock(), rc, map);
            }
        }
        return map;
    }

    /**
     * Recursively collects send statements, updating communicationMapInstance only for external sends.
     *
     * @param stmt        The statement to process.
     * @param senderClass The reactive class of the sender.
     * @param commMap     The communication map to update.
     */
    private void collectSendStatementsInstance(Statement stmt, ReactiveClassDeclaration senderClass,
                                               Map<String, Map<String, Map<String, Integer>>> commMap) {
        if (stmt == null) return;
        if (stmt instanceof BlockStatement bs) {
            for (Statement s : bs.getStatements()) {
                collectSendStatementsInstance(s, senderClass, commMap);
            }
        } else if (stmt instanceof Expression expr) {
            processExpressionInstance(expr, senderClass, commMap);
        } else if (stmt instanceof ConditionalStatement ifs) {
            collectSendStatementsInstance(ifs.getStatement(), senderClass, commMap);
            if (ifs.getElseStatement() != null) {
                collectSendStatementsInstance(ifs.getElseStatement(), senderClass, commMap);
            }
        }
    }

    /**
     * Recursively collects message server senders.
     *
     * @param stmt        The statement to process.
     * @param senderClass The reactive class of the sender.
     * @param map         The message server senders map to update.
     */
    private void collectMsgsrvSendersInstance(Statement stmt, ReactiveClassDeclaration senderClass,
                                              Map<String, Map<String, Set<String>>> map) {
        if (stmt == null) return;
        if (stmt instanceof BlockStatement bs) {
            for (Statement s : bs.getStatements()) {
                collectMsgsrvSendersInstance(s, senderClass, map);
            }
        } else if (stmt instanceof Expression expr) {
            processMsgsrvSendersInstance(expr, senderClass, map);
        } else if (stmt instanceof ConditionalStatement ifs) {
            collectMsgsrvSendersInstance(ifs.getStatement(), senderClass, map);
            if (ifs.getElseStatement() != null) {
                collectMsgsrvSendersInstance(ifs.getElseStatement(), senderClass, map);
            }
        }
    }

    /**
     * Processes an expression to identify and record external message sends (instance-based).
     *
     * @param expr        The expression to process.
     * @param senderClass The reactive class of the sender.
     * @param commMap     The communication map to update.
     */
    private void processExpressionInstance(Expression expr, ReactiveClassDeclaration senderClass,
                                           Map<String, Map<String, Map<String, Integer>>> commMap) {
        if (expr instanceof DotPrimary dot) {
            Expression receiverExpr = dot.getLeft();
            Expression methodExpr = dot.getRight();
            if (methodExpr instanceof TermPrimary term) {
                String methodName = term.getName();
                ParentSuffixPrimary psp = term.getParentSuffixPrimary();

                if ("set".equals(methodName) && psp != null) {
                    if (receiverExpr instanceof TermPrimary rt) {
                        String outputPort = rt.getName();
                        String[] parts = outputPort.split("_to_");
                        if (parts.length == 2) {
                            String message = parts[0];
                            String receiverInstanceName = parts[1].substring(0, parts[1].lastIndexOf('_'));
                            // Assign unique port names based on send count
                            // Find sender instance(s) of this class
                            List<String> senderInstances = instanceClassMap.entrySet().stream()
                                    .filter(e -> e.getValue().equals(senderClass.getName()))
                                    .map(Map.Entry::getKey)
                                    .collect(Collectors.toList());
                            for (String senderInstance : senderInstances) {
                                incrementMessageCountInstance(commMap, senderInstance, receiverInstanceName, message, psp, true);
                            }
                        }
                    }
                } else {
                    if (receiverExpr instanceof TermPrimary rt) {
                        String receiverInstanceName = rt.getName();
                        String receiverClassName = instanceClassMap.get(receiverInstanceName);
                        if (receiverClassName != null && !receiverClassName.equals(senderClass.getName())) {
                            // External message send
                            String message = methodName;
                            List<String> senderInstances = instanceClassMap.entrySet().stream()
                                    .filter(e -> e.getValue().equals(senderClass.getName()))
                                    .map(Map.Entry::getKey)
                                    .collect(Collectors.toList());
                            for (String senderInstance : senderInstances) {
                                incrementMessageCountInstance(commMap, senderInstance, receiverInstanceName, message, psp, true);
                            }
                        }
                        // Internal sends are not recorded in commMapInstance
                    }
                }
            }
        } else if (expr instanceof TermPrimary tp) {
            // Handle method calls without 'set', if applicable
            // Currently, no action needed
        } else if (expr instanceof UnaryExpression ue) {
            processExpressionInstance(ue.getExpression(), senderClass, commMap);
        } else if (expr instanceof BinaryExpression be) {
            processExpressionInstance(be.getLeft(), senderClass, commMap);
            processExpressionInstance(be.getRight(), senderClass, commMap);
        }
    }

    /**
     * Recursively collects message server senders.
     *
     * @param expr        The expression to process.
     * @param senderClass The reactive class of the sender.
     * @param map         The message server senders map to update.
     */
    private void processMsgsrvSendersInstance(Expression expr, ReactiveClassDeclaration senderClass,
                                              Map<String, Map<String, Set<String>>> map) {
        if (expr instanceof DotPrimary dot) {
            Expression receiverExpr = dot.getLeft();
            Expression methodExpr = dot.getRight();
            if (methodExpr instanceof TermPrimary term) {
                String methodName = term.getName();
                ParentSuffixPrimary psp = term.getParentSuffixPrimary();

                if ("set".equals(methodName) && psp != null) {
                    if (receiverExpr instanceof TermPrimary rt) {
                        String outputPortName = rt.getName();
                        String[] parts = outputPortName.split("_to_");
                        if (parts.length == 2) {
                            String message = parts[0];
                            String receiverInstanceName = parts[1].substring(0, parts[1].lastIndexOf('_'));
                            // Add sender to the set of senders for this receiver and message
                            for (String senderInstance : instanceClassMap.keySet()) {
                                if (instanceClassMap.get(senderInstance).equals(senderClass.getName())) {
                                    map.computeIfAbsent(receiverInstanceName, k -> new HashMap<>())
                                            .computeIfAbsent(message, k -> new HashSet<>())
                                            .add(senderInstance);
                                }
                            }
                        }
                    }
                } else {
                    if (receiverExpr instanceof TermPrimary rt) {
                        String receiverInstanceName = rt.getName();
                        String receiverClassName = instanceClassMap.get(receiverInstanceName);
                        if (receiverClassName != null && !receiverClassName.equals(senderClass.getName())) {
                            // External message send
                            String message = methodName;
                            for (String senderInstance : instanceClassMap.keySet()) {
                                if (instanceClassMap.get(senderInstance).equals(senderClass.getName())) {
                                    map.computeIfAbsent(receiverInstanceName, k -> new HashMap<>())
                                            .computeIfAbsent(message, k -> new HashSet<>())
                                            .add(senderInstance);
                                }
                            }
                        }
                        // Internal sends are **not** added
                    }
                }
            }
        } else if (expr instanceof TermPrimary tp) {
            // Handle method calls without 'set', if applicable
            // Currently, no action needed
        } else if (expr instanceof UnaryExpression ue) {
            processMsgsrvSendersInstance(ue.getExpression(), senderClass, map);
        } else if (expr instanceof BinaryExpression be) {
            processMsgsrvSendersInstance(be.getLeft(), senderClass, map);
            processMsgsrvSendersInstance(be.getRight(), senderClass, map);
        }
    }

    /**
     * Increments the message count in the communication map for external sends only (instance-based).
     * Assigns unique port names based on the send count.
     *
     * @param commMap           The communication map to update.
     * @param senderInstance    The instance name of the sender.
     * @param receiverInstance  The instance name of the receiver.
     * @param message           The message name.
     * @param psp               The ParentSuffixPrimary containing the after time.
     * @param external          Indicates if the send is external.
     */
    private void incrementMessageCountInstance(Map<String, Map<String, Map<String, Integer>>> commMap,
                                               String senderInstance, String receiverInstance, String message,
                                               ParentSuffixPrimary psp, boolean external) {
        if (external) {
            commMap
                    .computeIfAbsent(senderInstance, k -> new HashMap<>())
                    .computeIfAbsent(receiverInstance, k -> new HashMap<>())
                    .merge(message, 1, Integer::sum);

            // Fetch the updated count
            int count = commMap.get(senderInstance).get(receiverInstance).get(message);

            long afterTime = extractAfterTime(psp);
            if (afterTime >= 0) { // Consider 0ms as acceptable to break immediate loops
                String key = senderInstance + "|" + receiverInstance + "|" + message + "|" + count;
                externalAfterTimes.put(key, afterTime);
            }
            // Internal sends are not recorded in commMapInstance
        }
    }

    /**
     * Finds the sender instance for a given class name.
     * Assumes that each class has unique instances or one instance.
     *
     * @param className The class name to search for.
     * @return The instance name, or null if not found.
     */
    private String findSenderInstance(String className) {
        // In Rebeca, typically one instance per class in the main reactor
        // Adjust this method if multiple instances per class are possible
        return instanceClassMap.entrySet().stream()
                .filter(e -> e.getValue().equals(className))
                .map(Map.Entry::getKey)
                .findFirst()
                .orElse(null);
    }

    /**
     * Generates reactor ports based on external communication patterns (instance-based).
     * Assigns unique port names for each send to handle multiple sends correctly.
     *
     * @param code             The StringBuilder to append code to.
     * @param className        The name of the current reactor class.
     * @param communicationMap The instance-based communication map.
     */
    private void generateReactorPorts(StringBuilder code, String className,
                                      Map<String, Map<String, Map<String, Integer>>> communicationMap) {
        Set<String> inputSet = new HashSet<>();
        Set<String> outputSet = new HashSet<>();

        for (var senderEntry : communicationMap.entrySet()) {
            String senderInstance = senderEntry.getKey();
            String senderClass = instanceClassMap.get(senderInstance);
            if (!senderClass.equals(className)) continue; // Only handle instances of the current class
            var receiversMap = senderEntry.getValue();
            for (var receiverEntry : receiversMap.entrySet()) {
                String receiverInstance = receiverEntry.getKey();
                var messages = receiverEntry.getValue();
                for (var messageEntry : messages.entrySet()) {
                    String message = messageEntry.getKey();
                    int count = messageEntry.getValue();
                    for (int i = 1; i <= count; i++) {
                        // Assign unique port names by incorporating both sender and receiver instances
                        String inputName = message + "_from_" + senderInstance + "_" + i;
                        String outputName = message + "_to_" + receiverInstance + "_" + i;

                        if (!inputSet.contains(inputName)) {
                            code.append("    input ").append(inputName).append(": int;\n");
                            inputSet.add(inputName);
                        }

                        if (!outputSet.contains(outputName)) {
                            code.append("    output ").append(outputName).append(": int;\n");
                            outputSet.add(outputName);
                        }
                    }
                }
            }
        }
    }

    /**
     * Generates input reactions based on external communication patterns (instance-based).
     * Assigns reactions to handle each unique input port.
     *
     * @param code             The StringBuilder to append code to.
     * @param className        The name of the current reactor class.
     * @param communicationMap The instance-based communication map.
     */
    private void generateInputReactions(StringBuilder code, String className,
                                        Map<String, Map<String, Map<String, Integer>>> communicationMap) {
        Map<String, List<String>> inputToMessages = new HashMap<>();

        for (var senderEntry : communicationMap.entrySet()) {
            String senderInstance = senderEntry.getKey();
            String senderClass = instanceClassMap.get(senderInstance);
            if (!senderClass.equals(className)) continue; // Only handle instances of the current class
            var receiversMap = senderEntry.getValue();
            for (var receiverEntry : receiversMap.entrySet()) {
                String receiverInstance = receiverEntry.getKey();
                var messages = receiverEntry.getValue();
                for (var msgEntry : messages.entrySet()) {
                    String message = msgEntry.getKey();
                    int count = msgEntry.getValue();
                    for (int i = 1; i <= count; i++) {
                        String inputName = message + "_from_" + senderInstance + "_" + i;
                        inputToMessages.computeIfAbsent(inputName, k -> new ArrayList<>()).add(message);
                    }
                }
            }
        }

        // Generate a reaction for each unique input port
        for (var entry : inputToMessages.entrySet()) {
            String inputPort = entry.getKey();
            String message = entry.getValue().get(0); // Assuming one message per input port
            code.append("    reaction(").append(inputPort).append(") {=\n");
            code.append("        // Handle ").append(message).append("\n");
            code.append("    =}\n");
        }
    }

    /**
     * Generates state variables for the reactor.
     *
     * @param code          The StringBuilder to append code to.
     * @param reactiveClass The reactive class declaration.
     */
    private void generateStateVariables(StringBuilder code, ReactiveClassDeclaration reactiveClass) {
        List<FieldDeclaration> stateVars = reactiveClass.getStatevars();
        for (FieldDeclaration fieldDecl : stateVars) {
            String lfType = getLinguaFrancaType(fieldDecl.getType());
            for (VariableDeclarator varDecl : fieldDecl.getVariableDeclarators()) {
                code.append("    state ").append(varDecl.getVariableName()).append(": ").append(lfType);
                // Retrieve the initializer if available
                VariableInitializer initializerObj = varDecl.getVariableInitializer();
                if (initializerObj != null) {
                    // Assuming VariableInitializer has a toString() method that returns the initializer as a string
                    String initialValue = initializerObj.toString();
                    code.append(" = ").append(initialValue);
                } else if (lfType.equals("int")) {
                    code.append(" = 0"); // Assign default value for int if no initializer
                }
                // Add more default assignments for other types as needed
                code.append(";\n");
            }
        }
    }

    /**
     * Generates constructor reactions, scheduling internal message sends with appropriate after times.
     *
     * @param code          The StringBuilder to append code to.
     * @param reactiveClass The reactive class declaration.
     * @param className     The name of the current reactor class.
     */
    private void generateConstructorReaction(StringBuilder code, ReactiveClassDeclaration reactiveClass, String className) {
        for (ConstructorDeclaration constructor : reactiveClass.getConstructors()) {
            BlockStatement body = constructor.getBlock();
            if (body != null && !body.getStatements().isEmpty()) {
                List<Statement> nonInit = excludeVariableInitializations(body.getStatements(), reactiveClass);
                if (!nonInit.isEmpty()) {
                    List<ActionDetail> actions = new ArrayList<>();
                    List<String> others = new ArrayList<>();
                    for (Statement stmt : nonInit) {
                        ActionDetail actionDetail = translateSelfMessageSend(stmt, className);
                        if (actionDetail != null) {
                            actions.add(actionDetail);
                        } else {
                            Set<String> dummySet = new HashSet<>();
                            String tr = translateStatement(stmt, className, dummySet);
                            if (!tr.isEmpty()) {
                                others.add(tr);
                            }
                        }
                    }
                    if (!actions.isEmpty() || !others.isEmpty()) {
                        code.append("\n    reaction(startup");
                        if (!actions.isEmpty()) {
                            // Collect action names separated by commas if multiple
                            String actionNames = actions.stream()
                                    .map(ad -> ad.actionName)
                                    .collect(Collectors.joining(", "));
                            code.append(") -> ").append(actionNames);
                        } else {
                            code.append(")");
                        }
                        code.append(" {=\n");
                        for (ActionDetail ad : actions) {
                            code.append("        ").append(ad.scheduleStatement).append("\n");
                        }
                        for (String o : others) {
                            code.append("        ").append(o).append("\n");
                        }
                        code.append("    =}\n");
                    }
                }
            }
        }
    }

    /**
     * Excludes variable initializations from the list of statements.
     * Specifically excludes assignments to state variables.
     *
     * @param statements    The list of statements.
     * @param reactiveClass The reactive class declaration containing state variables.
     * @return The filtered list of statements.
     */
    private List<Statement> excludeVariableInitializations(List<Statement> statements, ReactiveClassDeclaration reactiveClass) {
        Set<String> stateVarNames = reactiveClass.getStatevars().stream()
                .flatMap(fieldDecl -> fieldDecl.getVariableDeclarators().stream())
                .map(VariableDeclarator::getVariableName)
                .collect(Collectors.toSet());

        List<Statement> filtered = new ArrayList<>();
        for (Statement stmt : statements) {
            if (stmt instanceof Expression expr) {
                if (expr instanceof BinaryExpression binExpr && binExpr.getOperator().equals("=")) {
                    String lhs = extractVariableName(binExpr.getLeft());
                    if (lhs == null || !stateVarNames.contains(lhs)) {
                        filtered.add(stmt);
                    }
                    // Else: Exclude assignment to state variable
                } else {
                    filtered.add(stmt);
                }
            } else {
                filtered.add(stmt);
            }
        }
        return filtered;
    }

    /**
     * Translates self message sends in constructors, extracting the after time and scheduling appropriately.
     *
     * @param stmt      The statement representing the self message send.
     * @param className The current class name.
     * @return An ActionDetail containing the action name and schedule statement, or null if not a self message send.
     */
    private ActionDetail translateSelfMessageSend(Statement stmt, String className) {
        if (stmt instanceof Expression expr) {
            if (expr instanceof DotPrimary dp) {
                Expression receiver = dp.getLeft();
                Expression methodExpr = dp.getRight();
                if (receiver instanceof TermPrimary tpr && "self".equals(tpr.getName())) {
                    if (methodExpr instanceof TermPrimary tpMethod) {
                        ParentSuffixPrimary psp = tpMethod.getParentSuffixPrimary();
                        if (psp != null) {
                            String methodName = tpMethod.getName();
                            long afterTime = extractAfterTime(psp);
                            String schedule = methodName + ".schedule(" + afterTime + "ms);";
                            return new ActionDetail(methodName, schedule);
                        }
                    }
                }
            } else if (expr instanceof TermPrimary tp) {
                // Handle method calls like sendMsg2();
                ParentSuffixPrimary psp = tp.getParentSuffixPrimary();
                if (psp != null) {
                    String methodName = tp.getName();
                    long afterTime = extractAfterTime(psp);
                    String schedule = methodName + ".schedule(" + afterTime + "ms);";
                    return new ActionDetail(methodName, schedule);
                }
            }
        }
        return null;
    }

    /**
     * Translates an expression into Lingua Franca code, handling message sends.
     *
     * @param expr           The expression to translate.
     * @param className      The name of the current reactor class.
     * @param affectedPorts A set to collect affected ports.
     * @return The translated expression as a string.
     */
    private String translateExpression(Expression expr, String className, Set<String> affectedPorts) {
        if (expr instanceof DotPrimary dotPrimary) {
            Expression receiverExpr = dotPrimary.getLeft();
            Expression methodExpr = dotPrimary.getRight();

            if (methodExpr instanceof TermPrimary termPrimary) {
                // Extract after time if any
                long afterTime = extractAfterTime(termPrimary.getParentSuffixPrimary());

                String methodName = termPrimary.getName();
                ParentSuffixPrimary psp = termPrimary.getParentSuffixPrimary();

                if (methodName.equals("set") && psp != null) {
                    // External message send
                    if (receiverExpr instanceof TermPrimary receiverTerm) {
                        String outputPortName = receiverTerm.getName();
                        return outputPortName + ".set(0);";
                    }
                } else {
                    // Possibly internal or external call
                    if (receiverExpr instanceof TermPrimary receiverTerm) {
                        String receiverInstanceName = receiverTerm.getName();
                        String receiverClassName = instanceClassMap.get(receiverInstanceName);

                        if (receiverClassName != null && !receiverClassName.equals(className)) {
                            // External message send
                            String message = methodName;
                            String senderInstance = findSenderInstance(className);
                            String receiverInstance = receiverInstanceName;

                            if (senderInstance != null && receiverInstance != null) {
                                // Increment send count
                                String key = senderInstance + "|" + receiverInstance + "|" + message;
                                int count = sendCountMap.getOrDefault(key, 0) + 1;
                                sendCountMap.put(key, count);

                                String uniqueOutputName = message + "_to_" + receiverInstance + "_" + count;
                                String uniqueInputName = message + "_from_" + senderInstance + "_" + count;

                                // Add to affected ports
                                affectedPorts.add(uniqueOutputName);

                                // Record the connection mapping
                                externalAfterTimes.put(senderInstance + "|" + receiverInstance + "|" + message + "|" + count, afterTime);

                                return uniqueOutputName + ".set(0);";
                            }
                        } else if (receiverClassName != null && receiverClassName.equals(className)) {
                            // Internal message send
                            String actionName = methodName;
                            affectedPorts.add(actionName);
                            if (afterTime >= 0) { // Allow 0ms delays to break immediate loops
                                return actionName + ".schedule(" + afterTime + "ms);";
                            } else {
                                // Negative delays are invalid; handle as needed
                                return actionName + ".schedule(0ms);";
                            }
                        }
                    }
                }
            }

            // For nested DotPrimary expressions
            String receiver = translateExpression(receiverExpr, className, affectedPorts);
            String methodCall = translateExpression(methodExpr, className, affectedPorts);
            return receiver + "." + methodCall;
        } else if (expr instanceof TermPrimary termPrimary) {
            ParentSuffixPrimary psp = termPrimary.getParentSuffixPrimary();
            long afterTime = extractAfterTime(psp);
            if (psp != null) {
                String methodName = termPrimary.getName();
                affectedPorts.add(methodName);
                if (afterTime >= 0) { // Allow 0ms delays
                    return methodName + ".schedule(" + afterTime + "ms);";
                } else {
                    // Negative delays are invalid; handle as needed
                    return methodName + ".schedule(0ms);";
                }
            } else {
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
        return "";
    }

    /**
     * Generates message servers for the reactor.
     *
     * @param code             The StringBuilder to append code to.
     * @param reactiveClass    The reactive class declaration.
     * @param communicationMap The instance-based communication map.
     * @param msgsrvSendersMap The message server senders map.
     */
    private void generateMessageServers(StringBuilder code, ReactiveClassDeclaration reactiveClass,
                                        Map<String, Map<String, Map<String, Integer>>> communicationMap,
                                        Map<String, Map<String, Set<String>>> msgsrvSendersMap) {
        String className = reactiveClass.getName();
        for (MsgsrvDeclaration msgSrv : reactiveClass.getMsgsrvs()) {
            String msgName = msgSrv.getName();
            boolean isExternal = false;
            Set<String> senders = msgsrvSendersMap.getOrDefault(className, Collections.emptyMap())
                    .getOrDefault(msgName, Collections.emptySet());
            for (String sc : senders) {
                if (!sc.equals(className)) {
                    isExternal = true;
                    break;
                }
            }

            if (isExternal) {
                // External message server; already handled by generateInputReactions.
                // No need to generate additional code.
            } else {
                // Internal message server
                generateInternalMessageServer(code, msgSrv, className);
            }
        }
    }

    /**
     * Generates internal message server reactions.
     *
     * @param code      The StringBuilder to append code to.
     * @param msgSrv    The message server declaration.
     * @param className The name of the current reactor class.
     */
    private void generateInternalMessageServer(StringBuilder code, MsgsrvDeclaration msgSrv, String className) {
        String actionName = msgSrv.getName();
        code.append("    logical action ").append(actionName).append(";\n");
        Set<String> affectedPorts = new HashSet<>();
        List<String> stmts = new ArrayList<>();
        for (Statement stmt : msgSrv.getBlock().getStatements()) {
            String t = translateStatement(stmt, className, affectedPorts);
            if (!t.isEmpty()) {
                stmts.add(t);
            }
        }
        code.append("    reaction(").append(actionName);
        if (!affectedPorts.isEmpty()) {
            code.append(") -> ").append(String.join(", ", affectedPorts));
        } else {
            code.append(")");
        }
        code.append(" {=\n");
        for (String s : stmts) {
            code.append("        ").append(s).append("\n");
        }
        code.append("    =}\n");
    }

    /**
     * Generates the main reactor, establishing connections between reactors based on communicationMapInstance.
     *
     * @param code The StringBuilder to append code to.
     */
    private void generateMainReactor(StringBuilder code) {
        MainDeclaration mainDecl = rebecaModel.getRebecaCode().getMainDeclaration();
        if (mainDecl == null) return;

        code.append("main reactor {\n");

        for (MainRebecDefinition mainRebecDef : mainDecl.getMainRebecDefinition()) {
            String className = mainRebecDef.getType().getTypeName();
            String instanceName = mainRebecDef.getName();
            List<Expression> args = mainRebecDef.getArguments();
            if (args != null && !args.isEmpty()) {
                List<String> argList = new ArrayList<>();
                for (Expression arg : args) {
                    String argStr = getArgumentString(arg);
                    if (argStr != null && !argStr.isEmpty()) {
                        argList.add(argStr);
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

        // Iterate over externalAfterTimes to create connections
        for (var entry : externalAfterTimes.entrySet()) {
            String[] keyParts = entry.getKey().split("\\|");
            if (keyParts.length != 4) continue; // Ensure key has sender, receiver, message, count
            String senderInstance = keyParts[0];
            String receiverInstance = keyParts[1];
            String message = keyParts[2];
            String count = keyParts[3];
            Long afterTime = entry.getValue();

            String outputPortName = message + "_to_" + receiverInstance + "_" + count;
            String inputPortName = message + "_from_" + senderInstance + "_" + count;

            String uniqueConnection = senderInstance + "." + outputPortName + " -> " + receiverInstance + "." + inputPortName;
            code.append("    ").append(uniqueConnection);
            if (afterTime != null && afterTime > 0) {
                code.append(" after ").append(afterTime).append("ms");
            }
            code.append(";\n");
        }

        code.append("}\n");
    }

    /**
     * Extracts the after time from the ParentSuffixPrimary.
     *
     * @param psp The ParentSuffixPrimary containing the after expression.
     * @return The extracted after time in milliseconds, or 0 if not present or invalid.
     */
    private long extractAfterTime(ParentSuffixPrimary psp) {
        if (psp instanceof TimedRebecaParentSuffixPrimary timedPsp) {
            Expression afterExpr = timedPsp.getAfterExpression();
            if (afterExpr instanceof Literal lit) {
                try {
                    return Long.parseLong(lit.getLiteralValue());
                } catch (NumberFormatException ignore) {}
            }
        }
        return 0;
    }

    /**
     * Retrieves the argument string from an expression.
     * Handles both instance references and literals.
     *
     * @param expr The expression to extract the argument from.
     * @return The argument as a string, or null if it cannot be extracted.
     */
    private String getArgumentString(Expression expr) {
        if (expr instanceof TermPrimary tp) {
            return tp.getName();
        } else if (expr instanceof Literal lit) {
            return lit.getLiteralValue();
        }
        // Add more cases if your object model has other expression types
        return null;
    }

    /**
     * Maps Rebeca types to Lingua Franca types.
     *
     * @param type The Rebeca type.
     * @return The corresponding Lingua Franca type as a string.
     */
    private String getLinguaFrancaType(Type type) {
        if (type == null) return "void";
        String typeName = type.getTypeName();
        return switch (typeName) {
            case "int" -> "int";
            case "boolean" -> "bool";
            case "double" -> "double";
            case "String" -> "string";
            default -> typeName;
        };
    }

    /**
     * Detects standalone cycles in the communication graph and emits warnings.
     * A standalone cycle is a closed loop where all message sends have 'after' times >= 0ms,
     * allowing the cycle to perpetuate indefinitely without external breaks.
     */
    private void detectStandaloneCycles() {
        // Step 1: Build communication graph (sender instance -> receiver instances)
        Map<String, Set<String>> graph = new HashMap<>();
        for (String sender : communicationMapInstance.keySet()) {
            Set<String> receivers = communicationMapInstance.get(sender).keySet();
            graph.put(sender, receivers);
        }

        // Step 2: Detect cycles using DFS
        Set<List<String>> cycles = new HashSet<>();
        Set<String> visited = new HashSet<>();
        Set<String> stackSet = new HashSet<>();
        List<String> stackList = new ArrayList<>();

        for (String node : graph.keySet()) {
            if (!visited.contains(node)) {
                dfsCycleDetection(node, graph, visited, stackSet, stackList, cycles);
            }
        }

        // Step 3: Analyze cycles for standalone characteristics
        for (List<String> cycle : cycles) {
            boolean isStandalone = true;
            // Iterate through the cycle to check 'after' times
            for (int i = 0; i < cycle.size(); i++) {
                String sender = cycle.get(i);
                String receiver = cycle.get((i + 1) % cycle.size());

                // For the sender-receiver pair, retrieve all messages
                Map<String, Map<String, Integer>> receiversMap = communicationMapInstance.get(sender);
                if (receiversMap == null || !receiversMap.containsKey(receiver)) {
                    continue; // No messages; skip
                }

                Map<String, Integer> messages = receiversMap.get(receiver);
                for (Map.Entry<String, Integer> msgEntry : messages.entrySet()) {
                    String message = msgEntry.getKey();
                    int count = msgEntry.getValue();

                    for (int c = 1; c <= count; c++) {
                        String key = sender + "|" + receiver + "|" + message + "|" + c;
                        Long afterTime = externalAfterTimes.get(key);
                        if (afterTime == null || afterTime < 0) {
                            // Missing 'after' time or negative delay indicates a potential standalone cycle
                            isStandalone = false;
                            break;
                        }
                    }
                    if (!isStandalone) break;
                }
                if (!isStandalone) break;
            }

            if (isStandalone && !cycle.isEmpty()) {
                // Emit warning for the standalone cycle
                String cycleStr = String.join(" -> ", cycle) + " -> " + cycle.get(0);
                System.out.println("Warning: Standalone cycle detected involving the following reactors: " + cycleStr);
            }
        }
    }

    /**
     * Helper method to perform DFS and detect cycles.
     *
     * @param currentNode The current node being visited.
     * @param graph       The communication graph.
     * @param visited     Set of already visited nodes.
     * @param stackSet    Set representing the current traversal stack.
     * @param stackList   List representing the current traversal path.
     * @param cycles      Set to store detected cycles.
     */
    private void dfsCycleDetection(String currentNode, Map<String, Set<String>> graph,
                                   Set<String> visited, Set<String> stackSet,
                                   List<String> stackList, Set<List<String>> cycles) {
        visited.add(currentNode);
        stackSet.add(currentNode);
        stackList.add(currentNode);

        Set<String> neighbors = graph.getOrDefault(currentNode, Collections.emptySet());
        for (String neighbor : neighbors) {
            if (!visited.contains(neighbor)) {
                dfsCycleDetection(neighbor, graph, visited, stackSet, stackList, cycles);
            } else if (stackSet.contains(neighbor)) {
                // Cycle detected; extract the cycle path
                int index = stackList.indexOf(neighbor);
                if (index != -1) {
                    List<String> cycle = new ArrayList<>(stackList.subList(index, stackList.size()));
                    cycles.add(cycle);
                }
            }
        }

        stackSet.remove(currentNode);
        stackList.remove(stackList.size() - 1);
    }

    /**
     * Helper class to hold action details.
     */
    private static class ActionDetail {
        String actionName;
        String scheduleStatement;

        ActionDetail(String actionName, String scheduleStatement) {
            this.actionName = actionName;
            this.scheduleStatement = scheduleStatement;
        }
    }

    /**
     * Extracts the variable name from an expression.
     *
     * @param expr The expression from which to extract the variable name.
     * @return The variable name as a string, or null if it cannot be extracted.
     */
    private String extractVariableName(Expression expr) {
        if (expr instanceof TermPrimary tp) {
            return tp.getName();
        } else if (expr instanceof DotPrimary dp) {
            // For expressions like self.id, extract 'id'
            Expression rightExpr = dp.getRight();
            if (rightExpr instanceof TermPrimary tpRight) {
                return tpRight.getName();
            }
        }
        // Add more cases if necessary
        return null;
    }

    /**
     * Translates statements to Lingua Franca code, handling internal message sends.
     *
     * @param stmt          The statement to translate.
     * @param className     The name of the current reactor class.
     * @param affectedPorts A set to collect affected ports.
     * @return The translated statement as a string.
     */
    private String translateStatement(Statement stmt, String className, Set<String> affectedPorts) {
        if (stmt instanceof BlockStatement bs) {
            StringBuilder sb = new StringBuilder();
            sb.append("{\n");
            for (Statement s : bs.getStatements()) {
                String t = translateStatement(s, className, affectedPorts);
                if (!t.isEmpty()) {
                    sb.append("    ").append(t).append("\n");
                }
            }
            sb.append("}");
            return sb.toString();
        } else if (stmt instanceof Expression expr) {
            return translateExpression(expr, className, affectedPorts);
        } else if (stmt instanceof ConditionalStatement ifs) {
            String cond = translateExpression(ifs.getCondition(), className, affectedPorts);
            String thenPart = translateStatement(ifs.getStatement(), className, affectedPorts);
            String elsePart = ifs.getElseStatement() != null ? translateStatement(ifs.getElseStatement(), className, affectedPorts) : "";
            String elseClause = elsePart.isEmpty() ? "" : " else " + elsePart;
            return "if (" + cond + ") " + thenPart + elseClause;
        }
        return "";
    }

    /**
     * Helper method to assign unique output port names based on send counts.
     * This ensures that each send operation has a unique port.
     *
     * @param senderInstance   The sender instance name.
     * @param receiverInstance The receiver instance name.
     * @param message          The message name.
     * @return The unique output port name.
     */
    private String getUniqueOutputPort(String senderInstance, String receiverInstance, String message) {
        String key = senderInstance + "|" + receiverInstance + "|" + message;
        int count = sendCountMap.getOrDefault(key, 0) + 1;
        sendCountMap.put(key, count);
        return message + "_to_" + receiverInstance + "_" + count;
    }
}
