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

    -- Cria Expressao
    criaLiteral :: IO(Literal)
    criaLiteral = do

    -- Avalia Expressao
    avaliaLiteral :: Literal -> IO()
    avaliaLiteral
    
    -- Laco
    lacoPrincipal :: Int -> Literal -> IO()
    lacoPrincipal 0 _ = do putStrLn "Retornando ao Menu."
    lacoPrincipal 1 l = avaliaLiteral (l)
    lacoPrincipal 2 _ = avaliaLiteral (criaLiteral)
    lacoPrincipal opc l = do

        putStrLn "0. Retornar ao Menu."
        putStrLn "1. Manter Expressao Logica."
        putStrLn "2. Criar Nova Expressao Logica."

        opc <- readLn :: IO Int
        
        lacoPrincipal opc l

    -- Executavel
    execSimplificador :: IO()
    exerSimplificador = lacoPrincipal 420 Lit.buildNilLiteral
