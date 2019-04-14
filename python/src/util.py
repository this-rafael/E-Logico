from python.src.Literal import Literal

def removeEspacos(expressao: str):
    return expressao.replace(" ", "")

def eOperadorUnario(valor: str):
    return valor == "~"

def eOperadorBinario(valor: str):
    return valor in ["*", "|", "&", "#"]

def recebeLiteral(literal: Literal):
    print('Um Literal é uma expressão booleana...')
    print('É composto por uma proposição ou expressão, um operador binario, e outra proposição ou expressão\n')
    return  _recebeLiteral(literal)

def _recebeLiteral(literal: Literal):

    informaUsuario("primeiro")

    valor: str = str(input())
    if valor == "sim":
        literal.setPrimeiroValor( _recebeLiteral(Literal()))
    else:
        literal.setPrimeiroValor(valor)

    print("Digite o operador...\n")
    valor = str(input())
    literal.setOperadorBinario(valor)

    informaUsuario("segundo")

    valor: str = str(input())
    if valor == "sim":
        literal.setSegundoValor(_recebeLiteral(Literal()))
    else:
        literal.setSegundoValor(valor)

    print("deseja negar sua expressão? (S-sim, N-não)")
    if str(input()) == "sim":
            literal.operadorUnario = "~"
    print("Concluido, literal inserido ;-)")
    return literal

def informaUsuario(valor):
    print(informacaoSobreExpressao().format(valor))
    print('Se desejar incluir uma expressão tecle "sim"\n')

def informacaoSobreExpressao():
    return "Digite sua {} proposição ou sua expressão...\n"

l = recebeLiteral(Literal())