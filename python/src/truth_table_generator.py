from src.Literal import Literal

def procura_variaveis(literal):
    expressao = str(literal)
    caracteres_ignorados = ["(", ")", "~", "&", "|", "*", "#", " "]
    variaveis = {i for i in expressao if i not in caracteres_ignorados}
    return list(variaveis)

def completa_binario(binario, tamanho):
    contador = len(binario)
    while(contador < tamanho):
        binario = "0" + binario
        contador += 1
    return binario

def gerador_de_possibilidades(num):
    possibilidades = []
    repeticoes = 2 ** (num)
    for i in range(repeticoes):
        binario = bin(i)
        binario = binario.replace("0b", "")
        binario = completa_binario(binario, num)
        binario = list(binario)
        possibilidades.append(binario)
    return possibilidades

def resultado(expres,var,pos):
    if (expres.operadorBinario == ""):
        retorno = 0
        for i in range(len(var)):
            if (expres._primeiroValorToString() == var[i]):
                retorno = int(pos[i])
        if (expres.operadorUnario == "~"):
            retorno = int(not(retorno))
        return retorno

    if (expres.operadorBinario == "&"):
        retorno = resultado(expres.primeiroValor,var,pos) and resultado(expres.segundoValor,var,pos)
        if (expres.operadorUnario == "~"):
            retorno = int(not(retorno))
        return retorno


    if (expres.operadorBinario == "|"):
        retorno = resultado(expres.primeiroValor,var,pos) or resultado(expres.segundoValor,var,pos)
        if (expres.operadorUnario == "~"):
            retorno = int(not(retorno))
        return retorno

    if (expres.operadorBinario == "*"):
        retorno = not(resultado(expres.primeiroValor,var,pos)) or resultado(expres.segundoValor,var,pos)
        if (expres.operadorUnario == "~"):
            retorno = int(not(retorno))
        return retorno

    if (expres.operadorBinario == "#"):
        retorno = (resultado(expres.primeiroValor,var,pos) and resultado(expres.segundoValor,var,pos)) or (not(resultado(expres.primeiroValor,var,pos)) and not(resultado(expres.segundoValor,var,pos)))
        if (expres.operadorUnario == "~"):
            retorno = int(not(retorno))
        return retorno

def gerador_de_tabela_verdade(literal):
    variaveis = procura_variaveis(literal)
    num_variaveis = len(variaveis)
    possibilidades = gerador_de_possibilidades(num_variaveis)
    tabela = ""
    primeira_linha = ""
    for variavel in variaveis:
        primeira_linha += variavel + " "
    tabela += primeira_linha + "| result\n"

    for i in possibilidades:
        saida = resultado(literal, variaveis, i)
        linha = ""
        for j in range(len(variaveis)):
            linha += i[j] + " "
        linha += "| %d" % (saida)
        tabela += linha + "\n"
    return tabela


a = Literal()
a.operadorUnario = "~"
a.primeiroValor = "a"
a.operadorBinario = ""
a.segundoValor = ""
b = Literal()
b.operadorUnario = ""
b.primeiroValor = "b"
b.operadorBinario = ""
b.segundoValor = ""
ab = Literal()
ab.operadorUnario = ""
ab.primeiroValor = a
ab.operadorBinario = "&"
ab.segundoValor = b
c = Literal()
c.operadorUnario = ""
c.primeiroValor = "a"
c.operadorBinario = ""
c.segundoValor = ""
d = Literal()
d.operadorUnario = "~"
d.primeiroValor = "b"
d.operadorBinario = ""
d.segundoValor = ""
cd = Literal()
cd.operadorUnario = ""
cd.primeiroValor = c
cd.operadorBinario = "&"
cd.segundoValor = d
abcd = Literal()
abcd.operadorUnario = ""
abcd.primeiroValor = ab
abcd.operadorBinario = "|"
abcd.segundoValor = cd

print(gerador_de_tabela_verdade(abcd))