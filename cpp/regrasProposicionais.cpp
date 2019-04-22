#include<iostream>
using namespace std;

void resumoNegacao(){
	cout << "\n A Dupla Negacao afirma que se temos uma afirmacao verdadeira, logo, se negarmos a negacao dessa afirmacao teremos uma equivalencia com a afirmacao\n";
	cout << " Como regra de simplicacao, temos que ~(~P) = P\n";
	cout << "Que saber mais sobre a Dupla Negacao?\n";
}

void infoNegacao(){
	cout << "\n Na notacao simbolica temos:\n";
	cout << " P <--> ~(~P)";
	cout << "\n Exemplo de discurso:\n";
	cout << " P = Game of Thrones estreia hoje.\n";
	cout << " ~P = Game of Thrones NAO estreia hoje.\n";
	cout << " ~(~P) = Nao eh verdade que Game Of Thrones estreia hoje.\n";
	
}

void resumoConjucao(){
	cout << "\n A conjucao eh a combinacao de preposicoes que soh resultarah verdade se ambas as proposicoes forem verdade.\n";
	cout << " Como regra de simplicacao, quando temos as preposicoes P, Q, podemos deduzir que  P ^ Q\n";
	cout << "Quer saber mais sobre a conjuncao?\n";
}
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

void resumoAdicao(){
	cout << "\n A adicao irah unir as preposicoes de maneira que se ao menos uma das preposicoes for verdadeira, o resultado serah verdadeiro.\n";
	cout << "Como regra de simplicacao, temos que ao possuirmos P, P v Q vai ser verdadeiro, assim como  Q v P.\n";
	cout << "\n Quer saber mais sobre a adicao?\n";
}
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
void resumoIntroEquivalencia(){
	cout <<"\n Atraves de implicacoes distintas com as mesmas proposicoes, podemos deduzir uma bicondicional entre as proposicoes\n";
	cout <<" No caso, temos P --> Q, Q --> P, logo podemos deduzir P <--> Q\n";
}

void resumoElimEquivalencia(){

}
void resumoModusPonens(){

}
void resumoModusTollens(){

}
void resumoHipotetico(){

}
void resumoDisjuntivo(){

}
void resumoDilemaConstrutivo(){

}
void resumoExportacao(){

}

void menuRegras(){
	cout << "\n --- Lista de Regras --- \n";
	cout << " 1 - Negacao\n";
	cout << " 2 - Conjuncao\n";
	cout << " 3 - Adicao\n";
	cout << " 4 - Introducao da Equivalencia\n";
	cout << " 5 - Eliminacao da Equivalencia\n";
	cout << " 6 - Modus Ponens\n";
	cout << " 7 - Modus Tollens\n";
	cout << " 8 - Silogismo Hipotetico\n";
	cout << " 9 - Silogismo Disjuntivo\n";
	cout << " 10 - Dilema Construtivo\n";
	cout << " 11 - Exportacao\n";
	cout << " 0 - SAIR\n\n";
	cout << "Digite a sua opcao!\n";
}

void opcoesRegras(int opc){
	switch(opc){
		case(1):
			resumoNegacao();
			break;
		case(2):
			resumoConjucao();
			break;
		case(3):
			resumoAdicao();
			break;
		case(4):
			resumoIntroEquivalencia();
			break;
		case(5):
			resumoElimEquivalencia();
			break;
		case(6):
			resumoModusPonens();
			break;
		case(7):
			resumoModusTollens();
			break;
		case(8):
			resumoHipotetico();
			break;
		case(9):
			resumoDisjuntivo();
			break;
		case(10):
			resumoDilemaConstrutivo();
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
//apenas para teste

