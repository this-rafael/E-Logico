:- [literal].


negate(Value,Return) :-
    Value, Return = false;
    Return = true.

and(A,B,Return) :-
    A,B,Return = true; Return = false.

or(A,B,Return) :-
    (A;B),Return = true; Return = false.

implication(A,B,Return) :-
    (\+A;B),Return = true; Return = false.

xor(A,B,Return) :-
    (A,B;\+A,\+B),Return = true; Return = false.


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





get_proposition_position(Prop,[H|T],Return) :-
    (Prop == H) -> Return is 0;
    get_proposition_position(Prop,T,R2),
    R3 is 1 + R2,
    Return = R3.
    
get_proposition_value(Prop,List,Poss,Return) :-
    get_proposition_position(Prop,List,Position),
    nth0(Position,Poss,Value),
    Return = Value.

    

check_unary_operator(Value,Operator,Return) :-
    (Operator == '~') ->
    negate(Value,V),
    Return = V;
    Return = Value.

result(proposition(UnOp,Prop),List,Poss,Return) :- 
    get_proposition_value(Prop,List,Poss,R1),
    check_unary_operator(R1,UnOp,R2),
    Return = R2.
result(expression(UnOp,V1,BinOp,V2),List,Poss,Return) :-
    (BinOp == '&') ->
    result(V1,List,Poss,A),
    result(V2,List,Poss,B),
    and(A,B,AB),
    check_unary_operator(AB,UnOp,R1),
    Return = R1;
    (BinOp == '|') ->
    result(V1,List,Poss,C),
    result(V2,List,Poss,D),
    or(C,D,CD),
    check_unary_operator(CD,UnOp,R2),
    Return = R2;
    (BinOp == '*') ->
    result(V1,List,Poss,E),
    result(V2,List,Poss,F),
    implication(E,F,EF),
    check_unary_operator(EF,UnOp,R3),
    Return = R3;
    (BinOp == '#') ->
    result(V1,List,Poss,G),
    result(V2,List,Poss,H),
    xor(G,H,GH),
    check_unary_operator(GH,UnOp,R4),
    Return = R4.


rest_to_string(true, Return) :- Return = "1".
rest_to_string(false,Return) :- Return = "0".

boolean_list([],[]).
boolean_list([H|T],Return) :-
    (H == '1') ->
    A = [true],
    boolean_list(T,R1),
    append(A,R1,R2),
    Return = R2;
    B = [false],
    boolean_list(T,R1),
    append(B,R1,R2),
    Return = R2.

first_line([],Exp,Return) :-
    concat("| ",Exp,R), Return = R.
first_line([H|T],Exp,Return) :-
    concat(H," ",R),
    first_line(T,Exp,R2),
    concat(R,R2,R3),
    Return = R3.

get_line([],Value,Prop,Literal,Return) :-
    result(Literal,Prop,Value,R1),
    rest_to_string(R1,R2),
    concat(" | ",R2,R3),
    Return = R3.
get_line([H|T],Value,Prop,Literal,Return) :-
    concat(" ",H,R1),
    get_line(T,Value,Prop,Literal,R2),
    concat(R1,R2,R3),
    Return = R3.

get_every_line([], _, _, "").
get_every_line([H|T],Prop,Literal,Return) :-
    atom_chars(H,H2),
    boolean_list(H2,H3),
    get_line(H2,H3,Prop,Literal,R1),
    concat(R1,"\n",R2),
    get_every_line(T,Prop,Literal,R3),
    concat(R2,R3,R4),
    Return = R4.

mount_table(Interpretations,Propositions,Literal,Return) :-
    literalsToString(Literal,Expression),
    first_line(Propositions,Expression,First),
    concat(" ",First,F1),
    concat(F1,"\n",F2),
    get_every_line(Interpretations,Propositions,Literal,R1),
    concat(F2,R1,R2),
    Return = R2.

get_table(Literal,Return) :-
    literalsToString(Literal,Expression),
    get_possibilities(Expression,Interpretations),
    get_propositions(Expression,Propositions),
    mount_table(Interpretations,Propositions,Literal,R1),
    Return = R1.

% expression('',proposition('','a'),'&',proposition('',b))
    



