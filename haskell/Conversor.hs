  
module Conversor where
    import qualified Data.Binary.Get as G
    import qualified Data.Binary.Put as P
  
  -- FUNCAO AUXILIAR CONVERTER STRING TO INT
    strToInt = read :: String -> Int


    listOptions::IO()
    listOptions = do
        putStrLn "         --- Opcoes Numericas --- "
        putStrLn "        0 - Voltar ao menu inicial"
        putStrLn "        1 - Explicacoes sobre conversoes"
        putStrLn "        2 - Realizar conversoes"


    optionsConversionExplanation::IO()
    optionsConversionExplanation = do
        putStrLn "        1 - Explicacao sobre conversao BINARIO -> DECIMAL"
        putStrLn "        2 - Explicacao sobre conversao DECIMAL -> BINARIO"


    optionsConversion::IO()
    optionsConversion = do
        putStrLn "        1 - Converter BINARIO -> DECIMAL"
        putStrLn "        2 - Converter DECIMAL -> BINARIO"


    explanationBinToDec :: IO()
    explanationBinToDec = do
            putStrLn " O sistema binario possui somente dois algarismos. Cada posicao do numero em binario tem"
            putStrLn " um peso de uma potencia de dois (base do sistema binario). Sendo assim, para se converter"
            putStrLn " um numero de binario para decimal, deve-se multiplicar cada bit pela potencia"
            putStrLn " de sua posicao e somar os resultados. Considere o numero 00001110 sendo convertido abaixo: "
            putStrLn "                                                                                                       "
            putStrLn "   1 x 2^7      1 x 2^6      1 x 2^5      1 x 2^4      1 x 2^3      1 x 2^2      1 x 2^1      1 x 2^0  "
            putStrLn "                                                                                                       "
            putStrLn "   0 x 2^7      0 x 2^6      0 x 2^5      0 x 2^4      1 x 2^3      1 x 2^2      1 x 2^1      0 x 2^0  "
            putStrLn "                                                                                                       "
            putStrLn "     0            0            0            0            8           4            2            0       "
            putStrLn "                                                                                                       "
            putStrLn " RESULTADO = 0 + 0 + 0 + 0 + 8 + 4 + 2 + 0 => 14 = 00001110                                            "
            putStrLn "                                                                                                       "


    explanationDecToBin :: IO()
    explanationDecToBin = do
        putStrLn $ " O sistema decimal possui 10 algarismos. Esses algarismos podem ser obtidos a partir das" ++ "\n" ++" potencias de dois. Sendo assim, para se converter um numero decimal para binario, basta" ++ "\n" ++" representa-lo como uma cadeia de '0' e '1' onde a soma das potencias de dois sinalizadas" ++ "\n" ++" com '1' seja igual ao numero fornecido. Considere o numero 14 sendo convertido abaixo:" ++ "\n" ++"                                                                                                        " ++ "\n" ++"     128          64           32           16           8            4            2            1       " ++ "\n" ++"                                                                                                        " ++ "\n" ++"   0 x 2^7      0 x 2^6      0 x 2^5      0 x 2^4      1 x 2^3      1 x 2^2      1 x 2^1      0 x 2^0   " ++ "\n" ++"                                                                                                        " ++ "\n" ++"     0            0            0            0            1            1            1            0       " ++ "\n" ++"                                                                                                        " ++ "\n" ++" RESULTADO = 00001110 = 14                                                                              " ++ "\n" ++"                                                                                                        "



    execConversor :: IO()
    execConversor = do
        listOptions
        putStr " >>> "
        op <- readLn :: IO Int
        if(op == 0)
        then
            putStrLn "retornando ao menu inicial"
        else if(op == 1)
        then
            explains
        else if(op == 2)
        then
                conversor
        else
            putStrLn "erro... retornando ao menu inicial"


    explains :: IO()
    explains = do 
        optionsConversionExplanation
        putStr " >>> "
        op2 <- readLn :: IO Int
        if(op2 == 1)
        then
            
            explanationBinToDec
        else if(op2 == 2)
        then

            explanationDecToBin
        else
            putStrLn "Desculpe? pode repetir?"

    conversor :: IO()
    conversor = do
        optionsConversion
        putStr " >>> "
        op3 <- readLn :: IO Int
        if(op3 == 1)
        then
            operationBinaryToDec
        else if(op3 ==  2)
        then
            operationDecToBin
        else
            putStrLn "Desculpe? pode repetir?"

    operationBinaryToDec :: IO()
    operationBinaryToDec = do
        putStr "Digite o numero binario: "
        binary <- getLine
        putStrLn $ binaryToDec binary

    operationDecToBin :: IO()
    operationDecToBin = do
        putStr " Digite um numero inteiro: "
        decimal <- readLn :: IO Int
        putStrLn $ decToBinary decimal


    binaryToDec :: String -> String
    binaryToDec binary = show $ bintodec $ strToInt binary


    decToBinary :: Int -> String
    decToBinary n = joinBin $ tail $ toBinary n

    bintodec :: Integral i => i -> i
    bintodec 0 = 0
    bintodec i = 2 * bintodec (div i 10) + (mod i 10)
    
    toBinary :: Int -> [ Int ]
    toBinary 0 = [ 0 ]
    toBinary n = toBinary ( n `quot` 2 ) ++ [ n `rem` 2 ]
    
    
    joinBin :: [Int] -> String
    joinBin [] = ""
    joinBin (h:t) = (show h) ++ (joinBin t)
    
