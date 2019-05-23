module TruthTableGenerator where 

    import Lit


    --                                  0 Funcoes para obter as proposicoes da tabela

    {-
    Verifica se um char NAO estah contido em uma string.
    Ex:
    notIn 'a' "abcd" = False
    notIn 'e' "abcd" = True
    -}
    notIn :: Char -> [Char] -> Bool
    notIn x [] = True
    notIn x (head:tail) | x == head = False
                        | otherwise = notIn x tail

    {-
    Remove char's repetidos de uma string. (Usa uma lista auxiliar inicialmente vazia).
    Ex:
    removeRepetitions [] "pppq" = "pq"
    -}
    removeRepetitions :: [Char] -> [Char] -> [Char]
    removeRepetitions list [] = []
    removeRepetitions list (head:tail) | notIn head list = [head] ++ removeRepetitions (list ++ [head]) tail
                                       | otherwise = removeRepetitions list tail

    {-
    Obtem as proposicoes recebendo a expressao, mas com repeticoes.
    Ex:
    getPropositionsBrute "(p | (p & q))" = "ppq"
    -}
    getPropositionsBrute :: [Char] -> [Char]
    getPropositionsBrute [] = []
    getPropositionsBrute (head:tail) | notIn head "|&()*#~ " = [head] ++ getPropositionsBrute tail
                                     | otherwise = getPropositionsBrute tail

    {-
    Obtem as proposicoes recebendo a expressao.
    Ex:
    getPropositionsBrute "(p | (p & q))" = "pq"
    getPropositionsBrute "(p | (p & r))" = "pqr"
    -}
    getPropositions :: [Char] -> [Char]
    getPropositions expression = removeRepetitions [] (getPropositionsBrute expression)


    --                                   Funcoes para gerar a tabela de possibilidades

    {-
    Gera uma sequência de n zeros.
    Ex:
    zeroSequence 5 = "00000"
    -}
    zeroSequence :: Int -> [Char]
    zeroSequence 0 = ""
    zeroSequence n = "0" ++ zeroSequence (n-1)

    {-
    Completa um binário incompleto com zeros à esquerda para que o número de caracteres seja controlado.
    Ex:
    completeBinary 5 "101" = "00101"
    -}
    completeBinary :: Int -> [Char] -> [Char]
    completeBinary n bin = zeroSequence (n - (length bin)) ++ bin

    {-
    Transforma um inteiro em um binario.
    Ex:
    getBinaryIncomplete 5 = "101"
    -}
    getBinaryIncomplete :: Int -> [Char]
    getBinaryIncomplete 0 = ""
    getBinaryIncomplete n | n `mod` 2 == 1 = getBinaryIncomplete (quot n 2) ++ "1"
                          | n `mod` 2 == 0 = getBinaryIncomplete (quot n 2) ++ "0"

    {-
    Transforma um inteiro em um binario, mas com controle no tamanho de caracteres.
    Ex:
    getBinary 5 6 = "000101"
    -}
    getBinary :: Int -> Int -> [Char]
    getBinary 0 size = completeBinary size "0"
    getBinary n size = completeBinary size (getBinaryIncomplete n)

    {-
    Retorna uma tabela com todas as interpretacoes possiveis para um determinado numero de variaveis.
    Ex:
    getPossibilitiesTable 2 3 = ["00","01","10","11"]
    -}
    getPossibilitiesTable :: Int -> Int -> [[Char]]
    getPossibilitiesTable size (-1) = []
    getPossibilitiesTable size n = getPossibilitiesTable size (n-1) ++ [getBinary n size]

    {-
    Faz o calculo para saber o numero de linhas da tabela e chama o metodo para obtê-la
    Ex:
    callGetPossibilitiesTable 2 = ["00","01","10","11"]
    -}
    callGetPossibilitiesTable :: Int -> [[Char]]
    callGetPossibilitiesTable n = getPossibilitiesTable n ((2 ^ n) - 1)


    --                                   Funcoes para obter os resultados

    getPropPosition :: [Char] -> [Char] -> Int
    getPropPosition prop (h:t) | prop == [h] = 0
                            | otherwise = 1 + getPropPosition prop t 

    getPropositionValue :: [Char] -> [Char] -> [Char] -> Bool
    getPropositionValue prop list poss | (poss !! (getPropPosition prop list)) == '0' = False
                                    | otherwise = True

    checkUnOP :: Bool -> String -> Bool
    checkUnOP value unOp | unOp == "~" = not value
                        | otherwise = value

    result :: Literal -> [Char] -> [Char] -> Bool
    result (Proposition unOp prop) list poss = checkUnOP (getPropositionValue prop list poss) unOp
    result (Expression unOp v1 binOp v2) list poss | binOp == "&" = checkUnOP ((result v1 list poss) && (result v2 list poss)) unOp
                                                   | binOp == "|" = checkUnOP ((result v1 list poss) || (result v2 list poss)) unOp
                                                   | binOp == "*" = checkUnOP ((not (result v1 list poss)) || (result v2 list poss)) unOp
                                                   | otherwise = checkUnOP (((result v1 list poss) && (result v2 list poss)) || (( not (result v1 list poss)) && ( not (result v2 list poss)))) unOp

    resToString :: Bool -> String
    resToString True = "1"
    resToString False = "0"


    --                                   Funlões para a montagem da tabela

    firstLine :: [Char] -> [Char] -> [Char]
    firstLine "" exp = "| " ++ exp
    firstLine (x:xs) exp = [x] ++ " " ++ (firstLine xs exp)  

    otherLine :: [Char] -> [Char] -> [Char] -> Literal -> [Char]
    otherLine "" valor prop  lit = "| " ++ resToString(result lit prop valor) 
    otherLine (x:xs) valor prop lit = [x] ++ " " ++ (otherLine xs valor prop lit)

    tailTable :: [[Char]] -> [Char] -> Literal ->[Char]
    tailTable [] prop lit = ""
    tailTable (x:xs) prop lit = otherLine x x prop lit ++ "\n" ++ tailTable xs prop lit

    table :: [[Char]] -> [Char] -> Literal -> [Char]
    table lista prop lit =  (firstLine prop (literalToString lit)) ++ "\n" ++ (tailTable lista prop lit )

    callTable :: Literal -> IO()
    callTable lit = do
        putStrLn $ table (callGetPossibilitiesTable (length(getPropositions (literalToString lit)))) (getPropositions (literalToString lit)) (lit)
        putStrLn "Deseja criar uma nova tabela ou voltar ao menu?"
        putStrLn "0 - Voltar ao menu!"
        putStrLn "1 - Criar nova!"
        repeatTruthTable


    --                              ##   MAIN   ##

    execTruthTable :: IO()
    execTruthTable = do
        putStrLn "\nBem vindo ao gerador de Tabela Verdade!"
        printOptions
    

    printOptions :: IO()
    printOptions = do
        putStrLn "\nEscolha sua opcao! (0, 1, 2 ou 3)"
        putStrLn "0. Retornar ao Menu."
        putStrLn "1. Qual o objetivo do gerador de Tabela Verdade?"
        putStrLn "2. Tutorial como funciona o literal (util para criar a expressao)."
        putStrLn "3. Gerar a tabela verdade de uma expressao."
        escolherOpcoes

    escolherOpcoes :: IO()
    escolherOpcoes = do
        opcao <- readLn :: IO Int
        if (opcao == 0)
        then
            putStrLn "\nVolte sempre!\n"
        else if (opcao == 1)
        then
            explicaTable
        else if (opcao == 2)
        then
            explicaLit
        else
            auxExe

    auxExe :: IO()
    auxExe = do
        putStrLn "Primeiro digite o literal que deseja-se aplicar a avaliacao"
        lit <- Lit._receiveInput
        putStrLn "\nEssa eh a tabela verdade da expressao:"
        callTable lit

    repeatTruthTable :: IO()
    repeatTruthTable = do
        op <- readLn :: IO Int
        if (op == 0)
        then
            putStrLn "\nVolte sempre!\n"
        else
            printOptions


    explicaTable :: IO()
    explicaTable = do
        putStrLn "--------------------TABELA VERDADE------------------------"
        putStrLn "\nTabela verdade eh um dispositivo utilizado no estudo da logica."
        putStrLn "Com o uso desta tabela eh possível definir o valor logico de uma expressao,"
        putStrLn "ou seja, saber quando uma sentenca eh verdadeira ou falsa.\n"
        putStrLn "Quanto mais variaveis fizerem parte da expressao, maior o numero de linhas, que eh obtido por (2 ^ n),"
        putStrLn "onde n eh o numero de variaveis."
        putStrLn "Eh simples fazer manualmente uma tabela com duas variaveis, e ate tres."
        putStrLn "Mas quanto mais adicionamos variaveis a expressao, o numero de linhas fica exponencialmente maior.\n"
        putStrLn "O objetivo dessa parte do programa eh justamente facilitar a construcao da tabela de qualquer expressao,"
        putStrLn "Nao importando o numero de variaveis.\n"
        putStrLn "-----------------------------------------------------------"
        printOptions

    explicaLit :: IO()
    explicaLit = do
        putStrLn "---------------------LITERAL TUTORIAL----------------------"
        putStrLn "\nUm literal pode ser uma expressao ou uma proposicao.\nUma expressao eh formada por:"
        putStrLn "- Um operador unario (~, ) para dizer se o valor da expressao eh negado;"
        putStrLn "- Um valor A: esse valor pode ser uma outra expressao ou uma simples proposicao;"
        putStrLn "- Um operador binario (&,|,*,#), que serve para dizer se a expressao eh uma conjuncao, uma disjuncao, uma implicacao ou uma bi-implicacao;"
        putStrLn "- Um valor B: esse valor pode ser uma outra expressao ou uma simples proposicao;\n"     
        putStrLn "Uma proposicao eh formada por:"
        putStrLn "- Um operador unario (~, ) para dizer se o valor da proposicao eh negado;"
        putStrLn "- Um valor: esse valor eh obrigatoriamente uma string, que no caso, vai ser a letra que representa a proposicao."
        putStrLn "Agora que ja sabemos como eh formado um literal, podemos criar um a seguir:\n"
        putStrLn "-----------------------------------------------------------"
        printOptions