#include<iostream>
#include <stdlib.h>
#include <string>
#include <string.h>
#include <vector>
#include <sstream>
#include <cmath>

#include "simplificadorLogico.cpp"
#include "TableGenerator.cpp"
#include "Literal.cpp"
#include "Literal.h"
#include "menuApresentacao.cpp"
#include "regrasProposicionais.cpp"
#include "binaryToDecimal.cpp"
#include "decimalToBinary.cpp"
#include "FloatToBinIEEE754.cpp"
#include "binIEEE754ToFloat.cpp"

using namespace std;

/**
* Método de chamada das funções principais de execução de cada arquivo.
*/
void execOpcoes(int opc){
    switch(opc){
        case(1):
            resumoTabela();
            // execTabela();
            break;
        case(2):
            resumoConversor();
            // execConversor();
            break;
        case(3):
            resumoExpressoes();
            execExpressoes();
            break;
        case(4):
            resumoRegras();
            execRegras();
            break;
        case(0):
            cout << "ISSO É TUDO PESSOAL !!!\n ";
            break;
        default:
            cout << "Desculpe? pode repetir?\n";
      }

}

/**
* Método de execução e laço da chamada principal dos métodos executáveis.
*/
void execPrincipal(){
    int opc;
    apresentacaoInicial();
    while (true){
        menuOpcoes();
        cout << " >> ";
        cin >> opc;
        execOpcoes(opc);
        system("CLS");
        
        if (opc == 0) break;
        
    }
}

/**
* Método main do programa.
*/
int main(){
    main_de_simplicadores();
	// execPrincipal();
	return 0;
}

