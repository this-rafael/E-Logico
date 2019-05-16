import Literal
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
