% literal(Uop, Fvalue, Bop, Svalue).

insereOperadorUnario(Return) :-
    writeln("digite o operador unario: "),
    read_line_to_string(user_input, Return).

insereOperadorBinario(Return) :-
    writeln("digite o operador binario: "),
    read_line_to_string(user_input, Return).

insereValor(Return) :-
    writeln("digite o valor: "),
    read_line_to_string(user_input, Return).

criaLiteral(Return) :-
    writeln("deseja inserir uma propisicao: "),
    read_line_to_string(user_input, Option),
    (Option == "N") -> criarExpressao(Return) ; criaProposicao(Return). 

criaProposicao(Return) :-
    insereOperadorUnario(Uop),
    insereValor(Value),
    Return = literal(Uop, Value, "", "").

criarExpressao(Return) :- 
    insereOperadorUnario(Uop),
    criaLiteral(Fvalue),
    insereOperadorBinario(Bop),
    criaLiteral(Svalue),
    Return = literal(Uop, Fvalue, Bop, Svalue). 
    


:- initialization(main).

