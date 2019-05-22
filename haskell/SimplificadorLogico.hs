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
            -- 
            -- putStrLn "ooi"

    auxExe :: IO()
    auxExe = do
        putStrLn "Primeiro digite o literal que deseja-se aplicar a avaliacao"
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
            putStrLn "OPÇÃO INVALIDA"

    criaNovoLiteral :: IO()
    criaNovoLiteral = do
        lit <- Lit._receiveInput
        executandoOpcao lit

    reusaLiteral :: Literal -> IO()
    reusaLiteral literal = do  
        avaliaExpressao literal
        executandoOpcao literal

    
    avaliaExpressao :: Literal -> IO()
    avaliaExpressao l = do

        {-
        -- informa as opcoes
        opcao <- readLn :: IO Int
        if(opcao == 1)
        then
            execModusPonens l
        else if (opcao == 2)
            --Implementar
        then
        else if (opcao == 3)
        then
        else if (opcao == 4)
        then
        else if (opcao == 5)
        then
        else if (opcao == 6)
        then
        else if (opcao == 7)
        then
        else if (opcao == 8)
        then
        else if (opcao == 9)
        then
        else if (opcao == 10)
        then
        else
            putStrLn "Opcao invalida"
        -}
        putStrLn "Ooooi"
    
    -- execModusPonens :: Literal -> IO()
    -- execModusPonens l = do
    --     putStrLn (modusPonens l)
    
    -- implementar
    -- modusPonens :: Literal -> String
    