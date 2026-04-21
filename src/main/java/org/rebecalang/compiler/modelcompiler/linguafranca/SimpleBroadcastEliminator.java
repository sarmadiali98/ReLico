package org.rebecalang.compiler.modelcompiler.linguafranca;

import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class SimpleBroadcastEliminator {

    private static final Pattern PORT_SET_PATTERN = Pattern.compile("(\\w+_out)\\.set\\(");
    private static final Pattern ACTION_SCHEDULE_PATTERN = Pattern.compile("(\\w+)\\.schedule\\(");

    public String eliminateDuplicates(String lfCode) {
        StringBuilder result = new StringBuilder();
        String[] lines = lfCode.split("\n");

        boolean inReaction = false;
        List<String> reactionLines = new ArrayList<>();

        for (String line : lines) {
            if (line.contains("reaction(") && line.contains("{=")) {
                inReaction = true;
                reactionLines.clear();
                reactionLines.add(line);
                continue;
            }

            if (inReaction) {
                reactionLines.add(line);

                if (line.contains("=}")) {
                    String processed = processReactionBlock(reactionLines);
                    result.append(processed);
                    inReaction = false;
                }
                continue;
            }

            result.append(line).append("\n");
        }

        return result.toString();
    }

    private String processReactionBlock(List<String> reactionLines) {
        StringBuilder result = new StringBuilder();

        Stack<Set<String>> portScopeStack = new Stack<>();
        Stack<Set<String>> actionScopeStack = new Stack<>();

        portScopeStack.push(new HashSet<>());
        actionScopeStack.push(new HashSet<>());

        for (String line : reactionLines) {
            String trimmed = line.trim();

            // Track scope changes
            if (trimmed.matches("(if|else if|else|while|for)\\s*.*\\{")) {
                portScopeStack.push(new HashSet<>());
                actionScopeStack.push(new HashSet<>());
            }

            if (trimmed.equals("}") || trimmed.startsWith("} else")) {
                if (portScopeStack.size() > 1) {
                    portScopeStack.pop();
                    actionScopeStack.pop();
                }
            }

            boolean isDuplicate = false;
            String duplicateType = null;
            String duplicateName = null;

            Set<String> currentPortScope = portScopeStack.peek();
            Set<String> currentActionScope = actionScopeStack.peek();

            // Check for port.set()
            if (line.contains("_out.set(")) {
                String portName = extractPortName(line);
                if (portName != null) {
                    if (currentPortScope.contains(portName)) {
                        isDuplicate = true;
                        duplicateType = "PORT SET";
                        duplicateName = portName;
                    } else {
                        currentPortScope.add(portName);
                    }
                }
            }

            // Check for action.schedule()
            if (line.contains(".schedule(")) {
                String actionName = extractActionName(line);
                if (actionName != null) {
                    if (currentActionScope.contains(actionName)) {
                        isDuplicate = true;
                        duplicateType = "ACTION SCHEDULE";
                        duplicateName = actionName;
                    } else {
                        currentActionScope.add(actionName);
                    }
                }
            }

            if (isDuplicate) {
                //result.append("\n");
            } else {
                result.append(line).append("\n");
            }
        }

        return result.toString();
    }

    private String extractPortName(String line) {
        Matcher m = PORT_SET_PATTERN.matcher(line);
        return m.find() ? m.group(1) : null;
    }

    private String extractActionName(String line) {
        Matcher m = ACTION_SCHEDULE_PATTERN.matcher(line);
        return m.find() ? m.group(1) : null;
    }
}
