import MenuApresentacao
import Lit

-- Método main do programa
main :: IO ()
main = execPrincipal

-- Método de chamada das funções principais de execução de cada arquivo
execOpcoes :: Int -> IO ()
execOpcoes opc
    |opc == 0 = do  
        putStrLn (" ISSO É TUDO PESSOAL!!! ")
    |opc == 1 = do
        MenuApresentacao.resumoTabela
        -- execGenerateTable
        execMenuApresentacao
    |opc == 2 = do
        MenuApresentacao.resumoConversor
        -- execConversor
        execMenuApresentacao
    |opc == 3 = do
        MenuApresentacao.resumoExpressoes
        -- execExpressoes
        execMenuApresentacao
    |opc == 4 = do
        MenuApresentacao.resumoRegras
        -- execRegras
        execMenuApresentacao

   -- |opc == 5 = teste de comp do Lit 
   --     putStrLn (Lit.aboutALiteral)
    |otherwise = do
        putStrLn (" Excuse-me? Pode repetir?\n")
        execMenuApresentacao

-- Método de execução da chamada principal dos métodos executáveis.
execPrincipal :: IO()
execPrincipal = do
    MenuApresentacao.apresentacaoInicial
    execMenuApresentacao

-- Método do loop necessario para funcionamento do menu
execMenuApresentacao :: IO ()
execMenuApresentacao = do
    MenuApresentacao.menuOpcoes
    opc <- readLn :: IO Int
    execOpcoes opc