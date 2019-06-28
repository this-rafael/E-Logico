:- [util_interface].

logo() :-
    writeln("\n############################################################################################"),
    writeln("############################################################################################"),
    writeln("############################################################################################"),
    writeln("#######        ###########   #######        ##        ##       ##        ##        #########"),
    writeln("############   ###########   #######   ##   ##   #########   ####   #######   ##   #########"),
    writeln("########       ###     ###   #######   ##   ##   ##   ####   ####   #######   ##   #########"),
    writeln("############   ###########   #######   ##   ##   ##   ####   ####   #######   ##   #########"),
    writeln("#######        ###########        ##        ##        ##       ##        ##        #########"),
    writeln("############################################################################################"),
    writeln("############################################################################################"),
    writeln("############################################################################################"),
    
    sleep(1). 

apresentacao() :-
    writeln("\n                               Ola, Bem vindo ao E-LOGICO!"),
    writeln("\n              Programa Interativo de Aprendizagem e auxilio a assuntos Logicos").

 
    
menuOpcoes() :-
    writeln("\n MENU: \n"),
    writeln(" 1 - Aprendendo a formular uma Tabela-Verdade"),
    writeln(" 2 - Aprendendo a converter (Bin - Dec) <---> (Dec - Bin)"),
    writeln(" 3 - Aprendendo a simplificar expressoes proposicionais"),
    writeln(" 4 - Aprendendo as regras basicas de proposicoes"),
    writeln(" 0 - SAIR\n"),
    writeln(" Digite a sua opcao!\n"). 
    
        

resumoTabela() :-
    writeln("\n A Tabela Verdade eh utilizada em logica para considerar a validade de uma formula ou conferir que uma combinacao estah correta."),
    writeln(" Quer saber como se constroi uma Tabela Verdade?\n").
    
    

infoTabela() :-
    writeln("\n                            COMO CONSTRUIR UMA TABELA MANUALMENTE?\n"),
    writeln(" a) O numero de linhas contidas em uma Tabela Verdade vai ser calculada por Linhas = 2^n, onde (n) eh a quantidade de preposicoes."),
    writeln(" b) Incluimos nas linhas valores correspondentes em binario de (0 ... [2^n - 1]). Exemplo: Com uma tabela de 2 preposicoes teremos 4"),
    writeln("    linhas, em linha[1] = 0 0, 0 em binario com 2 casas decimais. na linha[2] = 0 1, 1 em binario com 2 casas. linha[3] = 1 0 , linha[4] = 1 1 "),
    writeln(" c) Enquanto ao numero de colunas, vai depender de voce, mas temos que ter obrigatoriamente n colunas + 1. Onde n eh definido como o numero de preposicoes e 1 coluna de resposta."),
    writeln(" d) Na coluna de resposta, temos o resultado das operacoes. Cada linha com seu respectivo bit resposta\n").


resumoConversor() :-
    writeln("\n O conversor faz a traducao entre numeros de bases diferentes\n"),
    writeln(" Convertendo Bin --> Dec, teremos a conversao de Binario (base 2) para Decimal (base 10)\n"),
    writeln(" Convertendo Dec --> Bin, teremos a conversao de Decimal (base 10) para Binario (base 2)\n"),
    writeln(" Quer aprender a fazer conversoes entre bases?\n").

infoConversor() :-
    writeln("\n                                        COMO CONVERTER UM NUMERO?\n\n"),

    writeln(" 1) De Binario para Decimal:\n"),
    writeln("   a) Posicionalmente, o numero binario tem seu bit mais considerativo da esquerda para direita. O ultimo bit valerah menos que o primeiro!\n"),
    writeln("   b) Considerando o valor de cada bit, temos que o cada bit valerah 2^n onde n ah a localidade da direita para esquerda, contada a partir do zero."),
    writeln("      Exemplo: 0 0 1 , o bit 1 irah valer 2^0. 1 0 0 , o bit 1 irah valer 2^2\n"),
    writeln("   c) O resultado do numero convertido serah a soma do valor de cada bit levando em conta sua considerabilidade."),
    writeln("      Exemplo: 1 0 1 1, 2^0 + 2^1 + 2^3 = 1 + 2 + 8 = 11 \n\n"),

    writeln(" 2) De Decimal para Binario:\n"),
    writeln("   a) O numero em decimal serah dividido pela base binario, ou seja 2, repetidas vezes ate que se sobre 1 ou 0\n"),
    writeln("   b) O importante da divisao serah o resto da divisao e seu resultado final."),
    writeln("      Exemplo: o numero 2 em decimal, 2 / 2 = 1 e 2 % 2 = 0\n"),
    writeln("   c) Chegando a ultima divisao com resto inteiro possivel, temos que reunir os restos das divisoes com o ultimo resultado possivel."),
    writeln("      Exemplo: 4, 4 % 2 = 0, 4/2 = 2, como 2 ainda pode ser divisivel por 2, 2 % 2 = 0 e 2 / 2 = 1. Juntando os restos com o ultimo resultado, temos:  0 0 1\n"),
    writeln("   d) Com o resultado da divisao por 2 e seus restos concatenado, temos que apenas inverter a ordem. Exemplo anterior 0 0 1, invertemos 1 0 0, que equivale a 4\n\n").
    

resumoExpressoes() :-
    writeln("\n Expressoes Proposicionais podem ser gigantes."),
    writeln(" No entranto, existem várias regras de simplificacao que podem transformar expressoes gigantescas em expressões simples com a mesma equivalencia logica!\n").


infoExpressoes() :-
    writeln("\n                                            COMO SIMPLIFICAR UMA EXPRESSAO PROPOSICIONAL?\n\n"),   
    writeln(" a) Partimos da definicao das proposicoes\n"),
    writeln(" b) Assumimos uma regra que se encaixe com as proposicoes destinadas e aplicamos.\n"),
    writeln(" c) Repetimos os passos podendo utilizar a mesma regra ou uma regra diferente, ate chegarmos a uma expressao que nao aceite mais nenhuma regra. Em tese serah a expressao simplificada\n").


choice(1) :-
    resumoTabela,
    write(" >>> "), aux_str_input(Answer),
    (Answer == "sim"), infoTabela;
    write(" tudo bem! ate mais ver em frances, Au re voir!").

choice(2) :-
    resumoConversor,
    write(" >>> "), aux_str_input(Answer),
    (Answer == "sim"), infoConversor;
    write(" tudo bem! ate mais ver em frances, Au re voir!").

/*
    ISSO DAQUI, PROVAVELMENTE, ESTA ERRADO!!!
*/

choice(3) :-
    resumoExpressoes().
    
choice(4) :-
    infoExpressoes().

/*
    REVISAR ESTA MIZERA AMANHA
*/


choiceDefault() :-
    write(" Abaixa o volume da TV e me escuta pelo telefone! pode repetir?").



function_loop() :-
    menuOpcoes(), nl,
    read_line_to_string(user_input, Entrada),
        (Entrada = "1" -> choice(1);
         Entrada = "2" -> choice(2);
         Entrada = "3" -> choice(3);
         Entrada = "4" -> choice(4);
         Entrada = "0" -> write("Espero que volte novamente!!!"), nl, halt(0); 
         choiceDefault()),
         function_loop().

auxMenuApresentacao() :-
    logo(), apresentacao().