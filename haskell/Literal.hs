data Literal = Nil | Expression String Literal String Literal | Proposition String String



--                 Constroi Proposicao  
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


--            ====== EM DESENVOLVIMENTO ======


    







--                 Funcoes Get
getUnaryOp :: Literal -> String
getUnaryOp (Expression unaryOp fValue binaryOp sValue) = unaryOp
getUnaryOp (Proposition unaryOp value) = unaryOp

getBinaryOp :: Literal -> String
getBinaryOp (Expression unaryOp fValue binaryOp sValue) = binaryOp

getProposition :: Literal -> String
getProposition (Proposition unaryOp value) = value

--                 Funcoes Equals

unaryOpEquals :: Literal -> Literal -> Bool
unaryOpEquals p q = getUnaryOp p == getUnaryOp q 

binaryOpEquals :: Literal -> Literal -> Bool
binaryOpEquals p q = getBinaryOp p == getBinaryOp q

propositionEquals :: Literal -> Literal -> Bool
propositionEquals p q = ((getUnaryOp p) ++ (getProposition p)) == ((getUnaryOp q) ++ (getProposition q))

--                 Funcoes de Checagem

isAtomic :: Literal -> Bool
isAtomic (Proposition unaryOp value) = True
isAtomic (Expression unaryOp fValue binaryOp sValue) = False

isNegative :: Literal -> Bool
isNegative p = getUnaryOp p == "~"





















p :: Literal
p = (Proposition "" "p")

q :: Literal
q = (Proposition "" "q")

pandq :: Literal
pandq =
    (
        Expression
        ""
        p
        "&"
        q
    )
qorpandq :: Literal
qorpandq = 
    (
        Expression
        ""
        (buildProposition "" "q")
        "|"
        pandq
    )

