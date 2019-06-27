:- [literal].

% Regra executavel do SimplificadorLogico na main.
execSimplificador() :-
    % Opcao para Criacao de ate 3 Literais
    writeln("Deseja construir quantos Literais?"),
    str_input(Num),
    instanceThreeLiterals(Num, L1, L2, L3),

    % Tabela: Opcoes de Simplificacoes
    printOptions,
    str_input(Option),
    simplificaExpressao(Option, L1, L2, L3),

    % Opcao de Reuso dos Literais Criados
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

% Opcao 2: Conjuncao - (p ^ q) retorna (p ^ q) -> p | (p ^ q) -> q
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

% Opcao 3: Adicao Disjuntiva - P retorna P | Qualquer outra Expressao
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

% Opcao 4: Introducao de Equivalencia - (P -> Q) ^ (Q -> P) retorna (P <-> Q)
simplificaExpressao("4", L1, L2, L3) :-
    printThreeLiterals(L1, L2, L3),
    writeln("|: Escolha 2 dos 3 Literais (L1, L2 ou L3)."),

    str_input(Opcao1),
    str_input(Opcao2),

    (Opcao1 == "L1" ->
        (Opcao2 == "L1" ->
            verificaIntroducaoDeEquivalencia(L1, L1),
            loopSimplificador(L1, L2, L3);
        Opcao2 == "L2" ->
            verificaIntroducaoDeEquivalencia(L1, L2),
            loopSimplificador(L1, L2, L3);
        Opcao2 == "L3" ->
            verificaIntroducaoDeEquivalencia(L1, L3),
            loopSimplificador(L1, L2, L3);
            writeln("Literal Invalido"),
            simplificaExpressao("4", L1, L2, L3)
        );
    Opcao1 == "L2" ->
        (Opcao2 == "L1" ->
            verificaIntroducaoDeEquivalencia(L2, L1),
            loopSimplificador(L1, L2, L3);
        Opcao2 == "L2" ->
            verificaIntroducaoDeEquivalencia(L2, L2),
            loopSimplificador(L1, L2, L3);
        Opcao2 == "L3" ->
            verificaIntroducaoDeEquivalencia(L2, L3),
            loopSimplificador(L1, L2, L3);
            writeln("Literal Invalido"),
            simplificaExpressao("4", L1, L2, L3)
        );
    Opcao1 == "L3" ->
        (Opcao2 == "L1" ->
            verificaIntroducaoDeEquivalencia(L3, L1),
            loopSimplificador(L1, L2, L3);
        Opcao2 == "L2" ->
            verificaIntroducaoDeEquivalencia(L3, L2),
            loopSimplificador(L1, L2, L3);
        Opcao2 == "L3" ->
            verificaIntroducaoDeEquivalencia(L3, L3),
            loopSimplificador(L1, L2, L3);
            writeln("Literal Invalido"),
            simplificaExpressao("4", L1, L2, L3)
        );
    writeln("Literal Invalido"),
    simplificaExpressao("4", L1, L2, L3)).

% Opcao de Simplificacao Invalida
simplificaExpressao(Num, L1, L2, L3) :-
    writeln("Essa Opcao nao existe"),
    loopSimplificador(L1, L2, L3).

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

verificaConjuncao(proposition(UOp, Prop)) :-
    writeln("Nao eh possivel aplicar Conjuncao nessa Expressao."),
    writeln("Tente usar um Expressao com (&) como Operador Binario.").

verificaIntroducaoDeEquivalencia(expression(Uop1, FirstValue1, Bop1, SecondValue1), expression(Uop2, FirstValue2, Bop2, SecondValue2)) :-
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
verificaIntroducaoDeEquivalencia(_, _) :-
    writeln("Nao eh possivel aplicar Introducao de Equivalencia nessa Expressao."),
    writeln("Tente usar duas Expressoes com (->) como Operador Binario.").

% Auxilio para simplificaExpressao
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

% Print Saidas Literais - Para Testes
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
