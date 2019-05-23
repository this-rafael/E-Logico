module SimplificadorLogico where

    import Lit

    -- Necessidade de:
    --
    -- Criar uma Expressão
    -- Oferecer Opções de uso
    -- Avaliar compatibilidade
    -- Retornar Simplificação ou Incompatibilidade
    -- Mantém, Renova Expressão ou Menu Principal

    -- Executável
    execSimplificador :: IO()
    execSimplificador = do
        putStrLn " 0. Retornar ao Menu."
        putStrLn " 1. Avaliar uma Expressao"
        escolherOpcoes
    
    escolherOpcoes :: IO()
    escolherOpcoes = do
        opcao <- readLn :: IO Int
        if(opcao == 0)
        then
            putStrLn " Voltando ao menu inicial"
        else 
            auxExe

    auxExe :: IO()
    auxExe = do
        putStrLn "\n Primeiro digite a expressao que deseja-se aplicar a avaliacao."
        lit <- Lit._receiveInput
        putStrLn ("\nSua Expressao: " ++ (literalToString lit))
        executandoOpcao lit

    executandoOpcao :: Literal -> IO()
    executandoOpcao literal = do
        putStrLn " Voce deseja usar sua expressao(U), criar uma nova expressao(N) ou sair(S)\n"
        putStr " >>> "
        op <- getLine
        putStrLn ""
        if(op == "U")
        then
            usarExpressao literal
        else if(op == "N")
        then
            criaNovoLiteral
        else if(op == "S")
        then
            putStrLn " Saindo..."
        else
            putStrLn " OPCAO INVALIDA"


    usarExpressao :: Literal -> IO()
    usarExpressao literal = do
        avaliaExpressao literal
        putStrLn ("\nSua Expressao: " ++ (literalToString literal))
        executandoOpcao literal
    
    criaNovoLiteral :: IO()
    criaNovoLiteral = do
        lit <- Lit._receiveInput
        putStrLn ("\nSua Expressao: " ++ (literalToString lit))
        executandoOpcao lit    

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

    -- negacao ~(~P&Q) retorna P&Q
    execNegacao :: Literal -> String
    execNegacao (Expression unaryOp fValue binaryOp sValue)
        | ((unaryOp == "~") && (getUnaryOp fValue == "~") && (binaryOp == "&")) = ("\n Sua dupla negacao resulta em: " ++ (getProposition fValue) ++ binaryOp ++ (getProposition sValue))
        | otherwise = (" Nao eh possivel aplicar Negacao nessa expressao.")

    -- conjuncao (1 | 0) ^ (1 | 0) retorna True | False
    execConjuncao :: Literal -> String
    execConjuncao (Expression unaryOp fValue binaryOp sValue) = "Falta concluir"
        -- | ((getProposition (getFValue fValue)) == (getProposition sValue)), mesma coisa para o sValue.

    -- adicao_disjuntiva (P) retorna P | "Qualquer Expressão"
    execAdicao :: Literal -> String
    execAdicao litera = ("\n Essa Expressao pode ser considerada igual a: " ++ (literalToString litera) ++ " | Qualquer Expressão")

    -- introducao_de_equivalencia (P -> Q) ^ (Q -> P) retorna (P <-> Q)
    execIntroducaoDaEquivalencia :: Literal -> String
    execIntroducaoDaEquivalencia (Expression unaryOp fValue binaryOp sValue)
        | (((getProposition (getFValue fValue)) == (getProposition (getSValue sValue))) && ((getProposition (getFValue sValue)) == (getProposition (getSValue fValue))) && (binaryOp == "&")) = ("\n Aplicando-se o metodo Eliminacao de Equivalencia, tem-se o resultado da Expressao: (" ++ (getProposition (getFValue fValue)) ++ " <-> " ++ (getProposition (getFValue sValue)) ++ ")")
        | otherwise = (" Nao eh possivel aplicar Introducao de Equivalencia nessa expressao.")

    -- eliminacao_de_equivalencia (P <-> Q) retorna (P -> Q) ^ (Q -> P)
    execEliminacaoDaEquivalencia :: Literal -> String
    execEliminacaoDaEquivalencia (Expression unaryOp fValue binaryOp sValue)
        | (binaryOp == "#") = ("\n Aplicando-se o metodo Eliminacao de Equivalencia, tem-se o resultado da Expressao: (" ++ (literalToString fValue) ++ " -> " ++ (literalToString sValue) ++ ") ^ (" ++ (literalToString sValue) ++ " -> " ++ (literalToString fValue) ++ ")")
        | otherwise = (" Nao eh possivel aplicar Eliminacao de Equivalencia nessa expressao.")

    -- modus_ponens ((P -> Q), P) retorna Q
    execModusPonens :: Literal -> String
    execModusPonens (Expression unaryOp fValue binaryOp sValue)
        | ((getProposition (getFValue fValue)) == (getProposition sValue) && (binaryOp == "&") && ((getBinaryOp fValue) == "*")) = (" Aplicando-se o metodo Modus Ponens, tem-se o resultado da Expressao: " ++ (literalToString (getSValue fValue)))
        | otherwise = (" Nao eh possivel aplicar Modus Ponens nessa expressao.")

    avaliaExpressao :: Literal -> IO()
    avaliaExpressao l = do
        informaOpcoes
        opcao <- readLn :: IO Int
        if(opcao == 1)
        then
            putStrLn (execNegacao l)
    --  else if (opcao == 2)
    --      execConjuncao l
    --  then
        else if(opcao == 3)
        then
            putStrLn (execAdicao l)
        else if (opcao == 4)
        then
            putStrLn (execIntroducaoDaEquivalencia l)
        else if (opcao == 5)
        then
            putStrLn (execEliminacaoDaEquivalencia l)
        else if (opcao == 6)
        then
            putStrLn (execModusPonens l)
        --else if (opcao == 7)
        --then
            --execModusTollens l
        --else if (opcao == 8)
        --then
            --execSilogismoHipotetico l
        --else if (opcao == 9)
        --then
            --execSilogismoDisjuntivo l
        --else if (opcao == 10)
        --then
            --execDilemaConstrutivo l
        --else if (opcao == 11)
        --then
            --execExportacao l
        else
            putStrLn " Opcao invalida"
    
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
    