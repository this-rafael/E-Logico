:- initialization(execConversor).

execConversor:-
    listOptions,
    write(" >>> "),
    read_line_to_string(user_input, Option),
    execConversorAux(Option).

execConversorAux("0"):-
    writeln(" Retornando ao menu inicial...\n").

execConversorAux("1"):-
    optionsConversionExplanation,
    write(" >>> "),
    read_line_to_string(user_input, Option),
    execConversionExplanation(Option).

execConversorAux("2"):-
    optionsConversion,
    write(" >>> "),
    read_line_to_string(user_input, Option),
    execConversion(Option).

execConversorAux(Y):-
    writeln(" Desculpe-me, pode repetir?\n"),
    execConversor.

execConversion("1"):-
    write("\n Digite um numero binario: "),
    read_line_to_codes(user_input, Codes),
    string_to_atom(Codes, Atom),
    atom_number(Atom, Number),
    binaryToDec(Number, Decimal),
    writeln(Decimal).

execConversion("2"):-
    write("\n Digite um numero inteiro: "),
    read_line_to_codes(user_input, Codes),
    string_to_atom(Codes, Atom),
    atom_number(Atom, Number),
    decToBin(Number, X),
    writeln(X).

execConversion("3"):-
    write("\n Digite um numero binario: "),
    read_line_to_string(user_input, binary),
    binaryToFloat32(Binary, X),
    writeln(X).

execConversion("4"):-
    write("\n Digite um numero float: "),
    read_line_to_codes(user_input, Codes),
    string_to_atom(Codes, Atom),
    atom_number(Atom, Number),
    floatToBinIEEE754(Number, X),
    writeln(X).

execConversionExplanation("1"):- explanationBinToDec.
execConversionExplanation("2"):- explanationDecToBin.
execConversionExplanation("3"):- explanationBinaryToFloat32.
execConversionExplanation("4"):- explanationFloatToBinIEEE754.
execConversionExplanation(X):-
    writeln(" Desculpe-me, nao consegui te entender :(").

listOptions:-
    writeln("\n         --- Opcoes Numericas --- "),
    writeln("        0 - Voltar ao menu inicial"),
    writeln("        1 - Explicacoes sobre conversoes"),
    writeln("        2 - Realizar conversoes").

optionsConversionExplanation:-
    writeln("\n        1 - Explicacao sobre conversao BINARIO -> DECIMAL"),
    writeln("        2 - Explicacao sobre conversao DECIMAL -> BINARIO"),
    writeln("        3 - Explicacao sobre conversao BINARIO -> FLOAT"),
    writeln("        4 - Explicacao sobre conversao FLOAT -> BINARIO\n").

optionsConversion:-
    writeln("\n        1 - Converter BINARIO -> DECIMAL"),
    writeln("        2 - Converter DECIMAL -> BINARIO"),
    writeln("        3 - Converter BINARIO -> FLOAT"),
    writeln("        4-  Converter FLOAT -> BINARIO").

explanationBinToDec:-
    writeln("\n O sistema binario possui somente dois algarismos. Cada posicao do numero em binario tem"),
    writeln(" um peso de uma potencia de dois (base do sistema binario). Sendo assim, para se converter"),
    writeln(" um numero de binario para decimal, deve-se multiplicar cada bit pela potencia"),
    writeln(" de sua posicao e somar os resultados. Considere o numero 00001110 sendo convertido abaixo: "),
    writeln("                                                                                                       "),
    writeln("   1 x 2^7      1 x 2^6      1 x 2^5      1 x 2^4      1 x 2^3      1 x 2^2      1 x 2^1      1 x 2^0  "),
    writeln("                                                                                                       "),
    writeln("   0 x 2^7      0 x 2^6      0 x 2^5      0 x 2^4      1 x 2^3      1 x 2^2      1 x 2^1      0 x 2^0  "),
    writeln("                                                                                                       "),
    writeln("                                                                                                       "),
    writeln(" RESULTADO = 0 + 0 + 0 + 0 + 8 + 4 + 2 + 0 => 14 = 00001110                                            "),
    writeln("                                                                                                       ").

explanationDecToBin:-
    writeln("\n O sistema decimal possui 10 algarismos. Esses algarismos podem ser obtidos a partir das"),
    writeln(" potencias de dois. Sendo assim, para se converter um numero decimal para binario, basta"),
    writeln(" representa-lo como uma cadeia de '0' e '1' onde a soma das potencias de dois sinalizadas"),
    writeln(" com '1' seja igual ao numero fornecido. Considere o numero 14 sendo convertido abaixo:"),
    writeln("                                                                                                        "),
    writeln("     128          64           32           16           8            4            2            1       "),
    writeln("                                                                                                        "),
    writeln("   0 x 2^7      0 x 2^6      0 x 2^5      0 x 2^4      1 x 2^3      1 x 2^2      1 x 2^1      0 x 2^0   "),
    writeln("                                                                                                        "),
    writeln("     0            0            0            0            1            1            1            0       "),
    writeln("                                                                                                        "),
    writeln(" RESULTADO = 00001110 = 14                                                                              "),
    writeln("                                                                                                        ").

explanationFloatToBinIEEE754:-
    writeln("\n A representacao de numeros de ponto flutuante em binario pelo padrao IEEE 754 tem 32 bits"),
    writeln(" de precisao. Desses 32 bits, um eh um bit dedicado ao sinal do numero, oito bits sao"),
    writeln(" dedicados ao expoente do numero e os outros vinte e tres bits restantes sao destinados a"),
    writeln(" a mantissa do numero. Considere o numero -9.5 sendo convertido abaixo:\n"),
    writeln(" 1) Bit de sinal: 1 (NEGATIVO = 1, POSITIVO = 0)"),
    writeln(" 2) Conversao para binario: 9.5 --> 1001.1"),
    writeln(" 3) Deslocar a virgula e 'esconder' o primeiro bit: 0011"),
    writeln(" 4) Multiplicar por 2 elevado a quantidade de deslocamentos: 0011 x 2³"),
    writeln(" 5) Normalizar o expoente somando com 127: 3 + 127 = 130 = 10000010"),
    writeln(" 6) Agrupar o resultado na forma: bit sinal | expoente | mantissa"),
    writeln(" 7) Resultado: 1 | 10000010 | 00110000000000000000000").

explanationBinaryToFloat32:-
    writeln("\n Um numero binario de 32 bits pode ser convertido em um numero decimal com sinal. Para isso"),
    writeln(" realiza-se o inverso das operacoes aplicadas na conversao de numero float para binario."),
    writeln(" Considere o numero 11000001000110000000000000000000 sendo convertido abaixo:\n"),
    writeln(" 1) Subtrair 127 do expoente: 10000010 = 130 => 130 - 127 = 3"),
    writeln(" 2) Retornar o bit escondido: 1.0011"),
    writeln(" 3) Deslocar a virgula: 1.0011 => 1001.1"),
    writeln(" 4) Converter para binario: 1001.1 = 9.5"),
    writeln(" 5) Adicionar sinal (se for negativo): -9.5").

decToBin(0,'0').
decToBin(1,'1').
decToBin(N,B):-
    N>1,
    X is N mod 2,
    Y is N//2,
    decToBin(Y,B1),
    atom_concat(B1, X, B).

%TODO
binaryToDec(0, 0).
binaryToDec(1, 1).
%binaryToDec(Binary, Return):-
    %R is Binary mod 10,
    %X is Binary // 10,
    %binaryToDec(X, Y),
    %Return is 2 * Y + R.

%TODO
binaryToFloat32(X, 0.0).

%TODO
floatToBinIEEE754(X, 0).
