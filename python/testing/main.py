from python.src.Literal import Literal


def LiteralTest():
    literalMaisInterno = Literal()  # p | q
    literalMaisInterno.setOperadorUnario("")
    literalMaisInterno.setPrimeiroValor("~p")
    literalMaisInterno.setOperadorBinario(" | ")
    literalMaisInterno.setSegundoValor("q")
    print(literalMaisInterno)
    literalMedio = Literal()  # r & (p | q)
    literalMedio.setOperadorUnario("")
    literalMedio.setPrimeiroValor("r")
    literalMedio.setOperadorBinario(" & ")
    literalMedio.setSegundoValor(literalMaisInterno)
    literalExterno = Literal()  # (p | q) | (r & (p | q))
    literalExterno.setOperadorUnario("")
    literalExterno.setPrimeiroValor(literalMedio)
    literalExterno.setOperadorBinario(" & ")
    literalExterno.setSegundoValor(literalMaisInterno)
    literalDeComparacao1 = Literal()
    literalDeComparacao1.setOperadorUnario("")
    literalDeComparacao1.setPrimeiroValor(literalMedio)
    literalDeComparacao1.setOperadorBinario(" | ")
    literalDeComparacao1.setSegundoValor(literalMaisInterno)
    literalDeComparacao2 = Literal()
    literalDeComparacao2.setOperadorUnario("")
    literalDeComparacao2.setPrimeiroValor(literalMedio)
    literalDeComparacao2.setOperadorBinario(" & ")
    literalDeComparacao2.setSegundoValor(literalMaisInterno)
    print(literalDeComparacao1 == literalDeComparacao2)  # deve retorna false
    print(literalExterno == literalDeComparacao1)  # deve retorna True
    print(literalMedio == literalMaisInterno)  # deve retorna false


LiteralTest()