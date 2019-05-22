module TruthTableGenerator where 

    import Lit
    --                                   Funcoes para obter as proposicoes da tabela

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
    getPropositionsBrute (head:tail) | notIn head "|&() " = [head] ++ getPropositionsBrute tail
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
    getPossibilitiesTable :: Int -> Int -> [[String]]
    getPossibilitiesTable size (-1) = []
    getPossibilitiesTable size n = getPossibilitiesTable size (n-1) ++ [[getBinary n size]]

    {-
    Faz o calculo para saber o numero de linhas da tabela e chama o metodo para obtê-la
    Ex:
    callGetPossibilitiesTable 2 = ["00","01","10","11"]
    -}
    callGetPossibilitiesTable :: Int -> [[String]]
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

    {-
    métodos de criação da tabela, falta a introdução da proposição 
    -}
    firstLine :: [Char] -> [Char]
    firstLine "" = "| Resposta "
    firstLine (x:xs) = [x] ++ " " ++ (firstLine xs)  

    otherLine :: [Char] ->[Char] -> [Char] -> Literal -> [Char]
    otherLine "" valor prop  lit = "| " ++ "1 "  
    otherLine (x:xs) valor prop lit = [x] ++ " " ++ (otherLine xs valor prop lit)

    tailTable :: [[Char]] -> [Char] -> Literal ->[Char]
    tailTable [] prop lit = ""
    tailTable (x:xs) prop lit = otherLine x x prop lit ++ "\n" ++ tailTable xs prop lit

    table :: [[Char]] -> [Char] -> Literal -> IO()
    table lista prop lit = do
        putStrLn (firstLine prop) 
        putStrLn (tailTable lista prop lit )

    -- testando a implementação do módulo
    teste :: IO()
    teste = putStrLn "deu certo implementar o módulo"