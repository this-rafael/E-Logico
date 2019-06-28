aux_and(A,B) :-
    A,B.

aux_or(A,B) :-
    A;B.

aux_if(Condition, Then, Else):-
    (Condition) -> Then ; Else.

aux_if_elif(IfCondition, ThenIf, ElifCondition, ThenElif, Else) :-
    (IfCondition) -> ThenIf ; (ElifCondition) -> ThenElif ; Else.

aux_even(X):-
    0 is mod(X, 2).

aux_odd(X) :-
    1 is mod(X, 2).
