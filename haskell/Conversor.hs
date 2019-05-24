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
    putStrLn "        3 - Explicacao sobre conversao BINARIO -> FLOAT"
    putStrLn "        4 - Explicacao sobre conversao FLOAT -> BINARIO"


optionsConversion::IO()
optionsConversion = do
    putStrLn "        1 - Converter BINARIO -> DECIMAL"
    putStrLn "        2 - Converter DECIMAL -> BINARIO"
    putStrLn "        3 - Converter BINARIO -> FLOAT"
    putStrLn "        4-  Converter FLOAT -> BINARIO"


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


explanationFloatToBinIEEE754::IO()
explanationFloatToBinIEEE754 = do
    putStrLn " A representacao de numeros de ponto flutuante em binario pelo padrao IEEE 754 tem 32 bits"
    putStrLn " de precisao. Desses 32 bits, um eh um bit dedicado ao sinal do numero, oito bits sao"
    putStrLn " dedicados ao expoente do numero e os outros vinte e tres bits restantes sao destinados a"
    putStrLn " a mantissa do numero. Considere o numero -9.5 sendo convertido abaixo:"

    putStrLn "1) Bit de sinal: 1 (NEGATIVO = 1, POSITIVO = 0)"
    putStrLn "2) Conversao para binario: 9.5 --> 1001.1"
    putStrLn "3) Deslocar a virgula e 'esconder' o primeiro bit: 0011"
    putStrLn "4) Multiplicar por 2 elevado a quantidade de deslocamentos: 0011 x 2^3"
    putStrLn "5) Normalizar o expoente somando com 127: 3 + 127 = 130 = 10000010"
    putStrLn "6) Agrupar o resultado na forma: bit sinal   expoente   mantissa"
    putStrLn "7) Resultado: 1   10000010   00110000000000000000000"



explanationBinaryToFloat32::IO()
explanationBinaryToFloat32 = do
    putStrLn " Um numero binario de 32 bits pode ser convertido em um numero decimal com sinal. Para isso"
    putStrLn " realiza-se o inverso das operacoes aplicadas na conversao de numero float para binario."
    putStrLn " Considere o numero 11000001000110000000000000000000 sendo convertido abaixo:"

    putStrLn "1) Subtrair 127 do expoente: 10000010 = 130 => 130 - 127 = 3"
    putStrLn "2) Retornar o bit escondido: 1.0011"
    putStrLn "3) Deslocar a virgula: 1.0011 => 1001.1"
    putStrLn "4) Converter para binario: 1001.1 = 9.5"
    putStrLn "5) Adicionar sinal (se for negativo): -9.5"


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
    else if (op2 == 3)
    then
        
        explanationBinaryToFloat32
    else if (op2 == 4)
    then
        
        explanationFloatToBinIEEE754
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
    else if(op3 ==  3)
    then
        operationBinaryToFloat32
    else if(op3 ==  4)
    then
        operationFloatToBinIEEE754
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

operationBinaryToFloat32 :: IO()
operationBinaryToFloat32 = do
    putStr " Digite um numero binario: "
    binary <- getLine
    putStrLn $ binaryToFloat32 binary

operationFloatToBinIEEE754 :: IO()
operationFloatToBinIEEE754 = do
    putStrLn " Digite um numero float "
    f <- readLn :: IO Float
    putStrLn $ floatToBinIEEE754 f

binaryToDec :: String -> String
binaryToDec binary = show $ bintodec $ strToInt binary

decToBinary :: Int -> String
decToBinary decimal = "teste 2" -- implementar

binaryToFloat32 :: String -> String
binaryToFloat32 binary = "teste 3" -- implementar

floatToBinIEEE754 :: Float -> String -- Implementar
floatToBinIEEE754 float = "teste 4"



bintodec :: Integral i => i -> i
-- BASE CASE
bintodec 0 = 0
-- INVERSION OF THE DIVISION METHOD
bintodec i = 2 * bintodec (div i 10) + (mod i 10)

