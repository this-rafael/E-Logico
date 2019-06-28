aux_getIndexToArray(0, [Head|_], Head).
aux_getIndexToArray(X, [_|Tail], Element) :- 
    K is X - 1, 
    aux_getIndexToArray(K, Tail, Element).

aux_isEmptyArray([]) :- true.