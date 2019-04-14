class Literal:  # isso vai virar uma struct gerenica

    def __init__(self):
        self.operadorUnario = None # pode ser ~ ou ""
        self.primeiroValor = None # pode ser dos tipos String ou Literal
        self.operadorBinario = None # pode ser String
        self.segundoValor = None # pode ser dos tipos String ou Literal

    def setPrimeiroValor(self, valor):
        if isinstance(valor, str) and "~" in valor:
            self.primeiroValor = Literal()
            self.primeiroValor.operadorUnario = valor[0]
            self.primeiroValor.primeiroValor = valor[1]
            self.primeiroValor.operadorBinario = ""
            self.primeiroValor.segundoValor = ""
        else:
            self.primeiroValor = valor

    def setOperadorBinario(self, operador):
        self.operadorBinario = operador

    def setOperadorUnario(self, operador=""):
        self.operadorUnario = operador

    def setSegundoValor(self, valor):
        if isinstance(valor, str) and "~" in valor:
            self.operadorUnario = valor[0]
            self.segundoValor = valor[1]
        else:
            self.segundoValor = valor


    def __eq__(self, other):
        if type(self) != type(other):
            return False
        else:
            validaocaoDoOperadorUnario = self.verificaOperadorUnario(self.operadorUnario, other.operadorUnario)
            validacaDoPrimeiroElemento = self.verificaPrimeiroElemento(self.primeiroValor, other.primeiroValor)
            validaocaoDoOperadorBinario = self.verificaOperadorBinario(self.operadorBinario, other.operadorBinario)
            validacaDoSegundoElemento = self.verificaSegundoElemento(self.segundoValor, other.segundoValor)
            return validaocaoDoOperadorUnario and validacaDoPrimeiroElemento and validaocaoDoOperadorBinario and validacaDoSegundoElemento

    def verificaOperadorBinario(self, operador1, operador2):
        return operador1 == operador2

    def verificaPrimeiroElemento(self, primeiroValor1, primeiroValor2):
        if type(primeiroValor1) != type(primeiroValor2):
            return False
        else:
            if isinstance(primeiroValor1, str):
                return primeiroValor1 == primeiroValor2
            elif isinstance(primeiroValor1, Literal): # duplicado para que eu saiba no debug em qual dos casos entrou
                return primeiroValor1 == primeiroValor2
            else:
                return False

    def verificaSegundoElemento(self, segundoValor1, segundoValor2):
        if type(segundoValor1) != type(segundoValor2):
            return False
        else:
            if isinstance(segundoValor1, str):
                return segundoValor1 == segundoValor2
            elif isinstance(segundoValor1, Literal): # duplicado para que eu saiba no debug em qual dos casos entrou
                return segundoValor1 == segundoValor2
            else:
                return False

    def verificaOperadorUnario(self, operadorUnario1, operadorUnario2):
        return operadorUnario1 == operadorUnario2

    #toString da estrutura
    def __str__(self):
        op1 = self._operadorUnarioToString()
        v1 = self._primeiroValorToString()
        op2 = self._operadorBinarioToString()
        v2 = self._segundoValorToString()
        return op1 + "(" + v1 + op2 + v2 + ")" if  self.operadorBinario != "" and self.segundoValor != "" else op1 + v1

    def _primeiroValorToString(self):
        if isinstance(self.primeiroValor, str):
            return self.primeiroValor
        else: # se não for string é do tipo literal
            return "(" + str(self.primeiroValor) + ")"

    def _segundoValorToString(self):
        if isinstance(self.segundoValor, str):
            return self.segundoValor
        else: # se não for string é do tipo literal
            return " (" + str(self.segundoValor) + ") "

    def _operadorUnarioToString(self):
        return " {op} ".format(op=self.operadorUnario)

    def _operadorBinarioToString(self):
        return " {op} ".format(op=self.operadorBinario)

