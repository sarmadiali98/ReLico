package org.rebecalang.compiler.modelcompiler.linguafranca;

import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.CharStreams;
import org.rebecalang.compiler.modelcompiler.timedrebeca.TimedRebecaCompleteCompilerFacade;
import org.rebecalang.compiler.modelcompiler.abstractrebeca.TypeSystemInitializer;
import org.rebecalang.compiler.modelcompiler.abstractrebeca.SymbolTableInitializer;
import org.rebecalang.compiler.utils.CoreVersion;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.beans.factory.config.ConfigurableBeanFactory;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;

@Component
@Qualifier("TIMED_REBECA_LINGUA_FRANCA")
@Scope(ConfigurableBeanFactory.SCOPE_PROTOTYPE)
public class TimedRebecaToLinguaFrancaCompilerFacade extends TimedRebecaCompleteCompilerFacade {

    private String inputFile;
    private String outputPath;

    @Autowired
    public TimedRebecaToLinguaFrancaCompilerFacade(
            @Qualifier("TIMED_REBECA") TypeSystemInitializer typeSystemInitializer,
            @Qualifier("TIMED_REBECA") SymbolTableInitializer symbolTableInitializer) {
        super(typeSystemInitializer, symbolTableInitializer);
    }

    public void setInputFile(String inputFile) {
        this.inputFile = inputFile;
    }

    public void setOutputPath(String outputPath) {
        this.outputPath = outputPath;
    }

    public void compile() throws Exception {
        // Read the input file content
        String sourceCode = new String(Files.readAllBytes(Paths.get(inputFile)), StandardCharsets.UTF_8);

        // Create a CharStream from the source code
        CharStream input = CharStreams.fromString(sourceCode);

        // Use the appropriate CoreVersion for Timed Rebeca
        CoreVersion version = CoreVersion.CORE_2_1;

        // Call the superclass's compile method
        super.compile(input, version);

        // Code generation
        codeGeneration();
    }

    //@Override
    public void codeGeneration() {
        if (rebecaModel == null) {
            System.err.println("rebecaModel is null. Cannot proceed with code generation.");
            return;
        }
        LinguaFrancaCodeGenerator codeGenerator = new LinguaFrancaCodeGenerator(rebecaModel);
        codeGenerator.generateCode(outputPath);
    }
}
