package org.rebecalang.compiler;

import org.rebecalang.compiler.modelcompiler.linguafranca.TimedRebecaToLinguaFrancaCompilerFacade;
import org.rebecalang.compiler.utils.ExceptionContainer;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import java.io.File;
import java.io.FilenameFilter;

public class RebecaCompilerMain {
    public static void main(String[] args) {
        ApplicationContext context = new AnnotationConfigApplicationContext(CompilerConfig.class);

        TimedRebecaToLinguaFrancaCompilerFacade compiler = context.getBean(TimedRebecaToLinguaFrancaCompilerFacade.class);
        ExceptionContainer exceptionContainer = context.getBean(ExceptionContainer.class);

        // Define the directory containing Rebeca model files
        String modelDirectoryPath = "benchmarks";
        File modelDirectory = new File(modelDirectoryPath);

        // Define the output directory where LF code will be generated
        String outputDirectoryPath = "CompiledLF";
        File outputDirectory = new File(outputDirectoryPath);

        // Create the output directory if it doesn't exist
        if (!outputDirectory.exists()) {
            boolean created = outputDirectory.mkdirs();
            if (!created) {
                System.err.println("Failed to create output directory at: " + outputDirectoryPath);
                return;
            }
        }

        // Check if the model directory exists and is indeed a directory
        if (!modelDirectory.exists() || !modelDirectory.isDirectory()) {
            System.err.println("Model directory does not exist or is not a directory: " + modelDirectoryPath);
            return;
        }

        // Filter to select only .rebeca files
        FilenameFilter rebecaFilter = (dir, name) -> name.toLowerCase().endsWith(".rebeca");

        // List all .rebeca files in the model directory
        File[] rebecaFiles = modelDirectory.listFiles(rebecaFilter);

        if (rebecaFiles == null || rebecaFiles.length == 0) {
            System.out.println("No Rebeca model files found in directory: " + modelDirectoryPath);
            return;
        }

        // Iterate over each Rebeca file and compile it
        for (File rebecaFile : rebecaFiles) {
            String inputFilePath = rebecaFile.getAbsolutePath();

            // Derive the output file name by replacing the .rebeca extension with .lf
            String outputFileName = rebecaFile.getName().substring(0, rebecaFile.getName().lastIndexOf('.')) + ".lf";
            String outputFilePath = new File(outputDirectory, outputFileName).getAbsolutePath();

            // Set the input file and output path for the compiler
            compiler.setInputFile(inputFilePath);
            compiler.setOutputPath(outputFilePath);

            try {
                compiler.compile();

                if (exceptionContainer.getExceptions().isEmpty()) {
                    System.out.println("Compilation successful for file: " + rebecaFile.getName());
                } else {
                    System.out.println("Compilation had errors for file: " + rebecaFile.getName());
                    // Clear exceptions after handling
                    exceptionContainer.clear();
                }
            } catch (Exception e) {
                System.err.println("Compilation failed for file: " + rebecaFile.getName() + " with error: " + e.getMessage());
                //e.printStackTrace();
            }
        }

        System.out.println("All Rebeca model files have been processed.");
    }
}
