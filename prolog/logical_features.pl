:- module('logical_features', [aux_and/2, aux_or/2, aux_if/3]).

aux_and(A,B) :-
    A,B.

aux_or(A,B) :-
    A;B.

aux_if(Condition, Then, Else):-
    (Condition) -> Then ; Else.

aux_even(X):-
    0 is mod(X, 2).

aux_odd(X) :-
    1 is mod(X, 2).
