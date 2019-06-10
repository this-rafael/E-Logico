:- use_module("util_interface").
:- initialization(main).




changesToValidBinaryOperator(TypedEntry, Return) :-
    Return = TypedEntry. %% metodo descrito no git de haskell "changeForValidBinaryOperator"


isValidUnaryOperator(Operator, Return):- % retorna true or false
    Return = true. % retorna true se o operador for "~" ou uma sequencia de "~"

isValidProposition(Proposition, Return):- % retorna true or false
    Return = true. % considerar que "" eh uma proposicao valida, mas que +p nao eh, ~pp nao eh, +~p nao eh, p~ nao eh, ~p+ tamben nao eh...

chooseBinaryOperator(Return) :-
    writeln("Digite o operador binario: "),
    str_input(TypedEntry),
    isValidUnaryOperator(TypedEntry, IsValidBinaryOperator),
    if(
        (IsValidBinaryOperator),
        (
            Return = TypedEntry
        ),
        (
        % else
            writeln("O operador unario digitado, nao eh valido... Tente outra vez"),
            chooseBinaryOperator(Return)
        )
    ).


chooseUnaryOperator(Return) :-
    writeln("Digite o operador unario: "),
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

treatsLongProposition(Proposition, Length, Return) :-
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
                    
                    treatsLongProposition(Proposition, LengthP, Return)
                    )
                )
            ),
        (  % else
            writeln("A proposicao digitada eh invalida"),
            propositionConstruct(Return)
        )
    ).



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

expressionContruct(Return):-
    chooseUnaryOperator(Uop),
    verifyEntryAndCreatesANewLiteral(ValueA),
    chooseBinaryOperator(Bop),
    verifyEntryAndCreatesANewLiteral(ValueB),
    Return = expression(Uop, ValueA, Bop, ValueB).


getUnaryOperator(expression(Uop, ValueA, Bop, ValueB), Return) :-
    Return = Uop.

getBinaryOperator(expression(Uop, ValueA, Bop, ValueB), Return) :-
    Return = Bop.

getFirstValue(expression(Uop, ValueA, Bop, ValueB), Return) :-
    Return = ValueA.

getSecondValue(expression(Uop, ValueA, Bop, ValueB), Return) :-
    Return = ValueB.



isAtomic(proposition(UnaryOp, Value), Return) :- Return = true.
isAtomic(expression(Uop, ValueA, Bop, ValueB), Return) :- Return =  false.

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

changeForValidBinaryOperator("*", Return):- Return = "*".
changeForValidBinaryOperator("->", Return):- Return = "*".
changeForValidBinaryOperator("#", Return):- Return = "#".
changeForValidBinaryOperator("<->", Return):- Return = "#".
changeForValidBinaryOperator("^", Return):- Return = "&".
changeForValidBinaryOperator(".", Return):- Return = "&".
changeForValidBinaryOperator("&", Return):- Return = "&".
changeForValidBinaryOperator("v", Return):- Return = "|".
changeForValidBinaryOperator("+", Return):- Return = "|".
changeForValidBinaryOperator("|", Return):- Return = "|".
changeForValidBinaryOperator(_, Return):- Return = "§".


chooseABinaryOperator(Return) :-
    writeln( " Escolha entre os Operadores abaixo: "),
    writeln( " E: &, ^, ." ),
    writeln( " Ou: |, v, +" ),
    writeln( " Implica: ->, *" ),
    writeln( " Bi-Implica: <->, #" ),
    str_input(Valor),
    Return = Valor.


isNegative(proposition("~~", _), Return) :- Return = false. 
isNegative(proposition("~", _), Return) :- Return = true.
isNegative(proposition("", _), Return) :- Return = false.

isNegative(expression("~~",_,_,_), Return) :- Return = false.
isNegative(expression("~",_,_,_), Return) :- Return = true.
isNegative(expression("",_,_,_), Return) :- Return = false.


literalsToString(proposition(UnaryOp, Value), Return):- string_concat(UnaryOp, Value, Return).
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
