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
  - `benchmarks`: Directory containing `.rebeca` files to compile.
  
- **Output LF Code**:
  - `compiledLF`: Directory where `.lf` files are generated.

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
[INFO] 
[INFO] ----------------------< org.rebecalang:compiler >-----------------------
[INFO] Building compiler 2.25
[INFO]   from pom.xml
[INFO] --------------------------------[ jar ]---------------------------------
[INFO] 
[INFO] --- exec:3.5.0:java (default-cli) @ compiler ---
=== Rebeca Structure Map ===

1) Rebecs and their known rebecs:
   - node0 (Reactive Class: Node) knows: [sw0]
   - sw0 (Reactive Class: Switch) knows: [r0]
   - r0 (Reactive Class: Router) knows: []

2) Declared message servers and calls made by each rebec:
   Reactive Class: Switch
      Instance: sw0
         Declares msgSrv: internalrcvMsg
         Declares msgSrv: rcvMsg
         Declares msgSrv: rcvMsg2
         Calls made by sw0:
            -> EXTERNAL call to blah() in rebec 'r0'
            -> INTERNAL call to internalrcvMsg()
         Call counts:
            internalrcvMsg: 1 times
            blah: 1 times
   Reactive Class: Node
      Instance: node0
         Declares msgSrv: sendMsg
         Declares msgSrv: sendMsg2
         Declares msgSrv: constructorOfNode
         Calls made by node0:
            -> INTERNAL call to sendMsg()
            -> INTERNAL call to sendMsg2()
            -> EXTERNAL call to rcvMsg() in rebec 'sw0'
            -> EXTERNAL call to rcvMsg2() in rebec 'sw0'
            -> EXTERNAL call to rcvMsg() in rebec 'sw0'
            -> EXTERNAL call to rcvMsg2() in rebec 'sw0'
         Call counts:
            sendMsg: 1 times
            sendMsg2: 1 times
            rcvMsg: 2 times
            rcvMsg2: 2 times
   Reactive Class: Router
      Instance: r0
         Declares msgSrv: blah
         (No calls made.)

========================================

Compilation successful for file: node_sw.rebeca
=== Rebeca Structure Map ===

1) Rebecs and their known rebecs:
   - receiver0 (Reactive Class: Receiver) knows: []
   - sender0 (Reactive Class: Sender) knows: [receiver0]

2) Declared message servers and calls made by each rebec:
   Reactive Class: Sender
      Instance: sender0
         Declares msgSrv: sendMessage
         Calls made by sender0:
            -> EXTERNAL call to receiveMessage() in rebec 'receiver0'
         Call counts:
            receiveMessage: 1 times
   Reactive Class: Receiver
      Instance: receiver0
         Declares msgSrv: receiveMessage
         (No calls made.)

========================================

Compilation successful for file: Sender_and_Receiver.rebeca
=== Rebeca Structure Map ===

1) Rebecs and their known rebecs:
   - node0 (Reactive Class: Node) knows: [node1]
   - node1 (Reactive Class: Node) knows: [node0]

2) Declared message servers and calls made by each rebec:
   Reactive Class: Node
      Instance: node0
         Declares msgSrv: sendMsg
         Declares msgSrv: rcvMsg
         Declares msgSrv: constructorOfNode
         Calls made by node0:
            -> INTERNAL call to sendMsg()
            -> EXTERNAL call to rcvMsg() in rebec 'node1'
            -> INTERNAL call to sendMsg()
         Call counts:
            sendMsg: 2 times
            rcvMsg: 1 times
      Instance: node1
         Declares msgSrv: sendMsg
         Declares msgSrv: rcvMsg
         Declares msgSrv: constructorOfNode
         Calls made by node1:
            -> INTERNAL call to sendMsg()
            -> EXTERNAL call to rcvMsg() in rebec 'node0'
            -> INTERNAL call to sendMsg()
         Call counts:
            sendMsg: 2 times
            rcvMsg: 1 times

========================================

Compilation successful for file: pingpong.rebeca

All Rebeca model files have been processed.
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time:  1.606 s
[INFO] Finished at: 2025-01-07T01:54:56+03:30
[INFO] ------------------------------------------------------------------------

   ```

3. **Check Output**:
   The compiled `.lf` files will be saved in the following directory:
   `compiledLF`

---

# Notes

- **Work in Progress**: The compiler is still under development. The following limitations currently apply:
  - Circular dependency issues are being actively addressed.
  - Timing constraints concerning the usage of the after keyword are being addressed.
  - Support for conditional statements and loops are being addressed.

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

