aux_fibonacci(0, 1) :- !.
aux_fibonacci(1, 1) :- !.
aux_fibonacci(N, Result) :- 
    N1 is N - 1, 
    N2 is N - 2, 
    aux_fibonacci(N1, Result1),
    aux_fibonacci(N2, Result2), 
    Result is (Result1 + Result2).

aux_factorial(0, Return) :- Return is 1.
aux_factorial(N, Return) :- 
    aux_factorial(n-1, OtherReturn),
    Return is (N * OtherReturn).
