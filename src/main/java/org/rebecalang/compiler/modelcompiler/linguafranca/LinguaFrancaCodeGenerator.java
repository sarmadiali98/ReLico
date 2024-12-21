package org.rebecalang.compiler.modelcompiler.linguafranca;

import org.rebecalang.compiler.modelcompiler.corerebeca.objectmodel.*;
import org.rebecalang.compiler.modelcompiler.timedrebeca.objectmodel.TimedRebecaParentSuffixPrimary;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.util.*;
import java.util.stream.Collectors;

/**
 * LinguaFrancaCodeGenerator with handling after times for both external and internal message sends.
 * - External after times are recorded and applied in the main reactor line.
 * - Internal after times are applied at the point of message scheduling inside the reactor code.
 */
public class LinguaFrancaCodeGenerator {
    private final RebecaModel rebecaModel;
    private Map<String, Map<String, Map<String, Integer>>> communicationMap;
    private Map<String, Map<String, Set<String>>> msgsrvSendersMap;
    private final Map<String, String> instanceClassMap = new HashMap<>();
    private final Map<String, Long> externalAfterTimes = new HashMap<>();

    public LinguaFrancaCodeGenerator(RebecaModel rebecaModel) {
        this.rebecaModel = rebecaModel;
    }

    public void generateCode(String outputPath) {
        StringBuilder code = new StringBuilder();
        code.append("target Cpp;\n\n");

        processMainReactor();
        communicationMap = collectCommunicationPatterns();
        msgsrvSendersMap = collectMsgsrvSenders();

        System.out.println("Communication Map:");
        for (var senderEntry : communicationMap.entrySet()) {
            String senderClass = senderEntry.getKey();
            var receiversMap = senderEntry.getValue();
            for (var receiverEntry : receiversMap.entrySet()) {
                String receiverClass = receiverEntry.getKey();
                var messages = receiverEntry.getValue();
                for (var messageEntry : messages.entrySet()) {
                    String message = messageEntry.getKey();
                    int count = messageEntry.getValue();
                    System.out.println(senderClass + " -> " + receiverClass + " : " + message + " x" + count);
                }
            }
        }

        List<ReactiveClassDeclaration> reactiveClasses = rebecaModel.getRebecaCode().getReactiveClassDeclaration();
        for (ReactiveClassDeclaration reactiveClass : reactiveClasses) {
            String className = reactiveClass.getName();
            code.append("reactor ").append(className).append(" {\n");

            generateReactorPorts(code, className, communicationMap);
            generateInputReactions(code, className, communicationMap);
            generateStateVariables(code, reactiveClass);
            generateConstructorReaction(code, reactiveClass, className);
            generateMessageServers(code, reactiveClass, communicationMap, msgsrvSendersMap);

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
     * Only external message sends are recorded.
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
                collectSendStatements(method.getBlock(), senderClassName, commMap, senderClassName);
            }
            for (ConstructorDeclaration constructor : rc.getConstructors()) {
                collectSendStatements(constructor.getBlock(), senderClassName, commMap, senderClassName);
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
                collectMsgsrvSenders(method.getBlock(), senderClassName, map, senderClassName);
            }
            for (ConstructorDeclaration constructor : rc.getConstructors()) {
                collectMsgsrvSenders(constructor.getBlock(), senderClassName, map, senderClassName);
            }
        }
        return map;
    }

    /**
     * Recursively collects send statements, updating communicationMap only for external sends.
     *
     * @param stmt              The statement to process.
     * @param senderClassName   The class name of the sender.
     * @param commMap           The communication map to update.
     * @param currentClassName  The current class name for handling "self".
     */
    private void collectSendStatements(Statement stmt, String senderClassName,
                                       Map<String, Map<String, Map<String, Integer>>> commMap,
                                       String currentClassName) {
        if (stmt == null) return;
        if (stmt instanceof BlockStatement bs) {
            for (Statement s : bs.getStatements()) {
                collectSendStatements(s, senderClassName, commMap, currentClassName);
            }
        } else if (stmt instanceof Expression expr) {
            processExpression(expr, senderClassName, commMap, currentClassName);
        } else if (stmt instanceof ConditionalStatement ifs) {
            collectSendStatements(ifs.getStatement(), senderClassName, commMap, currentClassName);
            if (ifs.getElseStatement() != null) {
                collectSendStatements(ifs.getElseStatement(), senderClassName, commMap, currentClassName);
            }
        }
    }

    /**
     * Recursively collects message server senders.
     *
     * @param stmt              The statement to process.
     * @param senderClassName   The class name of the sender.
     * @param map               The message server senders map to update.
     * @param currentClassName  The current class name for handling "self".
     */
    private void collectMsgsrvSenders(Statement stmt, String senderClassName,
                                      Map<String, Map<String, Set<String>>> map,
                                      String currentClassName) {
        if (stmt == null) return;
        if (stmt instanceof BlockStatement bs) {
            for (Statement s : bs.getStatements()) {
                collectMsgsrvSenders(s, senderClassName, map, currentClassName);
            }
        } else if (stmt instanceof Expression expr) {
            processMsgsrvSenders(expr, senderClassName, map, currentClassName);
        } else if (stmt instanceof ConditionalStatement ifs) {
            collectMsgsrvSenders(ifs.getStatement(), senderClassName, map, currentClassName);
            if (ifs.getElseStatement() != null) {
                collectMsgsrvSenders(ifs.getElseStatement(), senderClassName, map, currentClassName);
            }
        }
    }

    /**
     * Processes an expression to identify and record external message sends.
     *
     * @param expr              The expression to process.
     * @param senderClassName   The class name of the sender.
     * @param commMap           The communication map to update.
     * @param currentClassName  The current class name for handling "self".
     */
    private void processExpression(Expression expr, String senderClassName,
                                   Map<String, Map<String, Map<String, Integer>>> commMap,
                                   String currentClassName) {
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
                            String receiverClassName = parts[1];
                            incrementMessageCount(commMap, senderClassName, receiverClassName, message, psp, true);
                        }
                    }
                } else {
                    if (receiverExpr instanceof TermPrimary rt) {
                        String receiverInstance = rt.getName();
                        String receiverClassName = getClassNameForInstance(receiverInstance, currentClassName);
                        if (receiverClassName != null && !receiverClassName.equals(senderClassName)) {
                            incrementMessageCount(commMap, senderClassName, receiverClassName, methodName, psp, true);
                        }
                        // Internal sends are not recorded in commMap
                    }
                }
            }
        } else if (expr instanceof TermPrimary tp) {
            if (tp.getParentSuffixPrimary() != null) {
                String msgsrvName = tp.getName();
                // Internal sends are not recorded in commMap
                // Thus, do not call incrementMessageCount for internal sends
            }
        } else if (expr instanceof UnaryExpression ue) {
            processExpression(ue.getExpression(), senderClassName, commMap, currentClassName);
        } else if (expr instanceof BinaryExpression be) {
            processExpression(be.getLeft(), senderClassName, commMap, currentClassName);
            processExpression(be.getRight(), senderClassName, commMap, currentClassName);
        }
    }

    /**
     * Increments the message count in the communication map for external sends only.
     *
     * @param commMap          The communication map to update.
     * @param senderClass      The class name of the sender.
     * @param receiverClass    The class name of the receiver.
     * @param message          The message name.
     * @param psp              The ParentSuffixPrimary containing the after time.
     * @param external         Indicates if the send is external.
     */
    private void incrementMessageCount(Map<String, Map<String, Map<String, Integer>>> commMap,
                                       String senderClass, String receiverClass, String message,
                                       ParentSuffixPrimary psp, boolean external) {
        if (external) {
            int oldCount = commMap
                    .computeIfAbsent(senderClass, k -> new HashMap<>())
                    .computeIfAbsent(receiverClass, k -> new HashMap<>())
                    .getOrDefault(message, 0);
            int newCount = oldCount + 1;
            commMap.get(senderClass).get(receiverClass).put(message, newCount);

            long afterTime = extractAfterTime(psp);
            if (afterTime > 0) {
                String key = senderClass + "|" + receiverClass + "|" + message + "|" + newCount;
                externalAfterTimes.put(key, afterTime);
            }
            // Internal sends are not recorded in commMap
        }
    }

    /**
     * Processes an expression to identify and record message server senders.
     *
     * @param expr              The expression to process.
     * @param senderClassName   The class name of the sender.
     * @param map               The message server senders map to update.
     * @param currentClassName  The current class name for handling "self".
     */
    private void processMsgsrvSenders(Expression expr, String senderClassName,
                                      Map<String, Map<String, Set<String>>> map,
                                      String currentClassName) {
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
                            String receiverClassName = parts[1];
                            map.computeIfAbsent(receiverClassName, k -> new HashMap<>())
                                    .computeIfAbsent(message, k -> new HashSet<>())
                                    .add(senderClassName);
                        }
                    }
                } else {
                    if (receiverExpr instanceof TermPrimary rt) {
                        String receiverInstance = rt.getName();
                        String receiverClassName = getClassNameForInstance(receiverInstance, currentClassName);
                        if (receiverClassName != null && !receiverClassName.equals(senderClassName)) {
                            map.computeIfAbsent(receiverClassName, k -> new HashMap<>())
                                    .computeIfAbsent(methodName, k -> new HashSet<>())
                                    .add(senderClassName);
                        }
                        // Internal message sends are **not** added
                    }
                }
            }
        } else if (expr instanceof TermPrimary tp) {
            if (tp.getParentSuffixPrimary() != null) {
                String msgsrvName = tp.getName();
                // Internal sends are not recorded in msgsrvSendersMap
            }
        } else if (expr instanceof UnaryExpression ue) {
            processMsgsrvSenders(ue.getExpression(), senderClassName, map, currentClassName);
        } else if (expr instanceof BinaryExpression be) {
            processMsgsrvSenders(be.getLeft(), senderClassName, map, currentClassName);
            processMsgsrvSenders(be.getRight(), senderClassName, map, currentClassName);
        }
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
     * Generates reactor ports based on external communication patterns.
     *
     * @param code              The StringBuilder to append code to.
     * @param className         The name of the current reactor class.
     * @param communicationMap  The communication map containing external sends.
     */
    private void generateReactorPorts(StringBuilder code, String className,
                                      Map<String, Map<String, Map<String, Integer>>> communicationMap) {
        Set<String> inputSet = new HashSet<>();
        for (var entry : communicationMap.entrySet()) {
            String senderClass = entry.getKey();
            var receivers = entry.getValue();
            if (receivers.containsKey(className) && !senderClass.equals(className)) {
                var messages = receivers.get(className);
                for (var msgEntry : messages.entrySet()) {
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

        Set<String> outputSet = new HashSet<>();
        var outgoing = communicationMap.getOrDefault(className, Collections.emptyMap());
        for (var outEntry : outgoing.entrySet()) {
            String receiverClass = outEntry.getKey();
            if (!receiverClass.equals(className)) {
                var messages = outEntry.getValue();
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
     * Generates input reactions based on external communication patterns.
     *
     * @param code              The StringBuilder to append code to.
     * @param className         The name of the current reactor class.
     * @param communicationMap  The communication map containing external sends.
     */
    private void generateInputReactions(StringBuilder code, String className,
                                        Map<String, Map<String, Map<String, Integer>>> communicationMap) {
        Map<String, List<String>> messageToInputs = new HashMap<>();

        for (var senderEntry : communicationMap.entrySet()) {
            String senderClass = senderEntry.getKey();
            var receiversMap = senderEntry.getValue();
            if (receiversMap.containsKey(className) && !senderClass.equals(className)) {
                var messages = receiversMap.get(className);
                for (var msgEntry : messages.entrySet()) {
                    String message = msgEntry.getKey();
                    int count = msgEntry.getValue();
                    for (int i = 1; i <= count; i++) {
                        String inputName = message + "_from_" + senderClass + "_" + i;
                        messageToInputs.computeIfAbsent(message, k -> new ArrayList<>()).add(inputName);
                    }
                }
            }
        }

        // Generate a single reaction per message that includes all inputs for that message
        for (var entry : messageToInputs.entrySet()) {
            String message = entry.getKey();
            List<String> inputs = entry.getValue();
            code.append("    reaction(").append(String.join(", ", inputs)).append(") {=\n");
            code.append("        //do task\n");
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
                if (lfType.equals("int")) {
                    code.append(" = 0");
                }
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
                List<Statement> nonInit = excludeVariableInitializations(body.getStatements());
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
     * Translates self message sends in constructors, extracting the after time and scheduling appropriately.
     *
     * @param stmt         The statement representing the self message send.
     * @param className    The current class name.
     * @return An ActionDetail containing the action name and schedule statement, or null if not a self message send.
     */
    private ActionDetail translateSelfMessageSend(Statement stmt, String className) {
        if (stmt instanceof Expression expr) {
            if (expr instanceof TermPrimary tp) {
                if (tp.getParentSuffixPrimary() != null) {
                    String methodName = tp.getName();
                    long afterTime = extractAfterTime(tp.getParentSuffixPrimary());
                    String schedule = methodName + ".schedule(" + afterTime + "ms);";
                    return new ActionDetail(methodName, schedule);
                }
            } else if (expr instanceof DotPrimary dp) {
                Expression receiver = dp.getLeft();
                if (receiver instanceof TermPrimary tpr && "self".equals(tpr.getName())) {
                    Expression methodExpr = dp.getRight();
                    if (methodExpr instanceof TermPrimary tpMethod && tpMethod.getParentSuffixPrimary() != null) {
                        String methodName = tpMethod.getName();
                        long afterTime = extractAfterTime(tpMethod.getParentSuffixPrimary());
                        String schedule = methodName + ".schedule(" + afterTime + "ms);";
                        return new ActionDetail(methodName, schedule);
                    }
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
                        String receiverClassName = getClassNameForInstance(receiverInstanceName, className);

                        if (receiverClassName != null && !receiverClassName.equals(className)) {
                            // External message send
                            String outputName = methodName + "_to_" + receiverClassName;
                            affectedPorts.add(outputName);
                            return outputName + ".set(0);";
                        } else if (receiverClassName != null && receiverClassName.equals(className)) {
                            // Internal message send
                            String actionName = methodName;
                            affectedPorts.add(actionName);
                            if (afterTime > 0) {
                                //System.out.println("Internal call with after time detected");
                                return actionName + ".schedule(" + afterTime + "ms);";
                            } else {
                                //System.out.println("Internal call without after time detected");
                                return actionName + ".schedule(0ms);";
                            }
                        }
                    }
                }
            }

            String receiver = translateExpression(receiverExpr, className, affectedPorts);
            String methodCall = translateExpression(methodExpr, className, affectedPorts);
            return receiver + "." + methodCall;
        } else if (expr instanceof TermPrimary termPrimary) {
            ParentSuffixPrimary psp = termPrimary.getParentSuffixPrimary();
            long afterTime = extractAfterTime(psp);
            if (psp != null) {
                String methodName = termPrimary.getName();
                affectedPorts.add(methodName);
                if (afterTime > 0) {
                    //System.out.println("Internal call with after time detected");
                    return methodName + ".schedule(" + afterTime + "ms);";
                } else {
                    //System.out.println("Internal call without after time detected");
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
     * @param code              The StringBuilder to append code to.
     * @param reactiveClass     The reactive class declaration.
     * @param communicationMap  The communication map containing external sends.
     * @param msgsrvSendersMap  The message server senders map.
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
     * Generates the main reactor, establishing connections between reactors based on communicationMap.
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

        for (var senderEntry : communicationMap.entrySet()) {
            String senderClass = senderEntry.getKey();
            var receiversMap = senderEntry.getValue();
            List<String> senderInstances = instanceClassMap.entrySet().stream()
                    .filter(e -> e.getValue().equals(senderClass))
                    .map(Map.Entry::getKey).collect(Collectors.toList());

            for (var receiverEntry : receiversMap.entrySet()) {
                String receiverClass = receiverEntry.getKey();
                var messages = receiverEntry.getValue();

                List<String> receiverInstances = instanceClassMap.entrySet().stream()
                        .filter(e -> e.getValue().equals(receiverClass))
                        .map(Map.Entry::getKey).collect(Collectors.toList());

                for (var msgEntry : messages.entrySet()) {
                    String message = msgEntry.getKey();
                    int count = msgEntry.getValue();

                    for (int i = 1; i <= count; i++) {
                        String senderInstance = senderInstances.get((i - 1) % senderInstances.size());
                        String receiverInstance = receiverInstances.get((i - 1) % receiverInstances.size());
                        String inputPort = message + "_from_" + senderClass + "_" + i;
                        String outputPort = message + "_to_" + receiverClass;

                        String uniqueConnection = senderInstance + "." + outputPort + " -> " + receiverInstance + "." + inputPort;
                        Long afterTime = externalAfterTimes.get(senderClass + "|" + receiverClass + "|" + message + "|" + i);

                        if (!code.toString().contains(uniqueConnection)) {
                            code.append("    ").append(uniqueConnection);
                            if (afterTime != null && afterTime > 0) {
                                code.append(" after ").append(afterTime).append("ms");
                            }
                            code.append(";\n");
                        }
                    }
                }
            }
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
     * Retrieves the class name for a given instance name, handling the "self" keyword.
     *
     * @param instanceName      The name of the instance to look up.
     * @param currentClassName  The name of the current class (reactor) being processed.
     * @return The class name corresponding to the instance, or null if not found.
     */
    private String getClassNameForInstance(String instanceName, String currentClassName) {
        if ("self".equals(instanceName)) {
            return currentClassName;
        }
        for (ReactiveClassDeclaration rc : rebecaModel.getRebecaCode().getReactiveClassDeclaration()) {
            List<FieldDeclaration> knownRebecs = rc.getKnownRebecs();
            if (knownRebecs != null) {
                for (FieldDeclaration fd : knownRebecs) {
                    for (VariableDeclarator var : fd.getVariableDeclarators()) {
                        if (var.getVariableName().equals(instanceName)) {
                            return fd.getType().getTypeName();
                        }
                    }
                }
            }
        }
        return null;
    }

    /**
     * Retrieves the instance name from an expression.
     *
     * @param expr The expression to extract the instance name from.
     * @return The instance name, or null if not applicable.
     */
    private String getInstanceNameFromExpression(Expression expr) {
        if (expr instanceof TermPrimary tp) {
            return tp.getName();
        }
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
     * Excludes variable initializations from the list of statements.
     * Currently, it returns all statements. Implement logic if needed.
     *
     * @param statements The list of statements.
     * @return The filtered list of statements.
     */
    private List<Statement> excludeVariableInitializations(List<Statement> statements) {
        // Implement logic to exclude variable initializations if needed.
        return statements;
    }
}
