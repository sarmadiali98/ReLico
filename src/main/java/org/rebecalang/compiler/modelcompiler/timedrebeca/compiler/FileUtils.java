package org.rebecalang.compiler.modelcompiler.timedrebeca.compiler;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;

public class FileUtils {
    public static void writeToFile(String data, String filePath) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(filePath, true))) {
            writer.write(data);
            writer.newLine();  // Write a new line after each entry
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
