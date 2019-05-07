data Literal = Nil | Expression String Literal String Literal | Psi String String


buildPreposition :: String->String->Literal
buildPreposition unaryOperator value =  (Psi unaryOperator value)


literalToString :: Literal -> String
literalToString (Psi unaryOp value) = unaryOp ++ "" ++ value
literalToString (Expression unaryOp fValue binaryOp sValue) = "(" ++ unaryOp ++ (literalToString fValue) ++" "++ binaryOp ++" "++ (literalToString sValue) ++ ")"
