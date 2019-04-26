#include <iostream>

using namespace std;

/**
* Apresentação da Negação lógica.
*/
void resumoNegacao(){
	cout << "\n A Dupla Negacao afirma que se temos uma afirmacao verdadeira, logo, se negarmos a negacao dessa afirmacao teremos uma equivalencia com a afirmacao\n";
	cout << " Como regra de simplicacao, temos que ~(~P) = P\n";
	cout << " Quer saber mais sobre a Dupla Negacao?\n";
}

/**
* Complemento das informações sobre a Negação.
*/
void infoNegacao(){
	cout << "\n Na notacao simbolica temos:\n";
	cout << " P <--> ~(~P)";
	cout << "\n Exemplo de discurso:\n";
	cout << " P = Game of Thrones estreia hoje.\n";
	cout << " ~P = Game of Thrones NAO estreia hoje.\n";
	cout << " ~(~P) = Nao eh verdade que Game Of Thrones NAO estreia hoje.\n";

}

/**
* Apresentação da Conjunção Lógica
*/
void resumoConjucao(){
	cout << "\n A conjucao eh a combinacao de preposicoes que soh resultarah verdade se ambas as proposicoes forem verdadeiras.\n";
	cout << " Como regra de simplicacao, quando temos as preposicoes P, Q, podemos deduzir que  P ^ Q.\n";
	cout << " Quer saber mais sobre a conjuncao?\n";
}

/**
* Complemento das informações sobre a Conjunção.
*/
void infoConjucao(){
	cout << "\n Na notacao simbolica temos:\n";
	cout << " P ^ Q";
	cout << "\n Exemplo de discurso:\n";
	cout << " P = Estudei para a prova.\n";
	cout << " Q = Tirei uma nota boa\n";
	cout << " P ^ Q = Estudei para a prova E tirei uma nota boa\n";
	cout << " Em operacoes logicas, a conjuncao funciona como a multiplicacao, Exemplo:\n";
	cout << " 1 ^ 1 = 1    1 ^ 0 = 0    0 ^ 0 = 0\n";
}

/**
* Apresentação das adição lógica
*/
void resumoAdicao(){
	cout << "\n A adicao irah unir as preposicoes de maneira que se ao menos uma das preposicoes for verdadeira, o resultado serah verdadeiro.\n";
	cout << " Como regra de simplicacao, temos que ao possuirmos P, P v Q vai ser verdadeiro, assim como  Q v P.\n";
	cout << "\n Quer saber mais sobre a adicao?\n";
}

/**
* Complemento das informações na adição lógica
*/
void infoAdicao(){
	cout << "\n Na notacao simbolica temos:\n";
	cout << " P v Q";
	cout << "\n Exemplo de discurso:\n";
	cout << " P = Irei ao Sao Joao de Campina\n";
	cout << " Q = Irei a praia em Joao Pessoa\n";
	cout << " P v Q = Irei ao Sao Joao de Campina OU a praia em Joao Pessoa\n";
	cout << " Em operacoes, a adicao conservarah a veracidade, ao menos que nao exista. Exemplo:\n";
	cout << " 1 v 1 = 1    1 v 0 = 1    0 v 0 = 0\n";
}

/**
* Apresentação da introdução por equivalência.
*/
void resumoIntroEquivalencia(){
	cout << "\n Atraves de implicacoes distintas com as mesmas proposicoes, podemos deduzir uma bicondicional entre as proposicoes.\n";
	cout << " No caso, temos P --> Q, Q --> P, logo podemos deduzir P <--> Q.\n";
}

/**
* Apresentação da eliminação por equivalência.
*/
void resumoElimEquivalencia(){
	cout << "\n Através de uma bicondicional, podemos deduzir que existe uma implicação em ambos os termos.\n";
	cout << " No caso, temos P <--> Q, podemos deduzir P --> Q, ou Q --> P\n";
}

/**
* Apresentação da regra Modus Ponens.
*/
void resumoModusPonens(){
	cout << "\n Através de uma implicação, caso a implicante seja confirmada, temos a dedução da implicância.\n";
	cout << " Seja P --> Q, tendo P confirmado, podemos deduzir Q.\n";
	cout << "\n Quer saber mais sobre Modus Ponnens?\n";
}

/**
* Complemento da informação Modus Ponens
*/
void infoModusPonens(){
	cout << "\n As vezes chamada de regra do desapego, Modus Ponens é utilizado para a retirada da implicação, encurtando a fórmula lógica.";
	cout << "\n Na notação simbólica temos:\n";
	cout << " P, P --> Q. logo Q\n";
	cout << "\n Exemplo de discurso:\n";
	cout << " P --> Q = Se tocar O vento eu desisto do show\n";
	cout << " P = Tocou o vento\n";
	cout << " Q = Eu desisti do show\n";
	cout << " Podemos deduzir Q pois em uma implicação, só existe uma maneira de se existir falsidade, sendo V --> F. Assim numa implicação quando sabemos que existe veracidade na implicante, dependemos apenas da implicância.\n";
}

/**
* Apresentação da regra de Modus Tollens.
*/
void resumoModusTollens(){
	cout << "\n A partir de uma implicação, quando temos a negação do implicante, podemos deduzir a negação da implicante.\n";
	cout << " Assim P --> Q, ~Q, temos ~P\n";
	cout << "\n Quer saber mais sobre Modus Tollens?\n";
}

/**
* Complemento da Informação da regra Modus Tollens
*/
void infoModusTollens(){
	cout << "\n Também chamado de Prova Indireta, ou negação consequente, Modus Tollens é utilizado para a retirada da implicação, encurtando a fórmula lógica.";
	cout << "\n Exemplo de discurso:\n";
	cout << " P --> Q = Se tiver ingressos, então irei assistir Vingadores Ultimato.\n";
	cout << " ~Q = Não irei assistir Vingadores Ultimato.\n";
	cout << " ~P = Não tinha ingressos\n";
	cout << " Podemos deduzir ~P pois em uma implicação quando temos a negação da implicÂncia, só temos a corretude no caso de termos a negação do implicante. assim no caso F --> V, F --> V continuam corretos\n";
}

/**
* Apresentação do silogismo hipotético.
*/
void resumoHipotetico(){
	cout << "\n A partir de duas implicações onde a implicância de uma seja o implicante da segunda implicação, podemos deduzir que o implicante da primeira implica a implicância da segunda\n";
	cout << " Seja P --> Q, Q --> R então P --> R\n";
	cout << "\n Quer saber mais sobre Silogismo Hipotético?\n";

}

/**
* Complemento de informações do silogismo hipotético.
*/
void infoHipotetico(){
	cout << "\n Utilizado na teoria da consequência, O silogismo hipotético não retira a implicação, apenas diminui o numero de termos e implicações presentes na fórmula.\n";
	cout << "\n Exemplo de discurso:\n";
	cout << " P --> Q = Se sou aluno de Computação, então estudo programação.\n";
	cout << " Q --> R = Se estudo programação, então sei programar.\n";
	cout << " P --> R = Se sou aluno de Computação, então sei programar\n";
}

/**
* Apresentação do silogismo disjuntivo.
*/
void resumoDisjuntivo(){
	cout << "\n A partir de uma operação de disjunção quando temos a negação de um termo, podemos deduzir o termo restante.\n";
	cout << " Seja  P v Q. tendo  ~P, logo temos Q\n";
	cout << "\n Quer saber mais sobre Silogismo Disjuntivo?\n";
}

/**
* Complemento de informações do silogismo lógico.
*/
void infoDisjuntivo(){
	cout << "\n Conhecido historicamente como Modus Tollendo Ponens, o silogismo disjuntivo é indicado apenas para a simplificação de termos.\n";
	cout << "\n Exemplo de discurso:\n";
	cout << " P v Q = Eu viajo de férias ou faço cursinho de inglês.\n";
	cout << " ~P = não viajo de férias.\n";
	cout << " Q = Então faço cursinho de inglês.\n";
}

/**
* Apresentação do dilema construtivo.
*/
void resumoDilemaConstrutivo(){
	cout << "\n A partir de duas implicações totalmente distintas, se possuímos uma disjunção entre o implicante da primeira com o implicante da segunda implicação, podemos deduzir uma disjunção entre a implicância da primeira com a implicância da segunda disjunção.\n";
	cout << " Sendo assim P --> Q, R --> S. Tendo P v R, podemos deduzir Q v S\n";
	cout << "\n Quer saber mais sobre Silogismo Disjuntivo?\n";
}

/**
* Complemento de informações do dilema construtivo.
*/
void infoDilemaConstrutivo(){
	cout << "\n Também conhecido como dilema de transferência, serve para a simplificação de duas implicações resultando em uma disjunção\n";
	cout << "\n Exemplo de discurso:\n";
	cout << " P --> Q = Se eu me formei, então eu tenho emprego.\n";
	cout << " R --> S = Se eu tenho dinheiro, então tenho um carro.\n";
	cout << " P v R = Eu me formei ou tenho dinheiro.\n";
	cout << " Q v S = Eu tenho um emprego ou tenho um carro.\n";
}

/**
* Apresentação da regra de exportação.
*/
void resumoExportacao(){
	cout << "\n A partir de uma implicação, se o implicante for formado por uma conjunção, podemos deduzir uma implicação do primeiro termo da conjunção implicando numa implicação do segundo termo da conjunção implicando na implicância original.\n";
	cout << " Sendo (P ^ Q) --> S, temos P --> (Q --> S).\n";
}

/**
* Apresentação da opções do menu regras.
*/
void menuRegras(){
	cout << "\n\t\t --- Lista de Regras --- \n";
	cout << " \t1 - Negação;\n";
	cout << " \t2 - Conjunção;\n";
	cout << " \t3 - Adição;\n";
	cout << " \t4 - Introdução da Equivalência;\n";
	cout << " \t5 - Eliminação da Equivalência;\n";
	cout << " \t6 - Modus Ponens;\n";
	cout << " \t7 - Modus Tollens;\n";
	cout << " \t8 - Silogismo Hipotético;\n";
	cout << " \t9 - Silogismo Disjuntivo;\n";
	cout << " \t10 - Dilema Construtivo;\n";
	cout << " \t11 - Exportação;\n";
	cout << " \t0 - Voltar ao menu principal;\n\n";
	cout << " Digite a sua opção!\n";
}

/**
* Método de captação de entrada das respostas.
*/
bool entradaResposta(){
	string resposta;
	cin.ignore();
	cout << " >>> ";
	getline(cin, resposta);

    return resposta == "sim";
}

/**
* Selecionador de opções do menu de regras.
*/
void opcoesRegras(int opc){
	switch(opc){
		case(1):
			resumoNegacao();
			if (entradaResposta()) {
				infoNegacao();
			}
			break;

		case(2):
			resumoConjucao();
			if (entradaResposta()) {
				infoConjucao();
			}
			break;

		case(3):
			resumoAdicao();
			if (entradaResposta()) {
				infoAdicao();
			}
			break;

		case(4):
			resumoIntroEquivalencia();
			break;

		case(5):
			resumoElimEquivalencia();
			break;

		case(6):
			resumoModusPonens();
			if (entradaResposta()) {
				infoModusPonens();
			}
			break;

		case(7):
			resumoModusTollens();
			if (entradaResposta()) {
				infoModusTollens();
			}
			break;

		case(8):
			resumoHipotetico();
			if (entradaResposta()) {
				infoHipotetico();
			}
			break;

		case(9):
			resumoDisjuntivo();
			if (entradaResposta()) {
				infoDisjuntivo();
			}
			break;

		case(10):
			resumoDilemaConstrutivo();
			if (entradaResposta()) {
				infoDilemaConstrutivo();
			}
			break;

		case(11):
			resumoExportacao();
			break;

		case(0):
			cout << " Ciao!\n";
			break;
		default:
			cout << " Desculpa, não entendi. Pode repetir?";


		}

}

/**
* Método de execução dos métodos de regras, destinado para ser chamado no Main.
*/
void execRegras(){
	int opc;

	while(true){
		menuRegras();
		cout << " >>> ";
		cin >> opc;
		opcoesRegras(opc);

		if (opc == 0) break;
	}

}
