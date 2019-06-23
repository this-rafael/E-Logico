decToBin(0,'0').
decToBin(1,'1').
decToBin(N,B):-
    N>1,
    X is N mod 2,
    Y is N//2,
    decToBin(Y,B1),
    atom_concat(B1, X, B).