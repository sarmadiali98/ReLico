# ReLico: Timed Rebeca to Lingua Franca Compiler

Welcome to the **Timed Rebeca to Lingua Franca Compiler** repository! This tool translates **Timed Rebeca** models into **Lingua Franca (LF)** code. 

The project uses **Spring Framework** and is written in Java. It leverages Maven for dependency management and building. Below are the instructions for installation, usage, and running the program.

---

## Features

1. **Compiles Timed Rebeca Models**: Converts `.rebeca` files into `.lf` files compatible with Lingua Franca.
2. **Batch Compilation**: Processes multiple Rebeca files from a directory and generates corresponding LF files in the output directory.
3. **Customizable Output Path**: Allows users to specify the directory where the compiled LF files are stored.

---

## Project Structure

The project follows a standard Maven structure. Here are key directories and files:

- **Main Code**:
  - `src/main/java/org/rebecalang/compiler/RebecaCompilerMain.java`: The entry point for running the compiler.
  - `src/main/java/org/rebecalang/compiler/modelcompiler/linguafranca/TimedRebecaToLinguaFrancaCompilerFacade.java`: The main logic for handling Timed Rebeca to Lingua Franca translation.
  - `src/main/java/org/rebecalang/compiler/modelcompiler/linguafranca/LinguaFrancaCodeGenerator.java`: The code generator for Lingua Franca.
  
- **Input Models**:
  - `src/test/resources/org/rebecalang/compiler/modelcompiler/models`: Directory containing `.rebeca` files to compile.
  
- **Output LF Code**:
  - `src/test/resources/org/rebecalang/compiler/modelcompiler/compiledLF`: Directory where `.lf` files are generated.

---

## Requirements

- **Java Development Kit (JDK)**: Version 17 or later.
- **Maven**: For building and managing dependencies.
- **System Configuration**: Tested on macOS Sequoia 15.1.1 with Java version 21.0.1 and Ubuntu 24.04.1 with Java version 21.0.5.

---

## Installation

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/sarmadiali98/Relico.git
   cd Relico
   ```
2. **Ensure Java and Maven Are Installed: Verify your installations**:

   ```bash
   java -version
   mvn -version
   ```
3. **Install Dependencies: Use Maven to install dependencies**:

   ```bash
   mvn clean install
   ```

---
   
# Running the Compiler

The compiler can process `.rebeca` files in the input directory and generate corresponding `.lf` files.

## Steps to Run

1. **Ensure Models Are in the Input Directory**:  
   Place `.rebeca` files in the following directory (Optional; Two sample files already exist in the following directory):  
   `src/test/resources/org/rebecalang/compiler/modelcompiler/models`

2. **Run the Compiler**:  
   Execute the following Maven command to run the main class:  
   ```bash
   mvn exec:java -Dexec.mainClass="org.rebecalang.compiler.RebecaCompilerMain"
   ```
   The following output should appear based on your `.rebeca` code:
   ```bash
   Communication Map:
   Sender -> Receiver : receiveMessage x1
   Lingua Franca code generated at: /org.rebecalang.compiler-master/src/test/resources/org/rebecalang/compiler/modelcompiler/compiledLF/Sender_and_Receiver.lf
   Compilation successful for file: Sender_and_Receiver.rebeca
   Communication Map:
   Switch -> Node : runme x2
   Lingua Franca code generated at: /org.rebecalang.compiler-master/src/test/resources/org/rebecalang/compiler/modelcompiler/compiledLF/Node_and_Switch.lf
   Compilation successful for file: Node_and_Switch.rebeca
   All Rebeca model files have been processed.
   [INFO] ------------------------------------------------------------------------
   [INFO] BUILD SUCCESS
   [INFO] ------------------------------------------------------------------------
   [INFO] Total time:  7.331 s
   [INFO] Finished at: 2024-12-06T05:57:44
   [INFO] ------------------------------------------------------------------------
   ```

3. **Check Output**:
   The compiled `.lf` files will be saved in the following directory:
   `src/test/resources/org/rebecalang/compiler/modelcompiler/compiledLF`

---

# Notes

- **Work in Progress**: The compiler is still under development. The following limitations currently apply:
  - Delays (`after` keyword) in Timed Rebeca are not yet fully supported.
  - Circular dependency issues are being actively addressed.

- **Common Issues**:
  1. **Maven Not Installed**: Ensure Maven is installed on your system. You can install Maven using a package manager:
     ```bash
     brew install maven  # macOS
     sudo apt install maven  # Ubuntu
     ```
  2. **Compilation Errors**: Verify that your `.rebeca` files are valid and conform to the Timed Rebeca syntax.
  3. **Dependencies Missing**: If Maven fails to resolve dependencies, try running:
     ```bash
     mvn dependency:resolve
     ```

