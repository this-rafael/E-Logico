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