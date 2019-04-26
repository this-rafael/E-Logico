#include <iostream>
#include "menuApresentacao.h"

using namespace std;
/**
* Menu de apresentação
*/
void apresentacaoInicial(){
    cout << " Ola, Bem vindo ao Aprendendo? Logico!\n\n";
    cout << " Programa Interativo de Aprendizagem e auxilio a assuntos Logicos\n";
}

/**
* Apresentação do menu de entrada
*/
void menuOpcoes(){
    cout << "\nMENU: \n";
    cout << " 1 - Aprendendo a formular uma Tabela-Verdade!\n";
    cout << " 2 - Aprendendo a converter (Bin - Dec) <---> (Dec - Bin)!\n";
    cout << " 3 - Aprendendo a simplificar expressoes proposicionais!\n";
    cout << " 4 - Aprendendo as regras basicas de proposicoes\n";
    cout << " 0 - SAIR\n\n";
    cout << " Digite a sua opcao !\n";
}

/**
* Breve apresentação da função de Tabela-Verdade
*/
void resumoTabela(){
   cout << "\n A Tabela Verdade eh utilizada em logica para considerar a validade de uma formula ou conferir que uma combinacao estah correta.\n";
   cout << " Quer saber como se constroi uma Tabela Verdade?\n";
   cout << " 1 - sim\n 2 - nao\n";
   cout << " >>> ";
   int entrada;
   cin >> entrada;
   switch(entrada){
       case(1):
           infoTabela();
           break;
       default:
           cout << " Okay, entao vamos la!\n";
     }
}

/**
* Informativo sobre a tabela-verdade
*/
void infoTabela(){
    cout << "\nCOMO CONSTRUIR UMA TABELA?\n\n";
    cout << " a) O numero de linhas contidas em uma Tabela Verdade vai ser calculada por Linhas = 2^n, onde (n) eh a quantidade de preposicoes.\n ";
    cout << " b) Incluimos nas linhas valores correspondentes em binario de (0 ... [2^n - 1]). Exemplo: Com uma tabela de 2 preposicoes teremos 4 linhas, em linha[1] = 0 0, 0 em binario com 2 casas decimais. na linha[2] = 0 1, 1 em binario com 2 casas. linha[3] = 1 0 , linha[4] = 1 1 \n";
    cout
            << " c) Enquanto ao numero de colunas, vai depender de voce, mas temos que ter obrigatoriamente n colunas + 1. Onde n eh definido como o numero de preposicoes e 1 coluna de resposta.\n";
    cout << " d) Na coluna de resposta, temos o resultado das operacoes. Cada linha com seu respectivo bit resposta\n";
}

/**
* Breve apresentação sobre o conversor binário
*/
void resumoConversor(){
    cout << "\n O conversor faz a traducao entre numeros de bases diferentes\n";
    cout << " Convertendo Bin --> Dec, teremos a conversao de Binario (base 2) para Decimal (base 10)\n";
    cout << " Convertendo Dec --> Bin, teremos a conversao de Decimal (base 10) para Binario (base 2)\n";
}

/**
* Informativo sobre o conversor
*/
void infoConversor(){
    cout << "\nCOMO CONVERTER UM NUMERO?\n\n";
    cout << " 1) De Binario para Decimal\n";
    cout << "   a) Posicionalmente, o numero binario tem seu bit mais considerativo da esquerda para direita. O ultimo bit valerah menos que o primeiro!\n";
    cout << "   b) Considerando o valor de cada bit, temos que o cada bit valerah 2^n onde n ah a localidade da direita para esquerda, contada a partir do zero. Exemplo: 0 0 1 , o bit 1 irah valer 2^0. 1 0 0 , o bit 1 irah valer 2^2\n";
    cout << "   c) O resultado do numero convertido serah a soma do valor de cada bit levando em conta sua considerabilidade. Exemplo: 1 0 1 1, 2^0 + 2^1 + 2^3 = 1 + 2 + 8 = 11 \n\n";
    cout << " 2) De Decimal para Binario\n";
    cout << "   a) O numero em decimal serah dividido pela base binario, ou seja 2, repetidas vezes ate que se sobre 1 ou 0\n";
    cout << "   b) O importante da divisao serah o resto da divisao e seu resultado final. Exemplo: o numero 2 em decimal, 2 / 2 = 1 e 2 % 2 = 0\n";
    cout << "   c) Chegando a ultima divisao com resto inteiro possivel, temos que reunir os restos das divisoes com o ultimo resultado possivel. Exemplo: 4, 4 % 2 = 0, 4/2 = 2, como 2 ainda pode ser divisivel por 2, 2 % 2 = 0 e 2 / 2 = 1. Juntando os restos com o ultimo resultado, temos:  0 0 1\n";
    cout << "   d) Com o resultado da divisao por 2 e seus restos concatenado, temos que apenas inverter a ordem. Exemplo anterior 0 0 1, invertemos 1 0 0, que equivale a 4\n\n";

}

/**
* Breve impressão sobre expressões proposicionais
*/
void resumoExpressoes(){
    cout << "\n Expressoes Proposicionais podem ser gigantes. No entanto, Existem várias regras de simplificacao que podem transformar expressoes gigantescas em expressões simples com a mesma equivalencia logica!\n";
}

/**
* Informativo sobre o simplificador proposicional
*/
void infoExpressoes(){
    cout << "\n COMO SIMPLIFICAR UMA EXPRESSAO PROPOSICIONAL?\n\n";
    cout << " a) Partimos da definicao das proposicoes\n";
    cout << " b) Assumimos uma regra que se encaixe com as proposicoes destinadas e aplicamos.\n";
    cout << " c) Repetimos os passos podendo utilizar a mesma regra ou uma regra diferente, ate chegarmos a uma expressao que nao aceite mais nenhuma regra. Em tese serah a expressao simplificada\n";
}

/**
* Resumo sobre a função de apresentação das regras proposicionais
*/
void resumoRegras(){
    cout << "\n Regras para simplificacao de expressoes logicas\n";
    cout
            << " Aqui vamos apresentar algumas regras para as simplificacao de expressoes logicas complexas em expressoes simples!\n";
}

/**
* Método de chamada para os resumos de cada opção do programa.
*/
void resumoOpcoes(int opc){
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
            break;
        case(0):
            cout << "ISSO EH TUDO, PESSOAL!!!\n ";
            break;
        default:
            cout << "Desculpe? pode repetir?\n";
    }

}


