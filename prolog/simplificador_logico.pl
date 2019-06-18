:- [literal].

% Possibilidade de criacao de 1, 2 ou 3 Literais.
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
instanceThreeLiterals(Num, L1, L2, L3) :-
    writeln("Quantidade de Literais invalida."),
    execSimplificador.


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

execSimplificador() :-
    writeln("Deseja construir quantos Literais?"),
    str_input(Num),
    instanceThreeLiterals(Num, L1, L2, L3),

    % Saidas Literais
    metodoTesteDeSaidaLiteral(L1, L2, L3),

    % Print tabela de Opcoes
    printOptions,

    str_input(Option),
    writeln(Option),
    simplificaExpressao(Option, L1, L2, L3).

% Problema para entrar nesse caso
simplificaExpressao("1", L1, L2, L3) :-
    writeln("Isso deveria estar sendo printado para o caso 1."),
    % Necessario que o Usuario escolha o Literal
    getUnaryOperator(L1, UOp),
    if(
        (UOp =:= "~"),
        (
            writeln("Operador Unario eh negativo").
        ),
        (
            writeln("Negue sua Expressao").
        )
    ).
simplificaExpressao(Num, L1, L2, L3) :-
    writeln("Essa Opcao nao existe"),
    execSimplificador.


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
