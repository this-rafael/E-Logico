#include<iostream>
#include <stdlib.h>
#include <string>
#include <string.h>
#include <vector>
#include <sstream>
#include <cmath>

#include "simplificadorLogico.h"
#include "TableGenerator.h"
#include "Literal.h"
#include "menuApresentacao.h"
#include "regrasProposicionais.h"
#include "Conversor.h"

using namespace std;

/**
* Método de chamada das funções principais de execução de cada arquivo.
*/
void execOpcoes(int opc){
    switch(opc){
        case(1):
            resumoTabela();
            execGenerateTable();
            break;
        case(2):
            resumoConversor();
            execConversor();
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
            cout << " ISSO É TUDO PESSOAL !!!\n ";
            break;
        default:
            cout << " Excuse-me? pode repetir?\n";
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
        cout << " >>> ";
        cin >> opc;
        execOpcoes(opc);

        if (opc == 0) break;

    }
}

/**
* Método main do programa.
*/
int main(){
    execPrincipal();
	return 0;
}

