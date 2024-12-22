package org.rebecalang.compiler.modelcompiler.linguafranca;

import org.rebecalang.compiler.modelcompiler.corerebeca.objectmodel.*;
import org.rebecalang.compiler.modelcompiler.timedrebeca.objectmodel.TimedRebecaParentSuffixPrimary;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.util.*;
import java.util.stream.Collectors;

/**
 * LinguaFrancaCodeGenerator translates Rebeca models into Lingua Franca (LF) code.
 * It handles multiple instances of the same class, unique port naming,
 * reactor instantiation, and reaction generation based on message sends.
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

    /**
     * Constructs a LinguaFrancaCodeGenerator with the given Rebeca model.
     *
     * @param rebecaModel The Rebeca model to translate.
     */
    public LinguaFrancaCodeGenerator(RebecaModel rebecaModel) {
        this.rebecaModel = rebecaModel;
    }

    /**
     * Generates Lingua Franca code from the Rebeca model and writes it to the specified output path.
     *
     * @param outputPath The file path where the LF code will be written.
     */
    public void generateCode(String outputPath) {
        StringBuilder code = new StringBuilder();
        code.append("target Cpp;\n\n");

        // Step 1: Process main reactor to map instances to classes
        processMainReactor();

        // Step 2: Collect communication patterns (sender, receiver, message)
        communicationMapInstance = collectCommunicationPatterns();

        // Step 3: Collect message server senders
        msgsrvSendersMap = collectMsgsrvSenders();

        // Step 4: Detect standalone cycles
        detectStandaloneCycles();

        // Step 5: Generate port declarations for all reactors
        Map<String, StringBuilder> reactorPortsMap = generateReactorPorts(communicationMapInstance);

        // Step 6: Generate reactor code (ports, reactions, state variables, etc.)
        List<ReactiveClassDeclaration> reactiveClasses = rebecaModel.getRebecaCode().getReactiveClassDeclaration();
        for (ReactiveClassDeclaration reactiveClass : reactiveClasses) {
            String className = reactiveClass.getName();
            code.append("reactor ").append(className).append(" {\n");

            // Append port declarations
            StringBuilder ports = reactorPortsMap.getOrDefault(className, new StringBuilder());
            code.append(ports.toString());

            // Generate state variables
            generateStateVariables(code, reactiveClass);

            // Generate message servers (reactions)
            generateMessageServers(code, reactiveClass, communicationMapInstance, msgsrvSendersMap);

            // Generate constructor reactions if any
            generateConstructorReactions(code, reactiveClass, className);

            code.append("}\n\n");
        }

        // Step 7: Generate main reactor with instantiations and connections
        generateMainReactor(code);

        // Step 8: Print the communication map to the console
        printCommunicationMap();

        // Step 9: Write the generated LF code to the specified output file
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(outputPath))) {
            writer.write(code.toString());
            System.out.println("Lingua Franca code generated at: " + outputPath);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * Processes the main reactor to map instance names to their corresponding class names.
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
     * This map is instance-based.
     *
     * @return A map representing communication patterns.
     */
    private Map<String, Map<String, Map<String, Integer>>> collectCommunicationPatterns() {
        Map<String, Map<String, Map<String, Integer>>> commMap = new HashMap<>();
        List<ReactiveClassDeclaration> reactiveClasses = rebecaModel.getRebecaCode().getReactiveClassDeclaration();
        for (ReactiveClassDeclaration rc : reactiveClasses) {
            String senderClassName = rc.getName();
            // Retrieve all instances of this class
            List<String> senderInstances = instanceClassMap.entrySet().stream()
                    .filter(e -> e.getValue().equals(senderClassName))
                    .map(Map.Entry::getKey)
                    .collect(Collectors.toList());
            List<MethodDeclaration> methods = new ArrayList<>(rc.getMsgsrvs());
            methods.addAll(rc.getSynchMethods());
            for (MethodDeclaration method : methods) {
                for (String senderInstance : senderInstances) {
                    collectSendStatementsInstance(method.getBlock(), rc, senderInstance, commMap);
                }
            }
            for (ConstructorDeclaration constructor : rc.getConstructors()) {
                for (String senderInstance : senderInstances) {
                    collectSendStatementsInstance(constructor.getBlock(), rc, senderInstance, commMap);
                }
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
            // Retrieve all instances of this class
            List<String> senderInstances = instanceClassMap.entrySet().stream()
                    .filter(e -> e.getValue().equals(senderClassName))
                    .map(Map.Entry::getKey)
                    .collect(Collectors.toList());
            List<MethodDeclaration> methods = new ArrayList<>(rc.getMsgsrvs());
            methods.addAll(rc.getSynchMethods());
            for (MethodDeclaration method : methods) {
                for (String senderInstance : senderInstances) {
                    collectMsgsrvSendersInstance(method.getBlock(), rc, senderInstance, map);
                }
            }
            for (ConstructorDeclaration constructor : rc.getConstructors()) {
                for (String senderInstance : senderInstances) {
                    collectMsgsrvSendersInstance(constructor.getBlock(), rc, senderInstance, map);
                }
            }
        }
        return map;
    }

    /**
     * Recursively collects send statements, updating communicationMapInstance only for external sends.
     *
     * @param stmt             The statement to process.
     * @param senderClass      The reactive class of the sender.
     * @param senderInstance   The instance name of the sender.
     * @param commMap          The communication map to update.
     */
    private void collectSendStatementsInstance(Statement stmt, ReactiveClassDeclaration senderClass,
                                               String senderInstance,
                                               Map<String, Map<String, Map<String, Integer>>> commMap) {
        if (stmt == null) return;
        if (stmt instanceof BlockStatement bs) {
            for (Statement s : bs.getStatements()) {
                collectSendStatementsInstance(s, senderClass, senderInstance, commMap);
            }
        } else if (stmt instanceof Expression expr) {
            processExpressionInstance(expr, senderClass, senderInstance, commMap);
        } else if (stmt instanceof ConditionalStatement ifs) {
            collectSendStatementsInstance(ifs.getStatement(), senderClass, senderInstance, commMap);
            if (ifs.getElseStatement() != null) {
                collectSendStatementsInstance(ifs.getElseStatement(), senderClass, senderInstance, commMap);
            }
        }
    }

    /**
     * Recursively collects message server senders.
     *
     * @param stmt             The statement to process.
     * @param senderClass      The reactive class of the sender.
     * @param senderInstance   The instance name of the sender.
     * @param map              The message server senders map to update.
     */
    private void collectMsgsrvSendersInstance(Statement stmt, ReactiveClassDeclaration senderClass,
                                              String senderInstance,
                                              Map<String, Map<String, Set<String>>> map) {
        if (stmt == null) return;
        if (stmt instanceof BlockStatement bs) {
            for (Statement s : bs.getStatements()) {
                collectMsgsrvSendersInstance(s, senderClass, senderInstance, map);
            }
        } else if (stmt instanceof Expression expr) {
            processMsgsrvSendersInstance(expr, senderClass, senderInstance, map);
        } else if (stmt instanceof ConditionalStatement ifs) {
            collectMsgsrvSendersInstance(ifs.getStatement(), senderClass, senderInstance, map);
            if (ifs.getElseStatement() != null) {
                collectMsgsrvSendersInstance(ifs.getElseStatement(), senderClass, senderInstance, map);
            }
        }
    }

    /**
     * Processes an expression to identify and record external message sends (instance-based).
     *
     * @param expr             The expression to process.
     * @param senderClass      The reactive class of the sender.
     * @param senderInstance   The instance name of the sender.
     * @param commMap          The communication map to update.
     */
    private void processExpressionInstance(Expression expr, ReactiveClassDeclaration senderClass,
                                           String senderInstance,
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
                            String receiverInstanceName = parts[1];
                            // External message send
                            incrementMessageCountInstance(commMap, senderInstance, receiverInstanceName, message, psp, true);
                        }
                    }
                } else {
                    if (receiverExpr instanceof TermPrimary rt) {
                        String receiverInstanceName = rt.getName();
                        String receiverClassName = instanceClassMap.get(receiverInstanceName);
                        if (receiverClassName != null && !receiverClassName.equals(senderClass.getName())) {
                            // External message send
                            String message = methodName;
                            incrementMessageCountInstance(commMap, senderInstance, receiverInstanceName, message, psp, true);
                        }
                        // Internal sends are not recorded in commMapInstance
                    }
                }
            }
        } else if (expr instanceof TermPrimary) {
            // Handle method calls without 'set', if applicable
            // Currently, no action needed
        } else if (expr instanceof UnaryExpression ue) {
            processExpressionInstance(ue.getExpression(), senderClass, senderInstance, commMap);
        } else if (expr instanceof BinaryExpression be) {
            processExpressionInstance(be.getLeft(), senderClass, senderInstance, commMap);
            processExpressionInstance(be.getRight(), senderClass, senderInstance, commMap);
        }
    }

    /**
     * Recursively collects message server senders.
     *
     * @param expr             The expression to process.
     * @param senderClass      The reactive class of the sender.
     * @param senderInstance   The instance name of the sender.
     * @param map              The message server senders map to update.
     */
    private void processMsgsrvSendersInstance(Expression expr, ReactiveClassDeclaration senderClass,
                                              String senderInstance,
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
                            String receiverInstanceName = parts[1];
                            // Add sender to the set of senders for this receiver and message
                            map.computeIfAbsent(receiverInstanceName, k -> new HashMap<>())
                                    .computeIfAbsent(message, k -> new HashSet<>())
                                    .add(senderInstance);
                        }
                    }
                } else {
                    if (receiverExpr instanceof TermPrimary rt) {
                        String receiverInstanceName = rt.getName();
                        String receiverClassName = instanceClassMap.get(receiverInstanceName);
                        if (receiverClassName != null && !receiverClassName.equals(senderClass.getName())) {
                            // External message send
                            String message = methodName;
                            map.computeIfAbsent(receiverInstanceName, k -> new HashMap<>())
                                    .computeIfAbsent(message, k -> new HashSet<>())
                                    .add(senderInstance);
                        }
                        // Internal sends are **not** added
                    }
                }
            }
        } else if (expr instanceof TermPrimary) {
            // Handle method calls without 'set', if applicable
            // Currently, no action needed
        } else if (expr instanceof UnaryExpression ue) {
            processMsgsrvSendersInstance(ue.getExpression(), senderClass, senderInstance, map);
        } else if (expr instanceof BinaryExpression be) {
            processMsgsrvSendersInstance(be.getLeft(), senderClass, senderInstance, map);
            processMsgsrvSendersInstance(be.getRight(), senderClass, senderInstance, map);
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
     * Generates reactor ports by declaring output ports in sender reactors and input ports in receiver reactors.
     * All ports are declared as type int.
     *
     * @param communicationMap The instance-based communication map.
     * @return A map from reactor class names to their respective port declarations.
     */
    private Map<String, StringBuilder> generateReactorPorts(
            Map<String, Map<String, Map<String, Integer>>> communicationMap) {
        Map<String, StringBuilder> reactorPortsMap = new HashMap<>();

        for (var senderEntry : communicationMap.entrySet()) {
            String senderInstance = senderEntry.getKey();
            String senderClass = instanceClassMap.get(senderInstance);
            reactorPortsMap.putIfAbsent(senderClass, new StringBuilder());

            var receiversMap = senderEntry.getValue();
            for (var receiverEntry : receiversMap.entrySet()) {
                String receiverInstance = receiverEntry.getKey();
                String receiverClass = instanceClassMap.get(receiverInstance);
                reactorPortsMap.putIfAbsent(receiverClass, new StringBuilder());

                var messages = receiverEntry.getValue();
                for (var messageEntry : messages.entrySet()) {
                    String message = messageEntry.getKey();
                    int count = messageEntry.getValue();
                    for (int i = 1; i <= count; i++) {
                        String outputPortName = "sendMsg_from_" + senderInstance + "_to_" + receiverInstance + "_" + i;
                        String inputPortName = "rcvMsg_from_" + senderInstance + "_to_" + receiverInstance + "_" + i;

                        // Declare output port in sender reactor with type int
                        reactorPortsMap.get(senderClass).append("    output ")
                                .append(outputPortName).append(":int;\n");

                        // Declare input port in receiver reactor with type int
                        reactorPortsMap.get(receiverClass).append("    input ")
                                .append(inputPortName).append(":int;\n");
                    }
                }
            }
        }

        return reactorPortsMap;
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
    private void generateConstructorReactions(StringBuilder code, ReactiveClassDeclaration reactiveClass, String className) {
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

                            // Iterate over all sender instances of this class
                            List<String> senderInstances = instanceClassMap.entrySet().stream()
                                    .filter(e -> e.getValue().equals(className))
                                    .map(Map.Entry::getKey)
                                    .collect(Collectors.toList());

                            List<String> translatedSends = new ArrayList<>();
                            for (String senderInstance : senderInstances) {
                                String key = senderInstance + "|" + receiverInstanceName + "|" + message;
                                int count = sendCountMap.getOrDefault(key, 0) + 1;
                                sendCountMap.put(key, count);

                                String uniqueOutputName = "sendMsg_from_" + senderInstance + "_to_" + receiverInstanceName + "_" + count;
                                String uniqueInputName = "rcvMsg_from_" + senderInstance + "_to_" + receiverInstanceName + "_" + count;

                                // Add to affected ports
                                affectedPorts.add(uniqueOutputName);

                                // Record the connection mapping with after time
                                externalAfterTimes.put(senderInstance + "|" + receiverInstanceName + "|" + message + "|" + count, afterTime);

                                translatedSends.add(uniqueOutputName + ".set(0);");
                            }

                            // Combine all sends, assuming they're separate statements
                            return String.join("\n        ", translatedSends);
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
     * Generates internal message server reactions with actual logic.
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
            String translatedStmt = translateStatement(stmt, className, affectedPorts);
            if (!translatedStmt.isEmpty()) {
                stmts.add(translatedStmt);
            }
        }

        code.append("    reaction(").append(actionName);
        if (!affectedPorts.isEmpty()) {
            code.append(") -> ").append(String.join(", ", affectedPorts));
        } else {
            code.append(")");
        }
        code.append(" {=\n");

        for (String stmt : stmts) {
            code.append("        ").append(stmt).append("\n");
        }

        code.append("    =}\n");
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
     * Generates the main reactor, establishing connections between reactors based on communicationMapInstance.
     *
     * @param code The StringBuilder to append code to.
     */
    private void generateMainReactor(StringBuilder code) {
        MainDeclaration mainDecl = rebecaModel.getRebecaCode().getMainDeclaration();
        if (mainDecl == null) return;

        code.append("main reactor {\n");

        // Instantiate all reactors without constructor arguments
        for (MainRebecDefinition mainRebecDef : mainDecl.getMainRebecDefinition()) {
            String className = mainRebecDef.getType().getTypeName();
            String instanceName = mainRebecDef.getName();
            // Instantiate without arguments
            code.append("    ").append(instanceName).append(" = new ").append(className).append("();\n");
        }

        code.append("\n");

        // Establish connections based on communicationMapInstance
        for (var senderEntry : communicationMapInstance.entrySet()) {
            String senderInstance = senderEntry.getKey();
            var receiversMap = senderEntry.getValue();
            for (var receiverEntry : receiversMap.entrySet()) {
                String receiverInstance = receiverEntry.getKey();
                var messages = receiverEntry.getValue();
                for (var messageEntry : messages.entrySet()) {
                    String message = messageEntry.getKey();
                    int count = messageEntry.getValue();
                    for (int i = 1; i <= count; i++) {
                        String outputPortName = "sendMsg_from_" + senderInstance + "_to_" + receiverInstance + "_" + i;
                        String inputPortName = "rcvMsg_from_" + senderInstance + "_to_" + receiverInstance + "_" + i;
                        Long afterTime = externalAfterTimes.get(senderInstance + "|" + receiverInstance + "|" + message + "|" + i);

                        String uniqueConnection = "    " + senderInstance + "." + outputPortName + " -> " +
                                receiverInstance + "." + inputPortName;
                        if (afterTime != null && afterTime > 0) {
                            uniqueConnection += " after " + afterTime + "ms";
                        }
                        uniqueConnection += ";\n";
                        code.append(uniqueConnection);
                    }
                }
            }
        }

        code.append("}\n");
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
     * Prints the communication map to the console in a readable format.
     * This helps in visualizing the communication patterns between reactors.
     */
    private void printCommunicationMap() {
        System.out.println("=== Communication Map ===");
        for (var senderEntry : communicationMapInstance.entrySet()) {
            String sender = senderEntry.getKey();
            var receiversMap = senderEntry.getValue();
            for (var receiverEntry : receiversMap.entrySet()) {
                String receiver = receiverEntry.getKey();
                var messagesMap = receiverEntry.getValue();
                for (var messageEntry : messagesMap.entrySet()) {
                    String message = messageEntry.getKey();
                    int count = messageEntry.getValue();
                    System.out.println("Sender: " + sender + " -> Receiver: " + receiver +
                            " | Message: " + message + " | Count: " + count);
                }
            }
        }
        System.out.println("==========================");
    }
}
