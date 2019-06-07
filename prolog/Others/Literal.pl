

changesToValidBinaryOperator(TypedEntry, Return) :-
    Return = TypedEntry. %% metodo descrito no git de haskell "changeForValidBinaryOperator"



isValidUnaryOperator(Operator, Return):- % retorna true or false
    Return = (1 =:= 1). % retorna true se o operador for "~" ou uma sequencia de "~"

isValidBinaryOperator(Operator, Return):- % retorna true or false
    Return = (1 =:= 1). % retorna true se o operador for [|, &, ->, <->, ^, v, *, #, +, .] ou uma sequencia de "~"


isValidProposition(Proposicao, Return):- % retorna true or false
    Return = (1 =:= 1). % considerar que "" eh uma proposicao valida, mas que +p nao eh, ~pp nao eh, +~p nao eh, p~ nao eh, ~p+ tamben nao eh...


chooseUnaryOperator(Return) :-
    writeln("Digite o operador unario: "),
    write(" >>> "),
    str_input(TypedEntry),
    isValidUnaryOperator(TypedEntry, IsValidUnaryOperator),
    (IsValidUnaryOperator) ->
        Return = TypedEntry
    ;
        writeln("O operador unario digitado, nao eh valido... Tente outra vez"),
        chooseUnaryOperator(Return).


chooseBinaryOperator(Return) :-
    writeln("Digite o operador binario: "),
    write(" >>> "),
    str_input(TypedEntry),
    isValidBinaryOperator(TypedEntry, IsValidBinaryOperator),
    (IsValidBinaryOperator) -> 
        changesToValidBinaryOperator(TypedEntry, Return) % return changesToValidBinaryOperator(TypedEntry)
    ; % else
        writeln("O operador binario digitado, nao eh valido... Tente outra vez"),
        chooseBinaryOperator(Return).


treatsValidProposition(Proposition, Length, Return) :- 
    (Length =:= 1)  -> % se for o caso da proposicao ser do tipo P
        Return = proposition("", Proposition) % retorne = p
    ; (Length =:= 2) -> % se o tipo for ~p
        stringCharAt(Proposition, 1, Value),
        Return = proposition("~", Value) % retorne = ~p
    ; % else se for ~~p
        stringCharAt(Proposition, 2, Value), 
        Return = proposition("~~", Value). % retorne = ~~p

treatsLongProposition(Proposition, Length, Return) :-
    
    (odd(Length - 1)) ->
        ValuePosition is (Length - 1), %codigo fica duplicado, caso contrario Value não é atribuida :-(
        stringCharAt(Proposition, ValuePosition, Value),
        Return = proposition("~", Value)
    ; % else
        ValuePosition is (Length - 1),
        stringCharAt(Proposition, ValuePosition, Value),
        Return = proposition("", Value), write(Value).


propositionConstruct(Return) :-
    writeln("\n Digite a Variavel associada a sua Proposicao (digite com um til caso seja negada, ex: ~a):"),
    write(" >>> "),
    str_input(Proposition),
    isValidProposition(Proposicao, EhExpressaoValida),
    (EhExpressaoValida) ->  % se for uma expressao valida
        string_length(Proposition, Length), (Length =:= 0) ->
            Return = proposition("", ""), write("oi")
        
        ;  string_length(Proposition, Length), (Length >= 1, Length < 3) ->
            treatsValidProposition(Proposition, Length, Ans),
            Return = Ans
        ;   
        string_length(Proposition, Length), treatsLongProposition(Proposition, Length, Ans),
            Return = Ans
    ;
        propositionConstruct(Return).






expressionConstruct(Return):-
    chooseUnaryOperator(UnaryOperator),
    receiveInput(ValueA),
    chooseBinaryOperator(BinaryOperator),
    receiveInput(ValueB),
    Return = expression(UnaryOperator, ValueA, BinaryOperator, ValueB).



receiveInput(Return) :-
    writeln(" 1- Para inserir uma Proposicao"),
    writeln(" 2- Para inserir uma Expressao" ),
    write(" >>> "),
    number_input(Option),
    (Option =:= 1) ->
        propositionConstruct(Return)
    ; (Option =:= 2) ->
        expressionConstruct(Return)
    ;  
        Return = proposition("","").
