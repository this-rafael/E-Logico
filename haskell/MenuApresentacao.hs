module MenuApresentacao where

    -- menu de apresentacao
    apresentacaoInicial :: IO ()
    apresentacaoInicial = do
        putStrLn ("\n Ola, Bem vindo ao Aprendendo? Logico!\n")
        putStrLn (" Programa Interativo de Aprendizagem e auxilio a assuntos Logicos\n")
    
    -- Apresentação do menu de entrada
    menuOpcoes :: IO ()
    menuOpcoes = do
        putStrLn "\nMENU: \n"
        putStrLn " 1 - Aprendendo a formular uma Tabela-Verdade!"
        putStrLn " 2 - Aprendendo a converter (Bin - Dec) <---> (Dec - Bin)!"
        putStrLn " 3 - Aprendendo a simplificar expressoes proposicionais!"
        putStrLn " 4 - Aprendendo as regras basicas de proposicoes"
        putStrLn " 0 - SAIR\n"
        putStrLn " Digite a sua opcao!"
        putStr " >>> "
        
    -- Breve apresentação da função de Tabela-Verdade
    resumoTabela :: IO ()
    resumoTabela = do
        putStrLn "\n A Tabela Verdade eh utilizada em logica para considerar a validade de uma formula ou conferir que uma combinacao estah correta.\n"
        putStrLn " Quer saber como se constroi uma Tabela Verdade?\n"
        putStrLn " 1 - sim\n 2 - nao\n"
        putStr " >>> "
        entrada <- readLn :: IO Int
        execInfoTabela entrada

    -- Decide se vai imprimir as informacoes sobre tabela verdade ou nao
    execInfoTabela :: Int -> IO ()
    execInfoTabela 1 = infoTabela
    execInfoTabela x = putStrLn " Okay, entao vamos la!\n"

    -- Informativo sobre a tabela-verdade
    infoTabela :: IO ()
    infoTabela = do
        putStrLn "\nCOMO CONSTRUIR UMA TABELA?\n\n"
        putStrLn " a) O numero de linhas contidas em uma Tabela Verdade vai ser calculada por Linhas = 2^n, onde (n) eh a quantidade de preposicoes.\n "
        putStrLn " b) Incluimos nas linhas valores correspondentes em binario de (0 ... [2^n - 1]). Exemplo: Com uma tabela de 2 preposicoes teremos 4 linhas, em linha[1] = 0 0, 0 em binario com 2 casas decimais. na linha[2] = 0 1, 1 em binario com 2 casas. linha[3] = 1 0 , linha[4] = 1 1 \n"
        putStrLn " c) Enquanto ao numero de colunas, vai depender de voce, mas temos que ter obrigatoriamente n colunas + 1. Onde n eh definido como o numero de preposicoes e 1 coluna de resposta.\n"
        putStrLn " d) Na coluna de resposta, temos o resultado das operacoes. Cada linha com seu respectivo bit resposta\n"

    -- Breve apresentação sobre o conversor binário
    resumoConversor :: IO ()
    resumoConversor = do
        putStrLn "\n O conversor faz a traducao entre numeros de bases diferentes\n"
        putStrLn " Convertendo Bin --> Dec, teremos a conversao de Binario (base 2) para Decimal (base 10)\n"
        putStrLn " Convertendo Dec --> Bin, teremos a conversao de Decimal (base 10) para Binario (base 2)\n"

    -- Informativo sobre o conversor
    infoConversor :: IO ()
    infoConversor = do
        putStrLn "\nCOMO CONVERTER UM NUMERO?\n\n"
        putStrLn " 1) De Binario para Decimal\n"
        putStrLn "   a) Posicionalmente, o numero binario tem seu bit mais considerativo da esquerda para direita. O ultimo bit valerah menos que o primeiro!\n"
        putStrLn "   b) Considerando o valor de cada bit, temos que o cada bit valerah 2^n onde n ah a localidade da direita para esquerda, contada a partir do zero. Exemplo: 0 0 1 , o bit 1 irah valer 2^0. 1 0 0 , o bit 1 irah valer 2^2\n"
        putStrLn "   c) O resultado do numero convertido serah a soma do valor de cada bit levando em conta sua considerabilidade. Exemplo: 1 0 1 1, 2^0 + 2^1 + 2^3 = 1 + 2 + 8 = 11 \n\n"
        putStrLn " 2) De Decimal para Binario\n"
        putStrLn "   a) O numero em decimal serah dividido pela base binario, ou seja 2, repetidas vezes ate que se sobre 1 ou 0\n"
        putStrLn "   b) O importante da divisao serah o resto da divisao e seu resultado final. Exemplo: o numero 2 em decimal, 2 / 2 = 1 e 2 % 2 = 0\n"
        putStrLn "   c) Chegando a ultima divisao com resto inteiro possivel, temos que reunir os restos das divisoes com o ultimo resultado possivel. Exemplo: 4, 4 % 2 = 0, 4/2 = 2, como 2 ainda pode ser divisivel por 2, 2 % 2 = 0 e 2 / 2 = 1. Juntando os restos com o ultimo resultado, temos:  0 0 1\n"
        putStrLn "   d) Com o resultado da divisao por 2 e seus restos concatenado, temos que apenas inverter a ordem. Exemplo anterior 0 0 1, invertemos 1 0 0, que equivale a 4\n\n"
    
    -- Breve impressão sobre expressões proposicionais
    resumoExpressoes :: IO ()
    resumoExpressoes = do
        putStrLn "\n Expressoes Proposicionais podem ser gigantes."
        putStrLn " No entranto, existem várias regras de simplificacao que podem transformar expressoes gigantescas em expressões simples com a mesma equivalencia logica!\n"

    -- Informativo sobre o simplificador proposicional
    infoExpressoes :: IO ()
    infoExpressoes = do
        putStrLn "\n COMO SIMPLIFICAR UMA EXPRESSAO PROPOSICIONAL?\n\n"
        putStrLn " a) Partimos da definicao das proposicoes\n"
        putStrLn " b) Assumimos uma regra que se encaixe com as proposicoes destinadas e aplicamos.\n"
        putStrLn " c) Repetimos os passos podendo utilizar a mesma regra ou uma regra diferente, ate chegarmos a uma expressao que nao aceite mais nenhuma regra. Em tese serah a expressao simplificada\n"

    -- Resumo sobre a função de apresentação das regras proposicionais
    resumoRegras :: IO ()
    resumoRegras = do
        putStrLn "\n Regras para simplificacao de expressoes logicas\n"
        putStrLn " Aqui vamos apresentar algumas regras para as simplificacao de expressoes logicas complexas em expressoes simples!\n"