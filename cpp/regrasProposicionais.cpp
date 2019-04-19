#include<iostream>
using namespace std;

/**
Apresentação da Negação lógica.
*/
void resumoNegacao(){
	cout << "\n A Dupla Negação afirma que se temos uma afirmação verdadeira, logo, se negarmos a negação dessa afirmação teremos uma equivalência com a afirmação\n";
	cout << " Como regra de simplicação, temos que ~(~P) = P\n";
	cout << "Que saber mais sobre a Dupla Negação?\n";
}

/**
Complemento das informações sobre a Negação.
*/
void infoNegacao(){
	cout << "\n Na notação simbólica temos:\n";
	cout << " P <--> ~(~P)";
	cout << "\n Exemplo de discurso:\n";
	cout << " P = Game of Thrones estreia hoje.\n";
	cout << " ~P = Game of Thrones NÃO estreia hoje.\n";
	cout << " ~(~P) = Não é verdade que Game Of Thrones estreia hoje.\n";
	
}

/**
Apresentação da Conjunção Lógica
*/
void resumoConjucao(){
	cout << "\n A conjução é a combinação de preposições que só resultará verdade se ambas as proposições forem verdade.\n";
	cout << " Como regra de simplicação, quando temos as preposições P , Q, podemos deduzir que  P ^ Q\n";
	cout << "Quer saber mais sobre a conjunção?\n";
}

/**
Complemento das informações sobre a Conjunção.
*/
void infoConjucao(){
	cout << "\n Na notação simbólica temos:\n";
	cout << " P ^ Q";
	cout << "\n Exemplo de discurso:\n";
	cout << " P = Estudei para a prova.\n";
	cout << " Q = Tirei uma nota boa\n";
	cout << " P ^ Q = Estudei para a prova E tirei uma nota boa\n";
	cout << " Em operações lógicas, a conjunção funciona como a multiplicação, Exemplo:\n";
	cout << " 1 ^ 1 = 1    1 ^ 0 = 0    0 ^ 0 = 0\n";
}

/**
Apresentação das adição lógica
*/
void resumoAdicao(){
	cout << "\n A adição irá unir as preposições de maneira que se ao menos uma das preposições for verdadeira, o resultado será verdadeiro.\n";
	cout << "Como regra de simplicação, temos que ao possuírmos P , P v Q vai ser verdadeiro, assim como  Q v P.\n";
	cout << "\n Quer saber mais sobre a adição?\n";
}

/**
complemento das informações na adição lógica 
*/
void infoAdicao(){
	cout << "\n Na notação simbólica temos:\n";
	cout << " P v Q";
	cout << "\n Exemplo de discurso:\n";
	cout << " P = Irei ao São João de Campina\n";
	cout << " Q = Irei a praia em João Pessoa\n";
	cout << " P v Q = Irei ao São João de Campina OU a praia em João Pessoa\n";
	cout << " Em operações, a adição conservará a veracidade, ao menos que não exista. Exemplo:\n";
	cout << " 1 v 1 = 1    1 v 0 = 1    0 v 0 = 0\n";
}

/**
Apresentação da introdução por equivalência.
*/
void resumoIntroEquivalencia(){
	cout <<"\n Através de implicações distintas com as mesmas proposições, podemos deduzir uma bicondicional entre as proposições\n";
	cout <<" No caso, temos P --> Q, Q --> P, logo podemos deduzir P <--> Q\n";
}

/**
Apresentação da eliminação por equivalência.
*/
void resumoElimEquivalencia(){
	cout << "\n Através de uma bicondicional, podemos deduzir que existe uma implicação em ambos os termos.\n";
	cout << " No caso, temos P <--> Q, podemos deduzir P --> Q, ou Q --> P\n";
}

/**
Apresentação da regra Modus Ponens.
*/
void resumoModusPonens(){
	cout << "\n Através de uma implicação, caso a implicante seja confirmada, temos a dedução da implicância.\n";
	cout << " Seja P --> Q, tendo P confirmado, podemos deduzir Q.\n";
	cout << "\n Quer saber mais sobre Modus Ponnens?\n";
}

/**
Complemento da informação Modus Ponens
*/
void infoModusPonens(){
	cout << "\n As vezes chamada de regra do desapego, Modus Ponens é utilizado para a retirada da implicação, encurtando a fórmula lógica.";
	cout << "\n Na notação simbólica temos:\n";
	cout << " P, P --> Q. logo Q\n";
	cout << "\n Exemplo de discurso:\n";
	cout << " P --> Q = Se tocar O vento eu desisto do show\n";
	cout << " P = Tocou o vento\n";
	cout << " Q = Eu desisti do show\n";
	cout << " Podemos deduzir Q pois em uma implicação, só existe uma maneira de se existir falsidade, sendo V --> F. Assim numa implicação quando sabemos que existe veracidade na implicante, dependemos apenas da implicância\n";
}

/**
Apresentação da regra de Modus Tollens.
*/
void resumoModusTollens(){
	cout << "\n A partir de uma implicação, quando temos a negação do implicante, podemos deduzir a negação da implicante.\n";
	cout << " Assim P --> Q, ~Q, temos ~P\n";
	cout << "\n Quer saber mais sobre Modus Tollens?\n";
}

/**
Complemento da Informação da regra Modus Tollens
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
Apresentação do silogismo hipotético.
*/
void resumoHipotetico(){
	cout << "\n A partir de duas implicações onde a implicância de uma seja o implicante da segunda implicação, podemos deduzir que o implicante da primeira implica a implicância da segunda\n";
	cout << " Seja P --> Q, Q --> R então P --> R\n";
	cout << "\n Quer saber mais sobre Silogismo Hipotético?\n";

}

/**
Complemento de informações do silogismo hipotético.
*/
void infoHipotetico(){
	cout << "\n Utilizado na teoria da consequência, O silogismo hipotético não retira a implicação, apenas diminui o numero de termos e implicações presentes na fórmula.\n";
	cout << "\n Exemplo de discurso:\n";
	cout << " P --> Q = Se sou aluno de Computação, então estudo programação.\n";
	cout << " Q --> R = Se estudo programação, então sei programar.\n";
	cout << " P --> R = Se sou aluno de Computação, então sei programar\n";
}

/**
Apresentação do silogismo disjuntivo.
*/
void resumoDisjuntivo(){
	cout << "\n A partir de uma operação de disjunção quando temos a negação de um termo, podemos deduzir o termo restante.\n";
	cout << " Seja  P v Q. tendo  ~P, logo temos Q\n";
	cout << "\n Quer saber mais sobre Silogismo Disjuntivo?\n";
}

/**
Complemento de informações do silogismo lógico.
*/
void infoDisjuntivo(){
	cout << "\n Conhecido historicamente como Modus Tollendo Ponens, o silogismo disjuntivo é indicado apenas para a simplificação de termos.\n";
	cout << "\n Exemplo de discurso:\n";
	cout << " P v Q = Eu viajo de férias ou faço cursinho de inglês.\n";
	cout << " ~P = não viajo de férias.\n";
	cout << " Q = Então faço cursinho de inglês.\n";
}

/**
Apresentação do dilema construtivo.
*/
void resumoDilemaConstrutivo(){
	cout << "\n A partir de duas implicações totalmente distintas, se possuímos uma disjunção entre o implicante da primeira com o implicante da segunda implicação, podemos deduzir uma disjunção entre a implicância da primeira com a implicância da segunda disjunção.\n";
	cout << " Sendo assim P --> Q, R --> S. Tendo P v R, podemos deduzir Q v S\n";
	cout << "\n Quer saber mais sobre Silogismo Disjuntivo?\n";
}

/**
Complemento de informações do dilema construtivo.
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
Apresentação da regra de exportação.
*/
void resumoExportacao(){
	cout << "\n A partir de uma implicação, se o implicante for formado por uma conjunção, podemos deduzir uma implicação do primeiro termo da conjunção implicando numa implicação do segundo termo da conjunção implicando na implicância original.\n";
	cout << " Sendo (P ^ Q) --> S, temos P --> (Q --> S).\n";
}

/**
Apresentação da opções do menu regras.
*/
void menuRegras(){
	cout << "\n --- Lista de Regras --- \n";
	cout << " 1 - Negação\n";
	cout << " 2 - Conjunção\n";
	cout << " 3 - Adição\n";
	cout << " 4 - Introdução da Equivalência\n";
	cout << " 5 - Eliminação da Equivalência\n";
	cout << " 6 - Modus Ponens\n";
	cout << " 7 - Modus Tollens\n";
	cout << " 8 - Silogismo Hipotético\n";
	cout << " 9 - Silogismo Disjuntivo\n";
	cout << " 10 - Dilema Construtivo\n";
	cout << " 11 - Exportação\n";
	cout << " 0 - Voltar ao menu principal\n\n";
	cout << "Digite a sua opção!\n";
}

bool entradaResposta(){
	string resposta;
	cin.ignore();
	getline(cin, resposta);
	
	if(resposta == "sim") return true;
	return false;
}



/**
Selecionador de opções do menu de regras.
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
			cout << "Ciao!\n";
			break;
		default:
			cout << "Desculpa, não entendi. Pode repetir?";
			
			
		}
	
}

void execRegras(){
	//chamando menu
	int opc;
	
	while(true){
		menuRegras();
		cin >> opc;
		opcoesRegras(opc);
		
		if (opc == 0) break;
	}
}
