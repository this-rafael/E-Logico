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

execConversionExplanation("1"):- explanationBinToDec.
execConversionExplanation("2"):- explanationDecToBin.
execConversionExplanation(X):-
    writeln(" Desculpe-me, nao consegui te entender :(").

listOptions:-
    writeln("\n         --- Opcoes Numericas --- "),
    writeln("        0 - Voltar ao menu inicial"),
    writeln("        1 - Explicacoes sobre conversoes"),
    writeln("        2 - Realizar conversoes").

optionsConversionExplanation:-
    writeln("\n        1 - Explicacao sobre conversao BINARIO -> DECIMAL"),
    writeln("        2 - Explicacao sobre conversao DECIMAL -> BINARIO").

optionsConversion:-
    writeln("\n        1 - Converter BINARIO -> DECIMAL"),
    writeln("        2 - Converter DECIMAL -> BINARIO").

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

decToBin(0,'0').
decToBin(1,'1').
decToBin(N,B):-
    N>1,
    X is N mod 2,
    Y is N//2,
    decToBin(Y,B1),
    atom_concat(B1, X, B).

binaryToDec(Binary, Return):-
    Binary =:= 0 -> Return is 0;
    Binary =:= 1 -> Return is 1;
    R is Binary mod 10,
    X is Binary // 10,
    binaryToDec(X, Y),
    Return is 2 * Y + R.