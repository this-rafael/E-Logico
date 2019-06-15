
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

dec_bin(0,'0').
dec_bin(1,'1').
dec_bin(N,B) :-
    N > 1,
    X is N mod 2,
    Y is N//2,
    dec_bin(Y,B1),
    atom_concat(B1, X, B).

len(Atom,Return) :-
    atom_chars(Atom,List),
    length(List,Len),
    Return = Len.

complete_bin(Bin,Size,Return) :-
    len(Bin,Len),
    (Len =:= Size),
    Return = Bin;
    atom_concat('0',Bin,B2),
    complete_bin(B2,Size,R2),
    Return = R2.

get_possibilities_aux(0,Fix,Return) :- 
    complete_bin('0',Fix,Bin),
    Return = [Bin].
get_possibilities_aux(Size,Fix,Return) :-
    NewSize is Size - 1,
    dec_bin(Size,R),
    get_possibilities_aux(NewSize,Fix,R2),
    complete_bin(R,Fix,B2),
    append(R2,[B2],R3),
    Return = R3.

get_possibilities(Expression,Return) :-
    get_propositions(Expression,Prop),
    length(Prop,Number),
    Lines = (2 ^ Number) - 1,
    get_possibilities_aux(Lines,Number,R),
    Return = R.

    
    