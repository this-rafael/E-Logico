metodo(Parm1, Parm2, Return) :-
    (Parm1 > Parm2) ->      % se Parm1 maior que Parm2
        Return is Parm1
    ;(Parm1 =:= Parm2) ->   % else if parm1 == parm2
        Return is 10
    ; % else
        Return is Parm2.

metodo2(Parm1, Return) :-
    (Parm1 + 3  < 10) -> % if parm + 3 < 10
        (Parm1 =:= 0) -> % if parm == 0
            Return is 20
        ;   % else
            Return is 30
    ; % else
        Return is 40.

% ou
metodo1(Parm1, Parm2, Maior) :- (Parm > Parm2) -> Maior is Parm1 ; (Parm1 =:= Parm2) -> Maior is 10 
; Maior is Parm2.

metodo2(Parm1, Resposta) :- (Parm1 + 3  < 10) -> (Parm1 =:= 0) -> Resposta is 20 ; Resposta is 30 
; Resposta is 4.

