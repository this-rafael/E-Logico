module Lit  where 
    import System.IO.Unsafe
    data Literal = Nil | Expression String Literal String Literal | Proposition String String

    _receiveInput :: IO(Literal)
    _receiveInput = do
        putStrLn "1- Para inserir uma Proposicao"  
        putStrLn "2- Para inserir uma Expressao" 
        putStr " >>> "

        option <- getLine
        if(option == "0")
        then 
            return (buildProposition "" "")
        else
            if(option == "1")
            then
                interativePropositionConstruct
                

            else
                if(option == "2")
                then 
                    interativeExpressionConstruct
                else
                    return (buildProposition "" "")


    aboutALiteral :: String
    aboutALiteral = 
        " Uma proposicao, pode ser considerada de duas formas." ++ "\n" 
        ++ " Uma Proposicao Atomica: Quando soh possui um valor, e pode conter um Operador Unario." 
        ++ "\n" 
        ++ " Exemplo: ~p" ++ "\n" 
        ++ " Uma Expressao Composta: Que pode conter um Operador Unario, porem possui sempre um Primeiro Valor," ++ "\n" 
        ++ " um Segundo Valor, e conectando eles temos um Operador Binario." ++ "\n" 
        ++ " Exemplo: (P | Q) & R"


    binaryOpEquals :: Literal -> Literal -> Bool
    binaryOpEquals p q = getBinaryOp p == getBinaryOp q


    binaryOperatorToString :: String -> String
    binaryOperatorToString anOperator
        | anOperator == "*" = "->"
        | anOperator == "#" = "<->"
        | otherwise = anOperator


    buildProposition :: String->String -> Literal
    buildProposition unaryOp value =  (Proposition unaryOp value)


    buildExpression :: String -> Literal -> String -> Literal -> Literal
    buildExpression unaryOp firstExpression binaryOp secondExpression = (Expression unaryOp firstExpression binaryOp secondExpression)


    buildNilLiteral :: Literal
    buildNilLiteral = (Proposition "" "")


    chooseAUnaryOperator :: IO(String)
    chooseAUnaryOperator = do
        putStrLn "pressione '~' caso deseje inserir uma negacao a sua expressao, ou pressione enter para continuar"
        putStr " >>> "
        op <- getLine
        return op


    chooseABinaryOperator :: IO(String)
    chooseABinaryOperator = do
        putStrLn " Escolha entre os Operadores abaixo: "
        putStrLn " E: &, ^, ." 
        putStrLn " Ou: |, v, +" 
        putStrLn " Implica: ->, *" 
        putStrLn " Bi-Implica: <->, #" 
        putStr " >>> "
        valor <- getLine
        putStr "\n"
        return valor

    changeForValidBinaryOperator :: String -> String
    changeForValidBinaryOperator op
        | op == "*" || op == "->" = "*"
        | op == "#" || op == "<->" = "#"
        | op == "|" || op == "v" || op =="+" = "|"
        | op == "&" || op == "^" || op == "." = "&"
        | otherwise = " THAT'S RETURNS A ERROR BECAUSE THIS NOT IS A VALID OPERATOR FOR SYNTAX "

    firstValueIsEquals :: Literal -> Literal -> Bool
    firstValueIsEquals 
        (Expression unaryOp1 fValue1 binaryOp1 sValue1)
        (Expression unaryOp2 fValue2 binaryOp2 sValue2) = 
            literalsIsEquals fValue1 fValue2


    getUnaryOp :: Literal -> String
    getUnaryOp (Expression unaryOp fValue binaryOp sValue) = unaryOp
    getUnaryOp (Proposition unaryOp value) = unaryOp


    getBinaryOp :: Literal -> String
    getBinaryOp (Expression unaryOp fValue binaryOp sValue) = binaryOp


    getProposition :: Literal -> String
    getProposition (Proposition unaryOp value) = value

    literalToString :: Literal -> String
    literalToString (Proposition unaryOp value) = unaryOp ++ "" ++ value
    literalToString (Expression unaryOp fValue binaryOp sValue) = unaryOp ++ "(" ++ (literalToString fValue) ++" "++ binaryOp ++" "++ (literalToString sValue) ++ ")"


    literalsIsEquals :: Literal -> Literal -> Bool
    literalsIsEquals j k =
        
            if(isAtomic j)
            then
                if(isAtomic k)
                    then
                        (unaryOpEquals j k) && (propositionEquals j k)
                    else 
                    False
            else
                if(isAtomic j)
                then 
                    False
                else 
                    (unaryOpEquals j k) && (firstValueIsEquals j k) && (secondValueIsEquals j k) && (binaryOpEquals j k)



    interativePropositionConstruct:: IO(Literal)
    interativePropositionConstruct = do 
        putStrLn " Digite a Variavel associada a sua Proposicao:"
        putStr ">>> "
        basicString <- getLine
        if(length basicString == 2)
        then 
            return (buildProposition ([basicString !! 0]) ([basicString !! 1]))
        else 
            return (buildProposition "" ([basicString !! 0]))



    interativeExpressionConstruct :: IO(Literal)
    interativeExpressionConstruct = do
        
        unaryOp <- chooseAUnaryOperator
        valueA <- _receiveInput
        binaryOp <- chooseABinaryOperator
        valueB <- _receiveInput

        return (buildExpression unaryOp valueA (changeForValidBinaryOperator binaryOp) valueB)


    ioLiteralToLiteral :: IO(Literal) -> Literal
    ioLiteralToLiteral ioliteral = (unsafeDupablePerformIO ioliteral) 


    isANilLiteral:: Literal -> Bool
    isANilLiteral (Proposition unaryOp value) = ((unaryOp == "") && (value == ""))


    isAtomic :: Literal -> Bool
    isAtomic (Proposition unaryOp value) = True
    isAtomic (Expression unaryOp fValue binaryOp sValue) = False


    isNegative :: Literal -> Bool
    isNegative p = 
        if (getUnaryOp p == "~") then True
        else False

    isValidProposition :: Char -> Bool
    isValidProposition p =
        if ((elem p ['a'..'z']) || (elem p ['A'..'Z'])) then True
        else False 
        
    isBinaryOperator :: Char -> Bool
    isBinaryOperator o = 
        if ((elem o ['*', '#','&', '|'])) then True
        else False

    propositionEquals :: Literal -> Literal -> Bool
    propositionEquals p q = ((getUnaryOp p) ++ (getProposition p)) == ((getUnaryOp q) ++ (getProposition q))



    printInfo :: String
    printInfo = 
        " Um Literal eh uma expressao booleana." 
        ++ "\n" 
        ++ " Eh composto por uma Proposicao ou Expressao, um Operador Binario, e outra Proposicao ou Expressao."



    setPropositionValue :: Literal -> String -> Literal
    setPropositionValue (Proposition unaryOp value) newValue = (Proposition unaryOp newValue)


    setFirstValue :: Literal
    setFirstValue = (Proposition "" "")


    setSecondValue :: Literal
    setSecondValue = (Proposition "" "")


    setUnaryOperator :: Literal -> String -> Literal
    setUnaryOperator (Proposition uop value) newuop = (Proposition newuop value) 


    secondValueIsEquals :: Literal -> Literal -> Bool
    secondValueIsEquals 
        (Expression unaryOp1 fValue1 binaryOp1 sValue1)
        (Expression unaryOp2 fValue2 binaryOp2 sValue2) = 
            literalsIsEquals sValue1 sValue2




    unaryOpEquals :: Literal -> Literal -> Bool
    unaryOpEquals p q = getUnaryOp p == getUnaryOp q 

