:- use_module("util_interface").
:- initialization(main).




isValidUnaryOperator(Operator, Return):- % retorna true or false
    Return = true. % retorna true se o operador for "~" ou uma sequencia de "~"

isValidBinaryOperator(Operator, Return) :-
    Return true.

isValidProposition(Proposition, Return):- % retorna true or false
    Return = true. % considerar que "" eh uma proposicao valida, mas que +p nao eh, ~pp nao eh, +~p nao eh, p~ nao eh, ~p+ tamben nao eh...

% escolhe um operador binario apartir da entrada do usuario
chooseBinaryOperator(Return) :-
    writeln("\nDigite o operador binario: "),
    str_input(TypedEntry),
    isValidBinaryOperator(TypedEntry, IsValidBinaryOperator),
    if(
        (IsValidBinaryOperator),
        (
            Return = TypedEntry
        ),
        (
        % else
            writeln("O operador binario digitado, nao eh valido... Tente outra vez"),
            chooseBinaryOperator(Return)
        )
    ).

% escolhe do usuario um operador unario
chooseUnaryOperator(Return) :-
    writeln("\nDigite o operador unario: "),
    str_input(TypedEntry),
    isValidUnaryOperator(TypedEntry, IsValidUnaryOperator),
    if(
        (IsValidUnaryOperator),
        (
            Return = TypedEntry
        ),
        % else
        (
            writeln("O operador unario digitado, nao eh valido... Tente outra vez"),
            chooseUnaryOperator(Return)
        )
    ).

% trata uma proposicao "curta"
treatsValidProposition(Proposition, Length, Return) :- 
    if_elif(
        (Length =:= 1),% if
            (
                Return = proposition("", Proposition)
            ),
        (Length =:= 2), % elif
            (
                stringCharAt(Proposition, 1, Value),
                Return = proposition("~", Value)
            ),
        (   % else
            stringCharAt(Proposition, 2, Value), 
            Return = proposition("~~", Value)
        )
    ).

% trata uma proposicao com um length muito grande (causdo por uma sequencia de "~~~~~~~~~~~") ex: ~~~~~~~~~~~q
treatsValidLongProposition(Proposition, Length, Return) :-
    ValuePosition is (Length - 1),
    if(
        (odd(ValuePosition)), % if
            (
                stringCharAt(Proposition, ValuePosition, Value),
                Return = proposition("~", Value)
            ),
        (       % else
            stringCharAt(Proposition, ValuePosition, Value),
            Return = proposition("", Value)
        )
    ).

%constroi uma proposicao
propositionConstruct(Return) :-
    writeln("\n Digite a Variavel associada a sua Proposicao (digite com um til caso seja negada, ex: ~a):"),
    str_input(Proposition),
    isValidProposition(Proposition, EhExpressaoValida),
    if(
        (EhExpressaoValida),
            ( % if
            string_length(Proposition, LengthP),
                if_elif(
                    (LengthP =:= 0), % if
                        (

                            Return = proposition("", "")
                        ),
                    ( and(LengthP >= 1, LengthP =< 3)), % elif
                        (
                            treatsValidProposition(Proposition, LengthP, Return)
                        ),
                    ( % else
                    
                    treatsValidLongProposition(Proposition, LengthP, Return)
                    )
                )
            ),
        (  % else
            writeln("A proposicao digitada eh invalida"),
            propositionConstruct(Return)
        )
    ).


% verifica a entrada do usuario e cria um novo literal
verifyEntryAndCreatesANewLiteral(Return) :-
    writeln(" 1- Para inserir uma Proposicao") , 
    writeln(" 2- Para inserir uma Expressao"),
    str_input(Option),
    if(
        (Option == "0"),
            (
                Return = proposition("", "")
            ),
        (
            if_elif(
                (Option == "1"),
                    (
                        propositionConstruct(Return)
                    ),
                (Option == "2"),
                    (
                        expressionContruct(Return)
                    ),
                (
                    Return = proposition("", "")
                )
            )
        )
    ).

% metodos auxliares para imprimir o estado atual do literal

currentStatePrint(Return) :- 
    Return = "Estado Atual do literal:". % Return = Estado Atual do literal:

currentStatePrint(Uop, Return):-
    currentStatePrint(PreviousState),
    string_concat(PreviousState, Uop, State0), 
    string_concat(State0, "(", Return). % Return = Estado Atual do literal: ~( ou  Return = Estado Atual do literal: (

currentStatePrint(Uop, Expression1, Return) :-
    currentStatePrint(Uop, State1),
    literalsToString(Expression1, Expression1ToString),
    string_concat(State1, Expression1ToString, Return). % Return = Estado Atual do literal: ~(P ou  Return = Estado Atual do literal: (Q

currentStatePrint(Uop, Expression1, Bop, Return):-
    currentStatePrint(Uop, Expression1, State2),
    string_concat(State2, Bop, Return).  % Return = Estado Atual do literal: ~(P| ou  Return = Estado Atual do literal: (Q&

currentStatePrint(Uop, Expression1, Bop, Expression2, Return):-
    currentStatePrint(Uop, Expression1, Bop, State3),
    literalsToString(Expression2, Expression2ToString),
    string_concat(State3, Expression2ToString, Response),
    string_concat(Response, ")", Return).  % Return = Estado Atual do literal: ~(P|R) ou  Return = Estado Atual do literal: (Q&J)


% constroi uma Expressao (Literal Composto)
expressionContruct(Return):-
    % prints iniciais gerando informações    
    currentStatePrint(R0), 
    string_concat(R0, " ()", R), 
    writeln(R),

    % escolhendo/imprimindo o operador unario
    chooseUnaryOperator(Uop), 
    currentStatePrint(Uop, R1), 
    writeln(R1),
    
    % escolhendo/imprimindo o filho a direita de uma literal
    verifyEntryAndCreatesANewLiteral(ValueA), 
    currentStatePrint(Uop, ValueA, R2), 
    writeln(R2),
    

    chooseBinaryOperator(Bop), 
    currentStatePrint(Uop, ValueA, Bop, R3), 
    writeln(R3),
    
    verifyEntryAndCreatesANewLiteral(ValueB), 
    currentStatePrint(Uop, ValueA, Bop, ValueB, R4),  
    writeln(R4),
    
    Return = expression(Uop, ValueA, Bop, ValueB).


% metodos getters
getUnaryOperator(expression(Uop, ValueA, Bop, ValueB), Return) :-
    Return = Uop.

getBinaryOperator(expression(Uop, ValueA, Bop, ValueB), Return) :-
    Return = Bop.

getFirstValue(expression(Uop, ValueA, Bop, ValueB), Return) :-
    Return = ValueA.

getSecondValue(expression(Uop, ValueA, Bop, ValueB), Return) :-
    Return = ValueB.


% informa se uma literal eh atomico (nao composto)
isAtomic(proposition(UnaryOp, Value), Return) :- Return = true.
isAtomic(expression(Uop, ValueA, Bop, ValueB), Return) :- Return =  false.


% gera um toString do operador binario
binaryOperatorToString(BinaryOp, Return) :- 
    if_elif(
        (BinaryOp ==  "*"),
            (Return = "->"),
        (BinaryOp == "#"),
            (Return = "<->"),
        (
            Return = BinaryOp
        )    
    ).

% modifica o operado para uma sintaxe valida para literal
changeToValidBinaryOperator("*", Return):- Return = "*".
changeToValidBinaryOperator("->", Return):- Return = "*".
changeToValidBinaryOperator("#", Return):- Return = "#".
changeToValidBinaryOperator("<->", Return):- Return = "#".
changeToValidBinaryOperator("^", Return):- Return = "&".
changeToValidBinaryOperator(".", Return):- Return = "&".
changeToValidBinaryOperator("&", Return):- Return = "&".
changeToValidBinaryOperator("v", Return):- Return = "|".
changeToValidBinaryOperator("+", Return):- Return = "|".
changeToValidBinaryOperator("|", Return):- Return = "|".
changeToValidBinaryOperator(_, Return):- Return = "§".

% escolhe do usuario um operador binario;.
chooseABinaryOperator(Return) :-
    writeln( " Escolha entre os Operadores abaixo: "),
    writeln( " E: &, ^, ." ),
    writeln( " Ou: |, v, +" ),
    writeln( " Implica: ->, *" ),
    writeln( " Bi-Implica: <->, #" ),
    str_input(BinaryOp),
    changeToValidBinaryOperator(BinaryOp, Response),
    Return = Response.



% verifica se uma proposicao eh negada
isNegative(proposition("~~", _), Return) :- Return = false. 
isNegative(proposition("~", _), Return) :- Return = true.
isNegative(proposition("", _), Return) :- Return = false.


% verifica se uma expressao eh negada
isNegative(expression("~~",_,_,_), Return) :- Return = false.
isNegative(expression("~",_,_,_), Return) :- Return = true.
isNegative(expression("",_,_,_), Return) :- Return = false.



% gera uma representacao textual de uma proposicao. Ex: ~p
literalsToString(proposition(UnaryOp, Value), Return):- 
    string_concat(UnaryOp, Value, Return).


% gera uma representacao textual de uma expressao. Ex: ~(P | Q)
literalsToString(expression(UnaryOp, ValueA, BinaryOp, ValueB), Return) :-
    string_concat(UnaryOp,"(", A), writeln("A"),  writeln(A), 
    
    literalsToString(ValueA, ValueAToStr),
    string_concat(A, ValueAToStr, B),

    binaryOperatorToString(BinaryOp, BinaryOpToString),     
    string_concat(B, BinaryOpToString, C),
    literalsToString(ValueB, D), 
    string_concat(C, D, E), 
    string_concat(E,")", F), 
    Return = F.




main :-
    verifyEntryAndCreatesANewLiteral(L),
    literalsToString(L, R),
    writeln(L),
    writeln(R).
