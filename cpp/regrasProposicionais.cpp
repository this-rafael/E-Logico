#include<iostream>
using namespace std;

void resumoNegacao(){
	cout << "\n A Dupla Negação afirma que se temos uma afirmação verdadeira, logo, se negarmos a negação dessa afirmação teremos uma equivalência com a afirmação\n";
	cout << " Como regra de simplicação, temos que ~(~P) = P\n";
	cout << "Que saber mais sobre a Dupla Negação?\n";
}

void infoNegacao(){
	cout << "\n Na notação simbólica temos:\n";
	cout << " P <--> ~(~P)";
	cout << "\n Exemplo de discurso:\n";
	cout << " P = Game of Thrones estreia hoje.\n";
	cout << " ~P = Game of Thrones NÃO estreia hoje.\n";
	cout << " ~(~P) = Não é verdade que Game Of Thrones estreia hoje.\n";
	
}

void resumoConjucao(){
	cout << "\n A conjução é a combinação de preposições que só resultará verdade se ambas as proposições forem verdade.\n";
	cout << " Como regra de simplicação, quando temos as preposições P , Q, podemos deduzir que  P ^ Q\n";
	cout << "Quer saber mais sobre a conjunção?\n";
}
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

void resumoAdicao(){
	cout << "\n A adição irá unir as preposições de maneira que se ao menos uma das preposições for verdadeira, o resultado será verdadeiro.\n";
	cout << "Como regra de simplicação, temos que ao possuírmos P , P v Q vai ser verdadeiro, assim como  Q v P.\n";
	cout << "\n Quer saber mais sobre a adição?\n";
}
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
void resumoIntroEquivalencia(){
	cout <<"\n Através de implicações distintaas com as mesmas proposições, podemos deduzir uma bicondicional entre as proposições\n";
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
	cout << " 0 - SAIR\n\n";
	cout << "Digite a sua opção!\n";
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

