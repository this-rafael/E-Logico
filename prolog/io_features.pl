:- module('io_features', [aux_str_input/1, aux_number_input/1, aux_cls/0]).


aux_str_input(Return) :-
    read_line_to_string(user_input, Return).

% Return se tornará um numero recebido da entrada usuario.
aux_number_input(Return) :- 
    read_line_to_codes(user_input, Codes),
    string_to_atom(Codes, Atom),
    atom_number(Atom, Return).

% limpar o terminal
aux_cls :- 
    write('\e[H\e[2J').