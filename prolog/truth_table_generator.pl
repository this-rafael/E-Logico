
is_proposition(Atom,Return) :-
    Ignore = ["(",")","&","|","*","#","-",">","<"," "],
    atom_string(Atom, String),
    
    (member(String,Ignore)) -> Return = false; Return = true.
    

get_propositions_aux([],Return) :- Return = [].
get_propositions_aux([H|T],Return) :-
    is_proposition(H,Proposicao),
    (Proposicao) -> get_propositions_aux(T,R),
    append([H],R,R2),
    Return = R2;
    get_propositions_aux(T,R),
    Return = R.

get_propositions(Expression,Return) :-
    string_chars(Expression,List),
    get_propositions_aux(List,R),
    Return = R.



