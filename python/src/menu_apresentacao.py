#coding:utf-8

def apresentacaoInicial():
	print ("Olá, Bem vindo ao Aprendendo? Lógico!\n")
	print ("Programa Interativo de Aprendizagem e auxilio à assuntos Lógicos\n");


def menuOpcoes():
	print ("MENU:\n");
	print (" 1 - Aprendendo a formular uma Tabela-Verdade!\n");
	print (" 2 - Aprendendo a converter (Bin - Dec) <---> (Dec - Bin)!\n");
	print (" 3 - Aprendendo a simplificar expressões proposicionais!\n");
	print (" 4 - Aprendendo as regras básicas de proposições\n");
	print (" 0 - SAIR\n\n");
	print (" Digite a sua opção !\n");


def resumoTabela():
    print ("\nA Tabela Verdade é um tipo lógico de tabela utilizado em lógica para considerar a" 
    +"validade de uma fórmula ou conferir que uma combinação está correta.\n");
    print ("Quer saber como se constrói uma Tabela Verdade?\n");

def infoTabela():
    print ("\nCOMO CONSTRUIR UMA TABELA?\n\n");
    print (" a) O número de linhas contidas em uma Tabela Verdade vai ser calculada por Linhas = 2^n,"
    + " onde (n) é a quantidade de preposições.\n ");
    print (" b) Incluimos nas linhas valores correspondentes em binário de (0 ... [2^n - 1]). Exemplo: "
    + "Com uma tabela de 2 preposições teremos 4 linhas, em linha[1] = 0 0, 0 em binário com 2 casas decimais."
    +" na linha[2] = 0 1, 1 em binário com 2 casas. linha[3] = 1 0 , linha[4] = 1 1 \n");
    print (" c) Enquanto ao número de colunas, vai depender de você, mas temos que ter obrigatoriamente n "
    +"colunas + 1. Onde n é definido como o número de preposições e 1 coluna de resposta.\n"); 
    print (" d) Na coluna de resposta, temos o resultado das operações. Cada linha com seu respectivo bit resposta\n");


def resumoConversor():
    print ("\nO conversor faz a tradução entre números de bases diferentes\n");
    print ("Convertendo Bin --> Dec, teremos a conversão de Binário (base 2) para Decimal (base 10)\n");
    print ("Convertendo Dec --> Bin, teremos a conversão de Decimal (base 10) para Binário (base 2)\n");

def infoConversor():
    print ("\nCOMO CONVERTER UM NÚMERO?\n\n");
    print (" 1) De Binário para Décimal\n");
    print ("   a) Posicionalmente, o número binário tem seu bit mais considerativo da esquerda para direita."
    +" O último bit valerá menos que o primeiro!\n")
    print ("   b) Considerando o valor de cada bit, temos que o cada bit valerá 2^n onde n é a localidade da"
    +" direita para esquerda, contada a partir do zero. Exemplo: 0 0 1 , o bit 1 irá valer 2^0. 1 0 0 , o bit 1 irá valer 2^2\n");
    print ("   c) O resultado do número convertido será a soma do valor de cada bit levando em conta sua "
    + "considerabilidade. Exemplo: 1 0 1 1, 2^0 + 2^1 + 2^3 = 1 + 2 + 8 = 11 \n\n");
    print (" 2) De Decimal para Binário\n");
    print ("   a) O número em decimal será dividido pela base binário, ou seja 2, repetidas vezes até que se sobre 1 ou 0\n");
    print ("   b) O importante da divisão será o resto da divisão e seu resultado final. Exemplo: o numero 2 em decimal,"
    +" 2 / 2 = 1 e 2 % 2 = 0\n");
    print ("   c) Chegando a ultima divisão com resto inteiro possivel, temos que reunir os restos das divisões com o ultimo "
    + "resultado possivel. Exemplo: 4, 4 % 2 = 0, 4/2 = 2, como 2 ainda pode ser divisivel por 2, 2 % 2 = 0 e 2 / 2 = 1. Juntando "
    + "os restos com o ultimo resultado, temos:  0 0 1\n");
    print ("   d) Com o resultado da divisão por 2 e seus restos concatenado, temos que apenas inverter a ordem. Exemplo anterior"
    +" 0 0 1, invertemos 1 0 0, que equivale a 4\n\n");


def resumoExpressoes():
    print ("\nExpressões Proposicionais podem ser gigantes. No entanto, Existem várias regras de simplificações que podem transformar "
    +"expressões gigantescas em expressões simples com a mesma equivalência lógica!\n");

def infoExpressoes():
    print("\nCOMO SIMPLIFICAR UMA EXPRESSÃO PROPOSICIONAL?\n\n");
    print(" a) Partimos da definição das proposições\n");
    print(" b) Assumimos uma regra que se encaixe com as proposições destinadas e aplicamos.\n");
    print(" c) Repetimos os passos podendo utilizar a mesma regra ou uma regra diferente, até chegarmos a uma expressão que não aceite"
    +" mais nenhuma regra. Em tese será a expressão simplificada\n");

def resumoRegras():
	print("\nRegras para simplificações de expressões lógicas\n");
	print( "Aqui vamos apresentar algumas regras para as simplificações de expressões lógicas complexas em expressões simples!\n");


def resumoOpcoes(opc):
	if(opc == 1):
		resumoTabela();
	elif(opc == 2):
		resumoConversor();
	elif(opc == 3):
		resumoExpressoes();
	elif(opc == 4):
		resumoRegras();
	elif(opc == 0):
		print("ISSO É TUDO PESSOAL !!!\N ");
	else:   
		print("Desculpe? pode repetir?\n");

