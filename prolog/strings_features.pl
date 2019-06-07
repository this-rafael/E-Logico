:- module('strings_features', [aux_stringCharAt/3]).

aux_stringCharAt(String, Index, Return) :- 
    string_to_list(String, List),
    nth0(Index, List, CodeChar),
    char_code(Char, CodeChar),
    Return = Char.
