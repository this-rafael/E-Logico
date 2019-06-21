:- [literal].

% Regra executavel do SimplificadorLogico na main.
execSimplificador() :-
    writeln("Deseja construir quantos Literais?"),
    str_input(Num),

    instanceThreeLiterals(Num, L1, L2, L3),

    % Print Saidas Literais
    metodoTesteDeSaidaLiteral(L1, L2, L3),

    % Tabela: Opcoes de Simplificacoes
    printOptions,

    str_input(Option),

    % Problema para entrar no caso "1"
    writeln(Option),
    simplificaExpressao(Option, L1, L2, L3).

    writeln("1. Usar Expressoes; 2. Criar novas Expressoes; 0. Sair."),
    str_input(Reload),

    loopSimplificador(Reload, L1, L2, L3).

loopSimplificador(L1, L2, L3) :-
    writeln("1. Usar Expressoes; 2. Criar novas Expressoes; 0. Sair."),
    str_input(Reload),
    if_elif (
        (Reload == "1"), 
            (printOptions,
             writeln(Option),
             simplificaExpressao(Option, L1, L2, L3),
            ),
        (Reload == "2"),
            (execSimplificador),
        ( if( (Reload == "0"), 
            (halt(0).),
            (write("Opcao invalida."), loopSimplificador(L1, L2, L3)) )
            )
        ).

/* Possibilidade de criacao de 1, 2 ou 3 Literais.
 * 
 * Em caso da criação de 1 ou 2, Literais vazios sao preenchidos.
 * Em caso de Quantidade invalida, ocorre loop.
 */
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

% Opcao 1: Negacao - ~(~P&Q) retorna P&Q | ~~P retorna P
simplificaExpressao("1", L1, L2, L3) :-
    writeln("Escolha 1 dos 3 Literais (L1, L2 ou L3).").

    % read(Opcao),
    % if ( (Opcao == "L1"), (verificaNegacao(L1)),
    %   (if ( (Opcao == "L2"), (verificaNegacao(L2)),
    %     (if ( (Opcao == "L3"), (verificaNegacao(L3)),
    %       (write("Esse Literal nao existe."), simplificaExpressao("1", L1, L2, L3))
    %       )
    %     )
    % ),
    %
    % loopSimplificador(L1, L2, L3).

%verificaNegacao(LX) :-
%   if ( (Proposicao for Duplamente Negada),
%       (write("A expressao literalToString(LX) pode ser expressa por "getValueA(LX)" usando Negacao.)),
%       (write("Nao eh possivel aplicar Negacao nessa Expressao.")).
    
simplificaExpressao(Num, L1, L2, L3) :-
    writeln("Essa Opcao nao existe"),
    % loopSimplificador(L1, L2, L3).
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
