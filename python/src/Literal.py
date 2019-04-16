class Literal:  # isso vai virar uma struct gerenica

    def __init__(self):
        """
            Define o padrao dos atributos das struct como string vazia
        """
        self.operadorUnario = "" # pode ser ~ ou ""
        self.primeiroValor = "" # pode ser dos tipos String ou Literal
        self.operadorBinario = "" # pode ser String
        self.segundoValor = "" # pode ser dos tipos String ou Literal

    def setOperadorBinario(self, operador: str):
        """
        Configura o operador binario
        :param operador:
        :return: None
        """
        self.operadorBinario = operador

    def setOperadorUnario(self, operador=""):
        """
        Configura o operador binario
        :param operador: str
        :return: None
        """
        self.operadorUnario = operador

    def setPrimeiroValor(self, valor):
        """
        Metodo que configura o primeiro valor:
        Comporta-se de duas formas:
        1- Caso o valor passado seja uma string que contenha o operador unario da negação
        o codigo interpola automaticamente que deseja-se criar um novo literal. (~ p)
        2- Caso seja uma str que não contenha o operador ou um Literal, ele apenas adiciona o valor passado
        no atributo primeiroValor
        :param valor: pode ser um str ou um literal
        :return: None
        """
        if isinstance(valor, str) and "~" in valor:
            self.primeiroValor = Literal()
            self.primeiroValor.operadorUnario = valor[0]
            self.primeiroValor.primeiroValor = valor[1]
            self.primeiroValor.operadorBinario = ""
            self.primeiroValor.segundoValor = ""
        else:
            self.primeiroValor = valor

    def setSegundoValor(self, valor):
        """
                Metodo que configura o primeiro valor:
                Comporta-se de duas formas:
                1- Caso o valor passado seja uma string que contenha o operador unario da negação
                o codigo interpola automaticamente que deseja-se criar um novo literal. (~ p)
                2- Caso seja uma str que não contenha o operador ou um Literal, ele apenas adiciona o valor passado
                no atributo segundoValor
                :param valor: pode ser um str ou um literal
                :return: None
        """
        if isinstance(valor, str) and "~" in valor:
            self.primeiroValor = Literal()
            self.segundoValor.operadorUnario = valor[0]
            self.segundoValor.primeiroValor = valor[1]
            self.segundoValor.operadorBinario = ""
            self.segundoValor.segundoValor = ""
        else:
            self.segundoValor = valor


    def __eq__(self, other):
        """
        Verifica se dois literais são iguais, para isso as codições devem ser atendidas:
            1- os tipos devem ser os mesmos
            2- e os atributos dos mesmos devem ser iguais
        :param other:
        :return:
        """
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

    def euSouUmaProposicaoNegada(self): # exemplo ~p ou ~q
       '''
       verifica se uma proposicao (literal) é uma proposicao atomica, expressao, ou uma proposicao Negada
       :return:  se for uma proposicao Negada
       '''
       if self.segundoValor == "" and self.operadorBinario == "":
           if self.operadorUnario == "~" and self.primeiroValor != "":
               return True
           else:
               return False
       else:
           return False



    def verificaPrimeiroElemento(self, primeiroValor1, primeiroValor2):
        """
        verifica se o primeiroValor de dois literais sao iguais
        :param primeiroValor1: Literal ou str
        :param primeiroValor2: Literal ou str
        :return: bool
        """
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
        """
                verifica se o segundoValor de dois literais sao iguais
                :param segundoValor1: Literal ou str
                :param segundoValor2: Literal ou str
                :return: bool
                """
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
        """
        O metodo retorna uma toString dependendo do objeto, isso eh
        se ele for uma proposica negada ele vai retornar apenas a negação concatenado com a proposicao,
        se nao ele retornará operador unario + (proposicaoA + operador binario + proposicaoB)
        :param self: operador unario + (proposicaoA + operador binario + proposicaoB) orunario + proposicaoA
        :return:
        """
        op1 = self._operadorUnarioToString()
        v1 = self._primeiroValorToString()
        op2 = self._operadorBinarioToString()
        v2 = self._segundoValorToString()
        if not self.euSouUmaProposicaoNegada():
            return op1 + "(" + v1 + op2 + v2 + ")"
        else:
            return op1 + v1

    def _primeiroValorToString(self):
        if isinstance(self.primeiroValor, str):
            return self.primeiroValor
        else: # se não for string é do tipo literal
            return str(self.primeiroValor)

    def _segundoValorToString(self):
        if isinstance(self.segundoValor, str):
            return self.segundoValor
        else: # se não for string é do tipo literal
            return str(self.segundoValor)

    def _operadorUnarioToString(self):
        return " {op}".format(op=self.operadorUnario)

    def _operadorBinarioToString(self):
        return " {op} ".format(op=self.operadorBinario)


