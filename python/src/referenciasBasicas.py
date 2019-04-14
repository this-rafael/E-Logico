"""

~~p |= p dupla negação
p, q |= p^q conjução
p |= p v qualquerCoisa adição
p -> q, q -> p |= p <-> q introucao da equivalencia
p <-> q |= p -> q ^ q -> p eliminacao da equivalencia
p, p -> q |=  modus ponens
p ^ q |= p ou entao q Simplificacao
p v q, p -> r, q -> r |= r eliminacao da disjuncao
p -> q, ~q |= ~p modus tollens
p -> q ^ q -> r |= q -> r silogismo hipotetico
p v q, ~p |= q silogismo disjuntivo
p v q, p -> r, q -> s |= r v s dilema construtivo
(p ^ q) -> r |= p -> (q -> r) exportacao

"""


from python.src.Literal import Literal

#~~p |= p dupla negação
def duplaNegacao(literal: Literal):
    pass
