module SimplificadorLogico where

    import Lit

    -- Necessidade de:
    --
    -- Criar uma Expressao
    -- Oferecer Opcoes de uso
    -- Avaliar compatibilidade
    -- Retornar Simplificacao ou Incompatibilidade
    --
    -- Mantem, Renova Expressao ou Menu Principal


    -- Executavel
    execSimplificador :: IO()
    execSimplificador = do
        putStrLn "0. Retornar ao Menu."
        putStrLn "1. Avaliar uma Expressao"
        escolherOpcoes
    

    escolherOpcoes :: IO()
    escolherOpcoes = do
        opcao <- readLn :: IO Int
        if(opcao == 0)
        then
            putStrLn "Voltando ao menu inicial"
        else 
            auxExe

    auxExe :: IO()
    auxExe = do
        putStrLn "Primeiro digite a expressao que deseja-se aplicar a avaliacao"
        lit <- Lit._receiveInput
        executandoOpcao lit

    executandoOpcao :: Literal -> IO()
    executandoOpcao literal = do
        putStrLn "Voce deseja usar sua expressao(U), reusa-la (R), criar uma nova expressao(N) ou sair(S)"
        putStr " >>> "
        op <- getLine
        putStrLn ""
        if(op == "U")
        then
            avaliaExpressao literal
        else if(op == "R")
        then
            reusaLiteral literal
        else if(op == "N")
        then
            criaNovoLiteral
        else if(op == "S")
        then
            putStrLn "Saindo..."
        else
            putStrLn "OPCAO INVALIDA"

    criaNovoLiteral :: IO()
    criaNovoLiteral = do
        lit <- Lit._receiveInput
        executandoOpcao lit

    reusaLiteral :: Literal -> IO()
    reusaLiteral literal = do  
        avaliaExpressao literal
        executandoOpcao literal

    
module SimplificadorLogico where

    import Lit

    -- Necessidade de:
    --
    -- Criar uma Expressao
    -- Oferecer Opcoes de uso
    -- Avaliar compatibilidade
    -- Retornar Simplificacao ou Incompatibilidade
    --
    -- Mantem, Renova Expressao ou Menu Principal


    -- Executavel
    execSimplificador :: IO()
    execSimplificador = do
        putStrLn "0. Retornar ao Menu."
        putStrLn "1. Avaliar uma Expressao"
        escolherOpcoes
    

    escolherOpcoes :: IO()
    escolherOpcoes = do
        opcao <- readLn :: IO Int
        if(opcao == 0)
        then
            putStrLn "Voltando ao menu inicial"
        else 
            auxExe

    auxExe :: IO()
    auxExe = do
        putStrLn "Primeiro digite a expressao que deseja-se aplicar a avaliacao"
        lit <- Lit._receiveInput
        executandoOpcao lit

    executandoOpcao :: Literal -> IO()
    executandoOpcao literal = do
        putStrLn "Voce deseja usar sua expressao(U), reusa-la (R), criar uma nova expressao(N) ou sair(S)"
        putStr " >>> "
        op <- getLine
        putStrLn ""
        if(op == "U")
        then
            avaliaExpressao literal
        else if(op == "R")
        then
            reusaLiteral literal
        else if(op == "N")
        then
            criaNovoLiteral
        else if(op == "S")
        then
            putStrLn "Saindo..."
        else
            putStrLn "OPCAO INVALIDA"

    criaNovoLiteral :: IO()
    criaNovoLiteral = do
        lit <- Lit._receiveInput
        executandoOpcao lit

    reusaLiteral :: Literal -> IO()
    reusaLiteral literal = do  
        avaliaExpressao literal
        executandoOpcao literal

    informaOpcoes :: IO()
    informaOpcoes = do
        putStrLn "         --- Opcoes Numericas --- "
        putStrLn " 1 - Negação"
        putStrLn " 2 - Conjunção"
        putStrLn " 3 - Adição"
        putStrLn " 4 - Introdução da Equivalência"
        putStrLn " 5 - Eliminação da Equivalência"
        putStrLn " 6 - Modus Ponens"
        putStrLn " 7 - Modus Tollens"
        putStrLn " 8 - Silogismo Hipotético"
        putStrLn " 9 - Silogismo Disjuntivo"
        putStrLn "10 - Dilema Construtivo"
        putStrLn "11 - Exportação"
        putStrLn " 0 - Voltar ao menu principal"
        putStrLn "        --- Digite a sua opção! ---"

    execNegacao :: Literal -> String
    execNegacao (Expression unaryOp fValue binaryOp sValue)
        | ((unaryOp == "~") && (getUnaryOp fValue == "~") && (binaryOp == "&")) = (" Sua dupla negacao resulta em: " ++ (getProposition fValue) ++ binaryOp ++ (getProposition sValue))
        | otherwise = " Nao eh possivel aplicar Negacao nessa expressao."

    avaliaExpressao :: Literal -> IO()
    avaliaExpressao l = do
        informaOpcoes
        opcao <- readLn :: IO Int
        if(opcao == 1)
        then
            putStrLn (execNegacao l)
        --else if (opcao == 2)
            --execConjuncao l
        --then
        --else if (opcao == 3)
            -- execAdicao l
        --then
        --else if (opcao == 4)
            --execIntroducaoDaEquivalencia l
        --then
        --else if (opcao == 5)
            --execEliminacaoDaEquivalencia l
        --then
        --else if (opcao == 6)
            --execModusPonens l
        --then
        --else if (opcao == 7)
            --execModusTollens l
        --then
        --else if (opcao == 8)
            --execSilogismoHipotetico l
        --then
        --else if (opcao == 9)
            --execSilogismoDisjuntivo l
        --then
        --else if (opcao == 10)
            --execDilemaConstrutivo l
        --then
        --else if (opcao == 11)
            --execExportacao l
        --then
        else
            putStrLn "Opcao invalida"
    
    -- execModusPonens :: Literal -> IO()
    -- execModusPonens l = do
    --     putStrLn (modusPonens l)
    
    -- implementar
    -- modusPonens :: Literal -> String
    
    
    -- execModusPonens :: Literal -> IO()
    -- execModusPonens l = do
    --     putStrLn (modusPonens l)
    
    -- implementar
    -- modusPonens :: Literal -> String
    