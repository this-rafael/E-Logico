import System.IO.Unsafe

-- METODOS DE RECEBER STRING

-- @return a String received from the input
stringInput :: String 
stringInput = inputStr changeIOStringToString

-- @return a String, that is a result of conversion of IO String to String
-- @params: ioToStringFunction 
inputStr :: (IO(String) -> String) -> String
inputStr ioToStringFunction = (ioToStringFunction getIOString)

-- @returns a String result of conversion of IO String
-- @params: A Io String
changeIOStringToString:: IO(String) -> String
changeIOStringToString ioString = unsafeDupablePerformIO ioString

-- @return: get a entrie from the user and returns a IO String
getIOString :: IO(String)
getIOString = do
    a <- getLine
    return a

{- LITERAL -}
data Literal = Nil | Expression String Literal String Literal | Proposition String String



-- Constroi Proposicao  
-- @parms: unary operator
-- @parms: value
buildProposition :: String->String -> Literal
buildProposition unaryOp value =  (Proposition unaryOp value)

buildExpression :: String -> Literal -> String -> Literal -> Literal
buildExpression unaryOp firstExpression binaryOp secondExpression = (Expression unaryOp firstExpression binaryOp secondExpression)

--                 To String do Literal
literalToString :: Literal -> String
literalToString (Proposition unaryOp value) = unaryOp ++ "" ++ value
literalToString (Expression unaryOp fValue binaryOp sValue) = unaryOp ++ "(" ++ (literalToString fValue) ++" "++ binaryOp ++" "++ (literalToString sValue) ++ ")"

printInfo :: String
printInfo = 
    " Um Literal eh uma expressao booleana." ++ "\n" ++ " Eh composto por uma Proposicao ou Expressao, um Operador Binario, e outra Proposicao ou Expressao."

aboutALiteral :: String
aboutALiteral = " Uma proposicao, pode ser considerada de duas formas." ++ "\n" 
                ++ " Uma Proposicao Atomica: Quando soh possui um valor, e pode conter um Operador Unario." 
                ++ "\n" 
                ++ " Exemplo: ~p" ++ "\n" 
                ++ " Uma Expressao Composta: Que pode conter um Operador Unario, porem possui sempre um Primeiro Valor," ++ "\n" 
                ++ " um Segundo Valor, e conectando eles temos um Operador Binario." ++ "\n" 
                ++ " Exemplo: (P | Q) & R"

receiveInput :: IO()
receiveInput = do
    putStrLn ""
    putStrLn printInfo
    putStrLn aboutALiteral
    


