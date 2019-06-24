listOptions:-
    writeln("         --- Opcoes Numericas --- "),
    writeln("        0 - Voltar ao menu inicial"),
    writeln("        1 - Explicacoes sobre conversoes"),
    writeln("        2 - Realizar conversoes").

optionsConversionExplanation:-
    writeln("        1 - Explicacao sobre conversao BINARIO -> DECIMAL"),
    writeln("        2 - Explicacao sobre conversao DECIMAL -> BINARIO"),
    writeln("        3 - Explicacao sobre conversao BINARIO -> FLOAT"),
    writeln("        4 - Explicacao sobre conversao FLOAT -> BINARIO").

optionsConversion:-
    writeln("        1 - Converter BINARIO -> DECIMAL"),
    writeln("        2 - Converter DECIMAL -> BINARIO"),
    writeln("        3 - Converter BINARIO -> FLOAT"),
    writeln("        4-  Converter FLOAT -> BINARIO").

explanationBinToDec:-
    writeln(" O sistema binario possui somente dois algarismos. Cada posicao do numero em binario tem"),
    writeln(" O sistema binario possui somente dois algarismos. Cada posicao do numero em binario tem"),
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
    writeln(" O sistema decimal possui 10 algarismos. Esses algarismos podem ser obtidos a partir das"),
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

