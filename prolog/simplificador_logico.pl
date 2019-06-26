:- [literal].

% Regra executavel do SimplificadorLogico na main.
execSimplificador() :-
    writeln("Deseja construir quantos Literais?"),
    str_input(Num),
    instanceThreeLiterals(Num, L1, L2, L3),

    % Print Saidas Literais - Para Testes
    % metodoTesteDeSaidaLiteral(L1, L2, L3),

    % Tabela: Opcoes de Simplificacoes
    printOptions,
    str_input(Option),
    simplificaExpressao(Option, L1, L2, L3),

    % Opcao de Reuso dos Literais Criados
    loopSimplificador(L1, L2, L3).

loopSimplificador(L1, L2, L3) :-
    writeln("1. Usar Expressoes; 2. Criar novas Expressoes; 0. Sair."),
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

% Possibilidade de criacao de 1, 2 ou 3 Literais.
% Em caso da criação de 1 ou 2, Literais vazios sao preenchidos.
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
% Em caso de Quantidade invalida, ocorre loop.
instanceThreeLiterals(Num, L1, L2, L3) :-
    writeln("Quantidade de Literais invalida."),
    execSimplificador.

% Opcao 1: Negacao - ~(~P&Q) retorna P&Q | ~~P retorna P
simplificaExpressao("1", L1, L2, L3) :-
    printThreeLiterals(L1, L2, L3),
    writeln("Escolha 1 dos 3 Literais (L1, L2 ou L3)."),

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

% Opcao de Simplificacao Invalida
simplificaExpressao(Num, L1, L2, L3) :-
    writeln("Essa Opcao nao existe"),
    loopSimplificador(L1, L2, L3).

verificaNegacao(LX) :-
    getUnaryOperator(LX, UOp),

    (UOp == "~~") ->
    literalsToString(LX, StringLit),
    get_proposition(LX, ValueProp),
    string_concat("A expressao ", StringLit, A),
    string_concat(A, " pode ser expressa por ", B),
    string_concat(B, ValueProp, C),
    string_concat(C, " usando Negacao.", SaidaFinal),
    
    writeln(SaidaFinal);
    writeln("Nao eh possivel aplicar Negacao nessa Expressao.").

printThreeLiterals(L1, L2, L3) :-
    literalsToString(L1, StringL1),
    literalsToString(L2, StringL2),
    literalsToString(L3, StringL3),
    string_concat("L1: ", StringL1, A),
    string_concat(A, " ; L2: ", B),
    string_concat(B, StringL2, C),
    string_concat(C, " ; L3: ", D),
    string_concat(D, StringL2, ThreeLits),
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

% Print de Literais em FormatoLogico e em LiteralToString.
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
