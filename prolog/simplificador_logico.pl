:- [literal].

/*
 * Metodos Executaveis
 * 
 * execSimplificador()                  - Chamado na Main
 * loopSimplificador(L1, L2, L3)        - Reuso dos Literais ja criados e Loop de Funcionamento do Programa
 * instanceThreeLiterals(1, L1, L2, L3) - Instanciamento de 1 Literal, 2 vazios
 * instanceThreeLiterals(2, L1, L2, L3) - Instanciamento de 2 Literais, 1 vazio
 * instanceThreeLiterals(3, L1, L2, L3) - Instanciamento de 3 Literais
 * instanceThreeLiterals(_, L1, L2, L3) - Opcao Invalida e execSimplificador() novamente chamado
 * 
 */

execSimplificador() :-
    writeln("Deseja construir quantos Literais?"),
    str_input(Num),
    instanceThreeLiterals(Num, L1, L2, L3),
    printOptions,
    str_input(Option),
    simplificaExpressao(Option, L1, L2, L3),
    loopSimplificador(L1, L2, L3).

loopSimplificador(L1, L2, L3) :-
    writeln("|: 1. Usar Expressoes; 2. Criar novas Expressoes; 0. Sair."),
    str_input(Reload),
    (Reload == "1" ->
    printOptions,
    str_input(Option),
    simplificaExpressao(Option, L1, L2, L3);
    Reload == "2" ->
    execSimplificador;
    Reload == "0" ->
    halt(0) ;
    writeln("Opcao invalida."),
    loopSimplificador(L1, L2, L3)).

instanceThreeLiterals("1", L1, L2, L3) :-
    verifyEntryAndCreatesANewLiteral(LAux1),
    L1 = LAux1,
    L2 = expression(" ", (proposition("", "")), " ", (proposition("", ""))),
    L3 = expression(" ", (proposition("", "")), " ", (proposition("", ""))).
instanceThreeLiterals("2", L1, L2, L3) :-
    verifyEntryAndCreatesANewLiteral(LAux1),
    verifyEntryAndCreatesANewLiteral(LAux2),
    L1 = LAux1,
    L2 = LAux2,
    L3 = expression(" ", (proposition("", "")), " ", (proposition("", ""))).
instanceThreeLiterals("3", L1, L2, L3) :-
    verifyEntryAndCreatesANewLiteral(LAux1),
    verifyEntryAndCreatesANewLiteral(LAux2),
    verifyEntryAndCreatesANewLiteral(LAux3),
    L1 = LAux1,
    L2 = LAux2,
    L3 = LAux3.
instanceThreeLiterals(_, _, _, _) :-
    writeln("Quantidade de Literais invalida."),
    execSimplificador.

/*
 * Metodos simplificaExpressao
 * 
 * Recebe os 3 Literais e identifica qual Opcao de Simplificacao o Usuario deseja utilizar
 * 
 * Opcao  1: Negacao                    - ~(~P&Q) retorna P&Q | ~~P retorna P
 * Opcao  2: Conjuncao                  - (p ^ q) retorna (p ^ q) -> p | (p ^ q) -> q
 * Opcao  3: Adicao Disjuntiva          - P retorna P | Qualquer outra Expressao
 * Opcao  4: Introducao de Equivalencia - (P -> Q) ^ (Q -> P) retorna (P <-> Q)
 * Opcao  5: Eliminacao da Equivalencia - (P <-> Q) retorna (P -> Q) ^ (Q -> P)
 * Opcao  6: Modus Ponens               - (P -> Q), P retorna Q
 * Opcao  7: Modus Tollens              - (P -> Q) ^ ~Q retorna ~P
 * Opcao  8: Silogismo Hipotético       - (P -> Q) ^ (Q -> R) retorna (P -> R)
 * Opcao  9: Silogismo Disjuntivo       - (P v Q) ^ ~Q retorna P
 * Opcao 10: Dilema Construtivo         - (P -> Q) ^ (r -> s) ^ (P ^ r) retorna q v s
 * Opcao 11: Exportação                 - (P ^ Q) -> R retorna P -> (Q -> R)
 * Opcao  _: Invalida                   - Mensagem de Aviso e Loop
 * 
 */

simplificaExpressao("1", L1, L2, L3) :-
    printThreeLiterals(L1, L2, L3),
    writeln("|: Escolha 1 dos 3 Literais (L1, L2 ou L3)."),

    str_input(Opcao),
    (Opcao == "L1" ->
    verificaNegacao(L1),
    loopSimplificador(L1, L2, L3);
    
    Opcao == "L2" ->
    verificaNegacao(L2),
    loopSimplificador(L1, L2, L3);

    Opcao == "L3" ->
    verificaNegacao(L2),
    loopSimplificador(L1, L2, L3);

    writeln("Literal Invalido"),
    simplificaExpressao("1", L1, L2, L3)).
simplificaExpressao("2", L1, L2, L3) :-
    printThreeLiterals(L1, L2, L3),
    writeln("|: Escolha 1 dos 3 Literais (L1, L2 ou L3)."),

    str_input(Opcao),
    (Opcao == "L1" ->
    verificaConjuncao(L1),
    loopSimplificador(L1, L2, L3);
    
    Opcao == "L2" ->
    verificaConjuncao(L2),
    loopSimplificador(L1, L2, L3);

    Opcao == "L3" ->
    verificaConjuncao(L3),
    loopSimplificador(L1, L2, L3);

    writeln("Literal Invalido"),
    simplificaExpressao("2", L1, L2, L3)).
simplificaExpressao("3", L1, L2, L3) :-
    printThreeLiterals(L1, L2, L3),
    writeln("|: Escolha 1 dos 3 Literais (L1, L2 ou L3)."),

    str_input(Opcao),
    (Opcao == "L1" ->
    literalsToString(L1, StringLit1),
    string_concat("|: A expressao ", StringLit1, A),
    string_concat(A, " pode ser expressa por ", B),
    string_concat(B, StringLit1, C),
    string_concat(C, " | Qualquer outra Expressao usando Negacao.", SaidaFinal),
    writeln(SaidaFinal),
    loopSimplificador(L1, L2, L3);
    
    Opcao == "L2" ->
    literalsToString(L2, StringLit2),
    string_concat("|: A expressao ", StringLit2, A),
    string_concat(A, " pode ser expressa por ", B),
    string_concat(B, StringLit2, C),
    string_concat(C, " | Qualquer outra Expressao usando Negacao.", SaidaFinal),
    writeln(SaidaFinal),
    loopSimplificador(L1, L2, L3);

    Opcao == "L3" ->
    literalsToString(L3, StringLit3),
    string_concat("|: A expressao ", StringLit3, A),
    string_concat(A, " pode ser expressa por ", B),
    string_concat(B, StringLit3, C),
    string_concat(C, " | Qualquer outra Expressao usando Negacao.", SaidaFinal),
    writeln(SaidaFinal),
    loopSimplificador(L1, L2, L3);

    writeln("Literal Invalido"),
    simplificaExpressao("3", L1, L2, L3)).
simplificaExpressao("4", L1, L2, L3) :-
    printThreeLiterals(L1, L2, L3),
    writeln("|: Escolha 2 dos 3 Literais (L1, L2 ou L3)."),

    str_input(Opcao1),
    str_input(Opcao2),

    (Opcao1 == "L1" ->
        (Opcao2 == "L1" ->
            verificaIntroducaoDaEquivalencia(L1, L1),
            loopSimplificador(L1, L2, L3);
        Opcao2 == "L2" ->
            verificaIntroducaoDaEquivalencia(L1, L2),
            loopSimplificador(L1, L2, L3);
        Opcao2 == "L3" ->
            verificaIntroducaoDaEquivalencia(L1, L3),
            loopSimplificador(L1, L2, L3);
            writeln("Literal Invalido"),
            simplificaExpressao("4", L1, L2, L3)
        );
    Opcao1 == "L2" ->
        (Opcao2 == "L1" ->
            verificaIntroducaoDaEquivalencia(L2, L1),
            loopSimplificador(L1, L2, L3);
        Opcao2 == "L2" ->
            verificaIntroducaoDaEquivalencia(L2, L2),
            loopSimplificador(L1, L2, L3);
        Opcao2 == "L3" ->
            verificaIntroducaoDaEquivalencia(L2, L3),
            loopSimplificador(L1, L2, L3);
            writeln("Literal Invalido"),
            simplificaExpressao("4", L1, L2, L3)
        );
    Opcao1 == "L3" ->
        (Opcao2 == "L1" ->
            verificaIntroducaoDaEquivalencia(L3, L1),
            loopSimplificador(L1, L2, L3);
        Opcao2 == "L2" ->
            verificaIntroducaoDaEquivalencia(L3, L2),
            loopSimplificador(L1, L2, L3);
        Opcao2 == "L3" ->
            verificaIntroducaoDaEquivalencia(L3, L3),
            loopSimplificador(L1, L2, L3);
            writeln("Literal Invalido"),
            simplificaExpressao("4", L1, L2, L3)
        );
    writeln("Literal Invalido"),
    simplificaExpressao("4", L1, L2, L3)).
simplificaExpressao("5", L1, L2, L3) :-
    printThreeLiterals(L1, L2, L3),
    writeln("|: Escolha 1 dos 3 Literais (L1, L2 ou L3)."),

    str_input(Opcao),
    (Opcao == "L1" ->
    verificaEliminacaoDaEquivalencia(L1),
    loopSimplificador(L1, L2, L3);
    
    Opcao == "L2" ->
    verificaEliminacaoDaEquivalencia(L2),
    loopSimplificador(L1, L2, L3);

    Opcao == "L3" ->
    verificaEliminacaoDaEquivalencia(L3),
    loopSimplificador(L1, L2, L3);

    writeln("Literal Invalido"),
    simplificaExpressao("5", L1, L2, L3)).
simplificaExpressao("6", L1, L2, L3) :-
    printThreeLiterals(L1, L2, L3),
    writeln("|: Escolha 2 dos 3 Literais (L1, L2 ou L3)."),

    str_input(Opcao1),
    str_input(Opcao2),

    (Opcao1 == "L1" ->
        (Opcao2 == "L1" ->
            verificaModusPonens(L1, L1),
            loopSimplificador(L1, L2, L3);
        Opcao2 == "L2" ->
            verificaModusPonens(L1, L2),
            loopSimplificador(L1, L2, L3);
        Opcao2 == "L3" ->
            verificaModusPonens(L1, L3),
            loopSimplificador(L1, L2, L3);
            writeln("Literal Invalido"),
            simplificaExpressao("6", L1, L2, L3)
        );
    Opcao1 == "L2" ->
        (Opcao2 == "L1" ->
            verificaModusPonens(L2, L1),
            loopSimplificador(L1, L2, L3);
        Opcao2 == "L2" ->
            verificaModusPonens(L2, L2),
            loopSimplificador(L1, L2, L3);
        Opcao2 == "L3" ->
            verificaModusPonens(L2, L3),
            loopSimplificador(L1, L2, L3);
            writeln("Literal Invalido"),
            simplificaExpressao("6", L1, L2, L3)
        );
    Opcao1 == "L3" ->
        (Opcao2 == "L1" ->
            verificaModusPonens(L3, L1),
            loopSimplificador(L1, L2, L3);
        Opcao2 == "L2" ->
            verificaModusPonens(L3, L2),
            loopSimplificador(L1, L2, L3);
        Opcao2 == "L3" ->
            verificaModusPonens(L3, L3),
            loopSimplificador(L1, L2, L3);
            writeln("Literal Invalido"),
            simplificaExpressao("6", L1, L2, L3)
        );
    writeln("Literal Invalido"),
    simplificaExpressao("6", L1, L2, L3)).
simplificaExpressao("7", L1, L2, L3) :-
    printThreeLiterals(L1, L2, L3),
    writeln("|: Escolha 2 dos 3 Literais (L1, L2 ou L3)."),

    str_input(Opcao1),
    str_input(Opcao2),

    (Opcao1 == "L1" ->
        (Opcao2 == "L1" ->
            verificaModusTollens(L1, L1),
            loopSimplificador(L1, L2, L3);
        Opcao2 == "L2" ->
            verificaModusTollens(L1, L2),
            loopSimplificador(L1, L2, L3);
        Opcao2 == "L3" ->
            verificaModusTollens(L1, L3),
            loopSimplificador(L1, L2, L3);
            writeln("Literal Invalido"),
            simplificaExpressao("7", L1, L2, L3)
        );
    Opcao1 == "L2" ->
        (Opcao2 == "L1" ->
            verificaModusTollens(L2, L1),
            loopSimplificador(L1, L2, L3);
        Opcao2 == "L2" ->
            verificaModusTollens(L2, L2),
            loopSimplificador(L1, L2, L3);
        Opcao2 == "L3" ->
            verificaModusTollens(L2, L3),
            loopSimplificador(L1, L2, L3);
            writeln("Literal Invalido"),
            simplificaExpressao("7", L1, L2, L3)
        );
    Opcao1 == "L3" ->
        (Opcao2 == "L1" ->
            verificaModusTollens(L3, L1),
            loopSimplificador(L1, L2, L3);
        Opcao2 == "L2" ->
            verificaModusTollens(L3, L2),
            loopSimplificador(L1, L2, L3);
        Opcao2 == "L3" ->
            verificaModusTollens(L3, L3),
            loopSimplificador(L1, L2, L3);
            writeln("Literal Invalido"),
            simplificaExpressao("7", L1, L2, L3)
        );
    writeln("Literal Invalido"),
    simplificaExpressao("7", L1, L2, L3)).
simplificaExpressao("8", L1, L2, L3) :-
    printThreeLiterals(L1, L2, L3),
    writeln("|: Escolha 2 dos 3 Literais (L1, L2 ou L3)."),

    str_input(Opcao1),
    str_input(Opcao2),

    (Opcao1 == "L1" ->
        (Opcao2 == "L1" ->
            verificaSilogismoHipotetico(L1, L1),
            loopSimplificador(L1, L2, L3);
        Opcao2 == "L2" ->
            verificaSilogismoHipotetico(L1, L2),
            loopSimplificador(L1, L2, L3);
        Opcao2 == "L3" ->
            verificaSilogismoHipotetico(L1, L3),
            loopSimplificador(L1, L2, L3);
            writeln("Literal Invalido"),
            simplificaExpressao("8", L1, L2, L3)
        );
    Opcao1 == "L2" ->
        (Opcao2 == "L1" ->
            verificaSilogismoHipotetico(L2, L1),
            loopSimplificador(L1, L2, L3);
        Opcao2 == "L2" ->
            verificaSilogismoHipotetico(L2, L2),
            loopSimplificador(L1, L2, L3);
        Opcao2 == "L3" ->
            verificaSilogismoHipotetico(L2, L3),
            loopSimplificador(L1, L2, L3);
            writeln("Literal Invalido"),
            simplificaExpressao("8", L1, L2, L3)
        );
    Opcao1 == "L3" ->
        (Opcao2 == "L1" ->
            verificaSilogismoHipotetico(L3, L1),
            loopSimplificador(L1, L2, L3);
        Opcao2 == "L2" ->
            verificaSilogismoHipotetico(L3, L2),
            loopSimplificador(L1, L2, L3);
        Opcao2 == "L3" ->
            verificaSilogismoHipotetico(L3, L3),
            loopSimplificador(L1, L2, L3);
            writeln("Literal Invalido"),
            simplificaExpressao("8", L1, L2, L3)
        );
    writeln("Literal Invalido"),
    simplificaExpressao("8", L1, L2, L3)).
simplificaExpressao("9", L1, L2, L3) :-
    printThreeLiterals(L1, L2, L3),
    writeln("|: Escolha 2 dos 3 Literais (L1, L2 ou L3)."),

    str_input(Opcao1),
    str_input(Opcao2),

    (Opcao1 == "L1" ->
        (Opcao2 == "L1" ->
            verificaSilogismoDisjuntivo(L1, L1),
            loopSimplificador(L1, L2, L3);
        Opcao2 == "L2" ->
            verificaSilogismoDisjuntivo(L1, L2),
            loopSimplificador(L1, L2, L3);
        Opcao2 == "L3" ->
            verificaSilogismoDisjuntivo(L1, L3),
            loopSimplificador(L1, L2, L3);
            writeln("Literal Invalido"),
            simplificaExpressao("9", L1, L2, L3)
        );
    Opcao1 == "L2" ->
        (Opcao2 == "L1" ->
            verificaSilogismoDisjuntivo(L2, L1),
            loopSimplificador(L1, L2, L3);
        Opcao2 == "L2" ->
            verificaSilogismoDisjuntivo(L2, L2),
            loopSimplificador(L1, L2, L3);
        Opcao2 == "L3" ->
            verificaSilogismoDisjuntivo(L2, L3),
            loopSimplificador(L1, L2, L3);
            writeln("Literal Invalido"),
            simplificaExpressao("9", L1, L2, L3)
        );
    Opcao1 == "L3" ->
        (Opcao2 == "L1" ->
            verificaSilogismoDisjuntivo(L3, L1),
            loopSimplificador(L1, L2, L3);
        Opcao2 == "L2" ->
            verificaSilogismoDisjuntivo(L3, L2),
            loopSimplificador(L1, L2, L3);
        Opcao2 == "L3" ->
            verificaSilogismoDisjuntivo(L3, L3),
            loopSimplificador(L1, L2, L3);
            writeln("Literal Invalido"),
            simplificaExpressao("9", L1, L2, L3)
        );
    writeln("Literal Invalido"),
    simplificaExpressao("9", L1, L2, L3)).
simplificaExpressao("10", L1, L2, L3) :-
    printThreeLiterals(L1, L2, L3),
    writeln("|: Escolha a ordem dos 3 Literais (L1, L2 ou L3)."),

    str_input(Opcao1),
    str_input(Opcao2),
    str_input(Opcao3),
    (Opcao1 == "L1" ->
        (Opcao2 == "L1" ->
            (Opcao3 == "L1" ->
                verificaDilemaConstrutivo(L1, L1, L1),
                loopSimplificador(L1, L2, L3);
            Opcao3 == "L2" ->
                verificaDilemaConstrutivo(L1, L1, L2),
                loopSimplificador(L1, L2, L3);
            Opcao3 == "L3" ->
                verificaDilemaConstrutivo(L1, L1, L3),
                loopSimplificador(L1, L2, L3);
                writeln("Literal Invalido"),
                simplificaExpressao("10", L1, L2, L3)
            );
        Opcao2 == "L2" ->
            (Opcao3 == "L1" ->
                verificaDilemaConstrutivo(L1, L2, L1),
                loopSimplificador(L1, L2, L3);
            Opcao3 == "L2" ->
                verificaDilemaConstrutivo(L1, L2, L2),
                loopSimplificador(L1, L2, L3);
            Opcao3 == "L3" ->
                verificaDilemaConstrutivo(L1, L2, L3),
                loopSimplificador(L1, L2, L3);
                writeln("Literal Invalido"),
                simplificaExpressao("10", L1, L2, L3)
            );
        Opcao2 == "L3" ->
            (Opcao3 == "L1" ->
                verificaDilemaConstrutivo(L1, L3, L1),
                loopSimplificador(L1, L2, L3);
            Opcao3 == "L2" ->
                verificaDilemaConstrutivo(L1, L3, L2),
                loopSimplificador(L1, L2, L3);
            Opcao3 == "L3" ->
                verificaDilemaConstrutivo(L1, L3, L3),
                loopSimplificador(L1, L2, L3);
                writeln("Literal Invalido"),
                simplificaExpressao("10", L1, L2, L3)
            );
            writeln("Literal Invalido"),
            simplificaExpressao("10", L1, L2, L3)
        );
    Opcao1 == "L2" ->
        (Opcao2 == "L1" ->
            (Opcao3 == "L1" ->
                verificaDilemaConstrutivo(L2, L1, L1),
                loopSimplificador(L1, L2, L3);
            Opcao3 == "L2" ->
                verificaDilemaConstrutivo(L2, L1, L2),
                loopSimplificador(L1, L2, L3);
            Opcao3 == "L3" ->
                verificaDilemaConstrutivo(L2, L1, L3),
                loopSimplificador(L1, L2, L3);
                writeln("Literal Invalido"),
                simplificaExpressao("10", L1, L2, L3)
            );
        Opcao2 == "L2" ->
            (Opcao3 == "L1" ->
                verificaDilemaConstrutivo(L2, L2, L1),
                loopSimplificador(L1, L2, L3);
            Opcao3 == "L2" ->
                verificaDilemaConstrutivo(L2, L2, L2),
                loopSimplificador(L1, L2, L3);
            Opcao3 == "L3" ->
                verificaDilemaConstrutivo(L2, L2, L3),
                loopSimplificador(L1, L2, L3);
                writeln("Literal Invalido"),
                simplificaExpressao("10", L1, L2, L3)
            );
        Opcao2 == "L3" ->
            (Opcao3 == "L1" ->
                verificaDilemaConstrutivo(L2, L3, L1),
                loopSimplificador(L1, L2, L3);
            Opcao3 == "L2" ->
                verificaDilemaConstrutivo(L2, L3, L2),
                loopSimplificador(L1, L2, L3);
            Opcao3 == "L3" ->
                verificaDilemaConstrutivo(L2, L3, L3),
                loopSimplificador(L1, L2, L3);
                writeln("Literal Invalido"),
                simplificaExpressao("10", L1, L2, L3)
            );
            writeln("Literal Invalido"),
            simplificaExpressao("10", L1, L2, L3)
        );
    Opcao1 == "L3" ->
        (Opcao2 == "L1" ->
            (Opcao3 == "L1" ->
                verificaDilemaConstrutivo(L3, L1, L1),
                loopSimplificador(L1, L2, L3);
            Opcao3 == "L2" ->
                verificaDilemaConstrutivo(L3, L1, L2),
                loopSimplificador(L1, L2, L3);
            Opcao3 == "L3" ->
                verificaDilemaConstrutivo(L3, L1, L3),
                loopSimplificador(L1, L2, L3);
                writeln("Literal Invalido"),
                simplificaExpressao("10", L1, L2, L3)
            );
        Opcao2 == "L2" ->
            (Opcao3 == "L1" ->
                verificaDilemaConstrutivo(L3, L2, L1),
                loopSimplificador(L1, L2, L3);
            Opcao3 == "L2" ->
                verificaDilemaConstrutivo(L3, L2, L2),
                loopSimplificador(L1, L2, L3);
            Opcao3 == "L3" ->
                verificaDilemaConstrutivo(L3, L2, L3),
                loopSimplificador(L1, L2, L3);
                writeln("Literal Invalido"),
                simplificaExpressao("10", L1, L2, L3)
            );
        Opcao2 == "L3" ->
            (Opcao3 == "L1" ->
                verificaDilemaConstrutivo(L3, L3, L1),
                loopSimplificador(L1, L2, L3);
            Opcao3 == "L2" ->
                verificaDilemaConstrutivo(L3, L3, L2),
                loopSimplificador(L1, L2, L3);
            Opcao3 == "L3" ->
                verificaDilemaConstrutivo(L3, L3, L3),
                loopSimplificador(L1, L2, L3);
                writeln("Literal Invalido"),
                simplificaExpressao("10", L1, L2, L3)
            );
            writeln("Literal Invalido"),
            simplificaExpressao("10", L1, L2, L3)
        );
    writeln("Literal Invalido"),
    simplificaExpressao("10", L1, L2, L3)).
simplificaExpressao("11", L1, L2, L3) :-
    printThreeLiterals(L1, L2, L3),
    writeln("|: Escolha 2 dos 3 Literais (L1, L2 ou L3)."),

    str_input(Opcao1),
    str_input(Opcao2),

    (Opcao1 == "L1" ->
        (Opcao2 == "L1" ->
            verificaExportacao(L1, L1),
            loopSimplificador(L1, L2, L3);
        Opcao2 == "L2" ->
            verificaExportacao(L1, L2),
            loopSimplificador(L1, L2, L3);
        Opcao2 == "L3" ->
            verificaExportacao(L1, L3),
            loopSimplificador(L1, L2, L3);
            writeln("Literal Invalido"),
            simplificaExpressao("11", L1, L2, L3)
        );
    Opcao1 == "L2" ->
        (Opcao2 == "L1" ->
            verificaExportacao(L2, L1),
            loopSimplificador(L1, L2, L3);
        Opcao2 == "L2" ->
            verificaExportacao(L2, L2),
            loopSimplificador(L1, L2, L3);
        Opcao2 == "L3" ->
            verificaExportacao(L2, L3),
            loopSimplificador(L1, L2, L3);
            writeln("Literal Invalido"),
            simplificaExpressao("11", L1, L2, L3)
        );
    Opcao1 == "L3" ->
        (Opcao2 == "L1" ->
            verificaExportacao(L3, L1),
            loopSimplificador(L1, L2, L3);
        Opcao2 == "L2" ->
            verificaExportacao(L3, L2),
            loopSimplificador(L1, L2, L3);
        Opcao2 == "L3" ->
            verificaExportacao(L3, L3),
            loopSimplificador(L1, L2, L3);
            writeln("Literal Invalido"),
            simplificaExpressao("11", L1, L2, L3)
        );
    writeln("Literal Invalido"),
    simplificaExpressao("11", L1, L2, L3)).
simplificaExpressao(_, L1, L2, L3) :-
    writeln("Essa Opcao nao existe"),
    loopSimplificador(L1, L2, L3).

/*
 * Metodos de Verificacoes e simplificacoes Logicas
 * 
 * verificaNegacao                  - Entrada de Literal Valida:   expression(Uop, FirstValue, Bop, SecondValue)
 * verificaNegacao                  - Entrada de Literal Valida:   proposition(UOp, Prop)
 * verificaConjuncao                - Entrada de Literal Valida:   expression(Uop, FirstValue, Bop, SecondValue)
 * verificaConjuncao                - Entrada de Literal Invalida: proposition(UOp, Prop)
 * verificaAdicao                   - Nao existe:                  verificacao ocorre no simplificaExpressao.
 * verificaIntroducaoDaEquivalencia - Entrada de Literal Valida:   expression(Uop1, FirstValue1, Bop1, SecondValue1), expression(Uop2, FirstValue2, Bop2, SecondValue2)
 * verificaIntroducaoDaEquivalencia - Entrada de Literal Invalida: _, _
 * verificaEliminacaoDaEquivalencia - Entrada de Literal Valida:   expression(Uop, FirstValue, Bop, SecondValue)
 * verificaEliminacaoDaEquivalencia - Entrada de Literal Invalida: _
 * verificaModusPonens              - Entrada de Literal Valida:   expression(Uop, FirstValue, Bop, SecondValue), LX
 * verificaModusPonens              - Entrada de Literal Invalida: proposition(UOp, Prop), _
 * verificaModusTollens             - Entrada de Literal Valida:   expression(Uop, FirstValue, Bop, SecondValue), LX
 * verificaModusTollens             - Entrada de Literal Invalida: proposition(UOp, Prop), _
 * verificaSilogismoHipotetico      - Entrada de Literal Valida:   expression(Uop1, FirstValue1, Bop1, SecondValue1), expression(Uop2, FirstValue2, Bop2, SecondValue2)
 * verificaSilogismoHipotetico      - Entrada de Literal Invalida: _, _
 * verificaSilogismoDisjuntivo      - Entrada de Literal Valida:   expression(Uop1, FirstValue1, Bop1, SecondValue1), LX
 * verificaSilogismoDisjuntivo      - Entrada de Literal Invalida: proposition(UOp, Prop), _
 * verificaDilemaConstrutivo        - Entrada de Literal Valida:   expression(Uop1, FirstValue1, Bop1, SecondValue1), expression(Uop2, FirstValue2, Bop2, SecondValue2), expression(Uop3, FirstValue3, Bop3, SecondValue3)
 * verificaDilemaConstrutivo        - Entrada de Literal Invalida: _, _, _
 * verificaExportacao               - Entrada de Literal Valida:   expression(Uop1, FirstValue1, Bop1, SecondValue1), LX
 * verificaExportacao               - Entrada de Literal Invalida: proposition(UOp, Prop), _
 *
 */

verificaNegacao(expression(Uop, FirstValue, Bop, SecondValue)) :-
    (Uop == "~" ->
        getUnaryOperator(FirstValue, UOpA),
        getUnaryOperator(SecondValue, UOpB),
        get_proposition(FirstValue, PropA),
        get_proposition(SecondValue, PropB),
        literalsToString(expression(Uop, FirstValue, Bop, SecondValue), StringLit),
        (Bop == '&' ->
        % ^
            (UOpA == "~" ->
            % ~A
                (UOpB == "~" ->
                % ~B
                string_concat("|: A expressao ", StringLit, A),
                string_concat(A, " pode ser expressa por (", B),
                string_concat(B, PropA, C),
                string_concat(C, "v", D),
                string_concat(D, PropB, E),
                string_concat(E, ") usando Negacao.", SaidaFinal);
                % B
                string_concat("|: A expressao ", StringLit, A),
                string_concat(A, " pode ser expressa por (", B),
                string_concat(B, PropA, C),
                string_concat(C, "v~", D),
                string_concat(D, PropB, E),
                string_concat(E, ") usando Negacao.", SaidaFinal)
                );
            % A
                (UOpB == "~" ->
                % ~B
                string_concat("|: A expressao ", StringLit, A),
                string_concat(A, " pode ser expressa por (~", B),
                string_concat(B, PropA, C),
                string_concat(C, "v", D),
                string_concat(D, PropB, E),
                string_concat(E, ") usando Negacao.", SaidaFinal);
                % B
                string_concat("|: A expressao ", StringLit, A),
                string_concat(A, " pode ser expressa por (~", B),
                string_concat(B, PropA, C),
                string_concat(C, "v~", D),
                string_concat(D, PropB, E),
                string_concat(E, ") usando Negacao.", SaidaFinal)
                )
            );
        Bop == '|' ->
        % v
            (UOpA == "~" ->
            % ~A
                (UOpB == "~" ->
                % ~B
                string_concat("|: A expressao ", StringLit, A),
                string_concat(A, " pode ser expressa por (", B),
                string_concat(B, PropA, C),
                string_concat(C, "v", D),
                string_concat(D, PropB, E),
                string_concat(E, ") usando Negacao.", SaidaFinal);
                % B
                string_concat("|: A expressao ", StringLit, A),
                string_concat(A, " pode ser expressa por (", B),
                string_concat(B, PropA, C),
                string_concat(C, "v~", D),
                string_concat(D, PropB, E),
                string_concat(E, ") usando Negacao.", SaidaFinal)
                );
            % A
                (UOpB == "~" ->
                % ~B
                string_concat("|: A expressao ", StringLit, A),
                string_concat(A, " pode ser expressa por (~", B),
                string_concat(B, PropA, C),
                string_concat(C, "v", D),
                string_concat(D, PropB, E),
                string_concat(E, ") usando Negacao.", SaidaFinal);
                % B
                string_concat("|: A expressao ", StringLit, A),
                string_concat(A, " pode ser expressa por (~", B),
                string_concat(B, PropA, C),
                string_concat(C, "v~", D),
                string_concat(D, PropB, E),
                string_concat(E, ") usando Negacao.", SaidaFinal)
                )
            );
        writeln("Nao eh possivel aplicar Negacao nessa Expressao."),
        writeln("Use outro Operador Binario.")
        ),

    writeln(SaidaFinal);
    writeln("Nao eh possivel aplicar Negacao nessa Expressao."),
    writeln("Tente usar uma Negacao ao lado de fora da Expressao.")
    ).

verificaNegacao(proposition(UOp, Prop)) :-
    (UOp == "~~" ->
    literalsToString(proposition(UOp, Prop), StringLit),
    string_concat("|: A expressao ", StringLit, A),
    string_concat(A, " pode ser expressa por ", B),
    string_concat(B, Prop, C),
    string_concat(C, " usando Negacao.", SaidaFinal),
    
    writeln(SaidaFinal);
    writeln("Nao eh possivel aplicar Negacao nessa Expressao."),
    writeln("Tente usar uma Dupla Negacao.")).

verificaConjuncao(expression(Uop, FirstValue, Bop, SecondValue)) :-
    (Bop == '&' ->
    literalsToString(expression(Uop, FirstValue, Bop, SecondValue), StringLit),
    literalsToString(FirstValue, StringLit1),
    literalsToString(SecondValue, StringLit2),
    string_concat("|: A expressao ", StringLit, A),
    string_concat(A, " pode ser expressa por (", B),
    string_concat(B, StringLit1, C),
    string_concat(C, "&", D),
    string_concat(D, StringLit2, E),
    string_concat(E, ") -> ", F),
    string_concat(F, StringLit1, G),
    string_concat(G, " | (", H),
    string_concat(H, StringLit1, I),
    string_concat(I, "&", J),
    string_concat(J, StringLit2, K),
    string_concat(K, ") -> ", L),
    string_concat(L, StringLit2, M),
    string_concat(M, " usando Conjuncao.", SaidaFinal),
    writeln(SaidaFinal);
    writeln("Nao eh possivel aplicar Conjuncao nessa Expressao."),
    writeln("Tente usar & como Operador Binario.")).

verificaConjuncao(proposition(_, _)) :-
    writeln("Nao eh possivel aplicar Conjuncao nessa Expressao."),
    writeln("Tente usar um Expressao com (&) como Operador Binario.").

verificaIntroducaoDaEquivalencia(expression(Uop1, FirstValue1, Bop1, SecondValue1), expression(Uop2, FirstValue2, Bop2, SecondValue2)) :-
    (Bop1 == '*' ->
        (Bop1 == Bop2 ->
            (FirstValue1 == SecondValue2 ->
                (SecondValue1 == FirstValue2 ->
                    literalsToString(expression(Uop1, FirstValue1, Bop1, SecondValue1), StringLit1),
                    literalsToString(expression(Uop2, FirstValue2, Bop2, SecondValue2), StringLit2),
                    string_concat("|: A expressao ", StringLit1, A),
                    string_concat(A, " ^ ", B),
                    string_concat(B, StringLit2, C),
                    string_concat(C, " pode ser expressa por ", D),
                    string_concat(D, StringLit1, E),
                    string_concat(E, " <-> ", F),
                    string_concat(F, StringLit2, G),
                    string_concat(G, " usando Introducao de Equivalencia.", SaidaFinal),
                    writeln(SaidaFinal);
                    writeln("Nao eh possivel aplicar Introducao de Equivalencia nessa Expressao."),
                    writeln("Tente usar duas o Primeiro Valor do Primeira Expressao igual ao Segundo Valor da Segunda Expressao"),
                    writeln("e o Segundo Valor do Primeira Expressao igual ao Primeiro Valor da Segunda Expressao."));
                writeln("Nao eh possivel aplicar Introducao de Equivalencia nessa Expressao."),
                writeln("Tente usar duas o Primeiro Valor do Primeira Expressao igual ao Segundo Valor da Segunda Expressao"),
                writeln("e o Segundo Valor do Primeira Expressao igual ao Primeiro Valor da Segunda Expressao."));
            writeln("Nao eh possivel aplicar Introducao de Equivalencia nessa Expressao."),
            writeln("Tente usar duas Expressoes com (->) como Operador Binario."));
        writeln("Nao eh possivel aplicar Introducao de Equivalencia nessa Expressao."),
        writeln("Tente usar duas Expressoes com (->) como Operador Binario.")
    ).
verificaIntroducaoDaEquivalencia(_, _) :-
    writeln("Nao eh possivel aplicar Introducao de Equivalencia nessa Expressao."),
    writeln("Tente usar duas Expressoes com (->) como Operador Binario.").

verificaEliminacaoDaEquivalencia(expression(Uop, FirstValue, Bop, SecondValue)) :-
    (Bop == '#' ->
        literalsToString(expression(Uop, FirstValue, Bop, SecondValue), StringLit),
        literalsToString(FirstValue, StringLit1),
        literalsToString(SecondValue, StringLit2),
        string_concat("|: A expressao ", StringLit, A),
        string_concat(A, " pode ser expressa por (", B),
        string_concat(B, StringLit1, C),
        string_concat(C, "->", D),
        string_concat(D, StringLit2, E),
        string_concat(E, ") ^ (", F),
        string_concat(F, StringLit2, G),
        string_concat(G, "->", H),
        string_concat(H, StringLit1, I),
        string_concat(I, ") usando Eliminacao da Equivalencia.", SaidaFinal),
        writeln(SaidaFinal);
        writeln("Nao eh possivel aplicar Eliminacao da Equivalencia nessa Expressao."),
        writeln("Tente usar uma Expressoes com (<->) como Operador Binario.")).
verificaEliminacaoDaEquivalencia(_) :-
    writeln("Nao eh possivel aplicar Eliminacao da Equivalencia nessa Expressao."),
    writeln("Tente usar uma Expressoes com (<->) como Operador Binario.").

verificaModusPonens(expression(Uop, FirstValue, Bop, SecondValue), LX) :-
    (Bop == '*' ->
        literalsToString(FirstValue, StringLit1),
        literalsToString(LX, StringLit3),
        (StringLit1 == StringLit3 ->
            literalsToString(expression(Uop, FirstValue, Bop, SecondValue), StringLit),
            literalsToString(SecondValue, _),
            string_concat("|: A expressao ", StringLit, A),
            string_concat(A, " ^ ", B),
            string_concat(B, StringLit3, C),
            string_concat(C, " pode ser expressa por (", D),
            string_concat(D, StringLit3, E),
            string_concat(E, ") usando Modus Ponens.", SaidaFinal),
            writeln(SaidaFinal);
            writeln("Nao eh possivel aplicar Modus Ponens nessa Expressao."),
            writeln("Tente usar o Segundo Valor da Primeira Expressao igual o Segundo Literal."));
        writeln("Nao eh possivel aplicar Modus Ponens nessa Expressao."),
        writeln("Tente usar uma Expressao com (->) de Operador Unario"),
        writeln("e o Segundo Valor da Primeira Expressao igual o Segundo Literal.")).
verificaModusPonens(proposition(_, _), _) :-
    writeln("Nao eh possivel aplicar Modus Ponens nessa Expressao."),
    writeln("Tente usar uma Expressao como L1, e Proposicao como L2").

verificaModusTollens(expression(Uop, FirstValue, Bop, SecondValue), LX) :-
    (Bop == '*' ->
        literalsToString(SecondValue, StringLit2),
        literalsToString(LX, StringLit3),
        string_concat("~", StringLit2, Adaptacao),
        (Adaptacao == StringLit3 ->
            literalsToString(expression(Uop, FirstValue, Bop, SecondValue), StringLit),
            literalsToString(FirstValue, StringLit1),
            string_concat("|: A expressao ", StringLit, A),
            string_concat(A, " ^ ", B),
            string_concat(B, StringLit3, C),
            string_concat(C, " pode ser expressa por (~", D),
            string_concat(D, StringLit1, E),
            string_concat(E, ") usando Modus Tollens.", SaidaFinal),
            writeln(SaidaFinal);
            writeln("Nao eh possivel aplicar Modus Tollens nessa Expressao."),
            writeln("Tente usar o Segundo Valor da Primeira Expressao igual o Segundo Literal negado."));
        writeln("Nao eh possivel aplicar Modus Tollens nessa Expressao."),
        writeln("Tente usar uma Expressao com (->) de Operador Unario"),
        writeln("e o Segundo Valor da Primeira Expressao igual o Segundo Literal negado.")).
verificaModusTollens(proposition(_, _), _) :-
    writeln("Nao eh possivel aplicar Modus Ponens nessa Expressao."),
    writeln("Tente usar uma Expressao como L1, e Proposicao como L2").

verificaSilogismoHipotetico(expression(Uop1, FirstValue1, Bop1, SecondValue1), expression(Uop2, FirstValue2, Bop2, SecondValue2)) :-
    literalsToString(SecondValue1, _),
    literalsToString(FirstValue2, StringLit3),
    (StringLit3 == StringLit3 ->
        (Bop1 == '*' ->
            (Bop1 == Bop2 ->
                literalsToString(expression(Uop1, FirstValue1, Bop1, SecondValue1), Lit1),
                literalsToString(expression(Uop2, FirstValue2, Bop2, SecondValue2), _),
                literalsToString(FirstValue1, StringLit1),
                literalsToString(SecondValue2, StringLit4),
                string_concat("|: A expressao ", Lit1, A),
                string_concat(A, " ^ ", B),
                string_concat(B, StringLit3, C),
                string_concat(C, " pode ser expressa por (", D),
                string_concat(D, StringLit1, E),
                string_concat(E, "->", F),
                string_concat(F, StringLit4, G),
                string_concat(G, ") usando Silogismo Hipotetico.", SaidaFinal),
                writeln(SaidaFinal);
                writeln("Nao eh possivel aplicar Silogismo Hipotetico nessa Expressao."),
                writeln("Tente usar o Operador Binario (->) em duas Expressoes."));
            writeln("Nao eh possivel aplicar Silogismo Hipotetico nessa Expressao."),
            writeln("Tente usar o Operador Binario (->) em duas Expressoes."));
        writeln("Nao eh possivel aplicar Silogismo Hipotetico nessa Expressao."),
        writeln("Tente usar o Segundo Valor da Primeira Expressao igual ao Primeiro Valor da Segunda Expressao.")).
verificaSilogismoHipotetico(_, _) :-
    writeln("Nao eh possivel aplicar Silogismo Hipotetico nessa Expressao."),
    writeln("Tente usar duas Expressoes em L1 e L2").

verificaSilogismoDisjuntivo(expression(Uop1, FirstValue1, Bop1, SecondValue1), LX) :-
    literalsToString(SecondValue1, StringLit2),
    literalsToString(LX, Lit2),
    string_concat("~", StringLit2, Adaptacao),
    (Lit2 == Adaptacao ->
        writeln("1"),
        (Bop1 == '|' ->
            literalsToString(expression(Uop1, FirstValue1, Bop1, SecondValue1), Lit1),
            literalsToString(FirstValue1, StringLit1),
            string_concat("|: A expressao ", Lit1, A),
            string_concat(A, " ^ ", B),
            string_concat(B, Lit2, C),
            string_concat(C, " pode ser expressa por (", D),
            string_concat(D, StringLit1, E),
            string_concat(E, ") usando Silogismo Disjuntivo.", SaidaFinal),
            writeln(SaidaFinal);
            writeln("Nao eh possivel aplicar Silogismo Disjuntivo nessa Expressao."),
            writeln("Tente usar o Operador Binario (|) na primeira Expressao."));
        writeln("Nao eh possivel aplicar Silogismo Disjuntivo nessa Expressao."),
        writeln("Tente usar o Operador Binario (|) na primeira Expressao."),
        writeln("e o Segundo Valor da Primeira Expressao igual o Segundo Literal negado.")).
verificaSilogismoDisjuntivo(proposition(_, _), _) :-
    writeln("Nao eh possivel aplicar Silogismo Disjuntivo nessa Expressao."),
    writeln("Tente usar Expressao com o Operador Binario (|) em L1").

verificaDilemaConstrutivo(expression(Uop1, FirstValue1, Bop1, SecondValue1), expression(Uop2, FirstValue2, Bop2, SecondValue2), expression(Uop3, FirstValue3, Bop3, SecondValue3)) :-
    literalsToString(FirstValue1, StringL1),
    literalsToString(FirstValue2, StringL3),
    literalsToString(FirstValue3, StringL5),
    literalsToString(SecondValue3, StringL6),
    (StringL1 == StringL5 ->
        (StringL3 == StringL6 ->
            (Bop1 == '*' ->
                (Bop2 == Bop1 ->
                    (Bop3 == '&' ->
                        literalsToString(expression(Uop1, FirstValue1, Bop1, SecondValue1), Lit1),
                        literalsToString(expression(Uop2, FirstValue2, Bop2, SecondValue2), Lit2),
                        literalsToString(expression(Uop3, FirstValue3, Bop3, SecondValue3), Lit3),
                        literalsToString(SecondValue1, StringL2),
                        literalsToString(SecondValue2, StringL4),
                        string_concat("|: A expressao ", Lit1, A),
                        string_concat(A, " ^ ", B),
                        string_concat(B, Lit2, C),
                        string_concat(C, " ^ ", D),
                        string_concat(D, Lit3, E),
                        string_concat(E, " pode ser expressa por (", F),
                        string_concat(F, StringL2, G),
                        string_concat(G, " v ", H),
                        string_concat(H, StringL4, I),
                        string_concat(I, ") usando Dilema Construtivo.", SaidaFinal),
                        writeln(SaidaFinal);
                        writeln("Nao eh possivel aplicar Dilema Construtivo nessa Expressao."),
                        writeln("Tente usar o Operador Binario (&) na Terceira Expressao."));
                    writeln("Nao eh possivel aplicar Dilema Construtivo nessa Expressao."),
                    writeln("Tente usar o Operador Binario (->) na Primeira e na Segunda Expressao."));
                writeln("Nao eh possivel aplicar Dilema Construtivo nessa Expressao."),
                writeln("Tente usar o Operador Binario (->) na Primeira e na Segunda Expressao."));
            writeln("Nao eh possivel aplicar Dilema Construtivo nessa Expressao."),
            writeln("Tente usar o Primeiro Valor da Segunda Expressao igual ao Segundo Valor da Terceira Expressao."));
        writeln("Nao eh possivel aplicar Dilema Construtivo nessa Expressao."),
        writeln("Tente usar o Primeiro Valor da Primeira Expressao igual ao Primeiro Valor da Terceira Expressao.")).
verificaDilemaConstrutivo(_, _, _) :-
    writeln("Nao eh possivel aplicar Dilema Construtivo nessa Expressao."),
    writeln("Tente usar as 3 Expressoes, sendo as duas primeiras com o Operador Binario (->) e a terceira (^).").

% (P ^ Q) -> R retorna P -> (Q -> R)
verificaExportacao(expression(Uop1, FirstValue1, Bop1, SecondValue1), LX) :-
    (Bop1 == '&' ->
        literalsToString(expression(Uop1, FirstValue1, Bop1, SecondValue1), Lit1),
        literalsToString(LX, Lit2),
        literalsToString(FirstValue1, StringL1),
        literalsToString(SecondValue1, StringL2),
        string_concat("|: A expressao ", Lit1, A),
        string_concat(A, " -> ", B),
        string_concat(B, Lit2, C),
        string_concat(C, " pode ser expressa por ", D),
        string_concat(D, StringL1, E),
        string_concat(E, " -> (", F),
        string_concat(F, StringL2, G),
        string_concat(G, " -> ", H),
        string_concat(H, Lit2, I),
        string_concat(I, ") usando Exportacao.", SaidaFinal),
        writeln(SaidaFinal);
        writeln("Nao eh possivel aplicar Exportacao nessa Expressao."),
        writeln("Tente usar o Operador Binario (&) na Primeira Expressao.")).
verificaExportacao(proposition(_, _), _) :-
    writeln("Nao eh possivel aplicar Exportacao nessa Expressao."),
    writeln("Tente usar o Operador Binario (&) na Primeira Expressao.").

/*
 * Metodos de Prints
 * 
 * printThreeLiterals        - Printa os 3 Literais Construidos (usado em SimplificaExpressoes)
 * printOption               - Printa Tabela de Simplificacoes Logicas
 * metodoTesteDeSaidaLiteral - Printa Saidas Literais p/ Testes
 * 
 */


printThreeLiterals(L1, L2, L3) :-
    literalsToString(L1, StringL1),
    literalsToString(L2, StringL2),
    literalsToString(L3, StringL3),
    string_concat("|:  L1: ", StringL1, A),
    string_concat(A, " ; L2: ", B),
    string_concat(B, StringL2, C),
    string_concat(C, " ; L3: ", D),
    string_concat(D, StringL3, ThreeLits),
    writeln(ThreeLits).

printOptions :-
    writeln("         --- Opcoes Numericas --- "),
    writeln(" 1 - Negação"),
    writeln(" 2 - Conjunção"),
    writeln(" 3 - Adição"),
    writeln(" 4 - Introdução da Equivalência"),
    writeln(" 5 - Eliminação da Equivalência"),
    writeln(" 6 - Modus Ponens"),
    writeln(" 7 - Modus Tollens"),
    writeln(" 8 - Silogismo Hipotético"),
    writeln(" 9 - Silogismo Disjuntivo"),
    writeln("10 - Dilema Construtivo"),
    writeln("11 - Exportação"),
    writeln(" 0 - Voltar ao menu principal"),
    writeln("        --- Digite a sua opção! ---").

metodoTesteDeSaidaLiteral(L1, L2, L3) :-
    literalsToString(L1, R1),
    writeln(L1),
    writeln(R1),
    literalsToString(L2, R2),
    writeln(L2),
    writeln(R2),
    literalsToString(L3, R3),
    writeln(L3),
    writeln(R3).
