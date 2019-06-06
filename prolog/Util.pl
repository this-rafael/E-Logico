% ============================================================[{ENTRADA E SAIDA}]====================================================== %


% Return se tornara uma string recebido da entrada usuario.
str_input(Return) :-
    read_line_to_string(user_input, Return).

% Return se tornará um numero recebido da entrada usuario.
number_input(Return) :- 
    read_line_to_codes(user_input, Codes),
    string_to_atom(Codes, Atom),
    atom_number(Atom, Return).

% limpar o terminal
cls :- 
    write('\e[H\e[2J').

% ============================================================[{MANIPULACAO DE STRINGS}]====================================================== %

% Retorna um caractere de uma string no index passado
% stringChatAt("STRING", 2, Return). Faz com que Return = "R"
stringCharAt(String, Index, Return) :- 
    string_to_list(String, List),
    nth0(Index, List, CodeChar),
    char_code(Char, CodeChar),
    Return = Char.

%  X = true se x é impar, e X = false nos outros casos.


% ============================================================[{MANIPULACAO DE NUMEROS}=================================================== %

% X = true se x é impar, e X = false nos outros casos.
even(X) :-
    0 is mod(X, 2).

% X = true se x é par, e X = false nos outros casos.
odd(X) :-
    1 is mod(X, 2).

% ============================================================[{FUNCAO PARA ARRAYS}======================================================= %

% pega o elemento de uma posicao especificada do array.
getIndexToArray(0, [Head|_], Head).
getIndexToArray(X, [_|Tail], Element) :- 
    K is X - 1, 
    getIndexToArray(K, Tail, Element).

% true se a lista passado como argumento for vazia 
isEmpty([]).


