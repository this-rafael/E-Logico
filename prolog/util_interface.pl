:- [artimetic_features].
:- [arrays_features].
:- [strings_features].
:- [logical_features].
:- [io_features].

% ============================================================[{ENTRADA E SAIDA}]====================================================== %
% Return se tornara uma string recebido da entrada usuario
str_input(Return) :-
    io_features:aux_str_input(Return).
    

% Return se tornará um numero recebido da entrada usuario.
number_input(Return) :- 
    io_features:aux_number_input(Return).

% limpar o terminal
cls :- 
    io_features:aux_cls.
% ============================================================[{logicaBoleana}]====================================================== %

and(A, B) :- 
    logical_features:aux_and(A,B).

or(A, B) :- 
    logical_features:aux_and(A,B).

if(Condition, Then, Else) :-
    logical_features:aux_if(Condition, Then, Else).

if_elif(IfCondition, ThenIf, ElifCondition, ThenElif, Else):-
    logical_features:aux_if_elif(IfCondition, ThenIf, ElifCondition, ThenElif, Else).
% % ============================================================[{MANIPULACAO DE STRINGS}]====================================================== %


% Retorna um caractere de uma string no index passado
% stringChatAt("STRING", 2, Return). Faz com que Return = "R"
stringCharAt(String, Index, Return) :- 
    strings_features:aux_stringCharAt(String, Index, Return).

% % ============================================================[{MANIPULACAO DE NUMEROS}=================================================== %

% X = true se x é impar, e X = false nos outros casos.
even(X) :-
    logical_features:aux_even(X).

% X = true se x é par, e X = false nos outros casos.
odd(X) :-
    logical_features:aux_odd(X).

% % ============================================================[{FUNCAO PARA ARRAYS}======================================================= %

% pega o elemento de uma posicao especificada do array.
getIndexToArray(Index, Array, Element):-
    arrays_features:aux_getIndexToArray(Index, Array, Element).

% % true se a lista passado como argumento for vazia 
isEmptyArray(Array):-
    arrays_features:aux_isEmptyArray(Array).

fibonacci(N, Return):-
    artimetic_features:aux_fibonacci(N, Return).

factorial(N, Return):-
    artimetic_features:aux_factorial(N, Return).