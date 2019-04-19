#include<iostream>
#include <stdlib.h>

#include "Literal.cpp"
#include "menuApresentacao.cpp"
#include "regrasProposicionais.cpp"

using namespace std;

void execOpcoes(int opc){
    switch(opc){
        case(1):
            resumoTabela();
            break;
        case(2):
            resumoConversor();
            break;
        case(3):
            resumoExpressoes();
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

int main(){
	execPrincipal();
	return 0;
}

