//
// Created by rafaelsp on 25/04/19.
//

#ifndef CPP_SIMPLIFICADORLOGICO_H
#define CPP_SIMPLIFICADORLOGICO_H

#include<iostream>
#include "Literal.h"

using namespace std;

basic_string<char> conjuncao(Literal *valor1, Literal *valor2);

basic_string<char> negacao(Literal *valor1);

basic_string<char> modus_ponens(Literal *valor1, Literal *valor2);

basic_string<char> modus_tollens(Literal *valor1, Literal *valor2);

basic_string<char> adicao_disjuntiva(Literal *valor1);

basic_string<char> silogismo_disjuntivo(Literal *valor1, Literal *valor2);

basic_string<char> silogismo_hipotetico(Literal *valor1, Literal *valor2);

basic_string<char> exportacao(Literal *valor1);

basic_string<char> dilema_construtivo(Literal *valor1, Literal *valor2, Literal *valor3);

basic_string<char> eliminacao_de_equivalencia(Literal *valor1);

basic_string<char> introducao_de_equivalencia(Literal *valor1, Literal *valor2);

void listarOpcoes();

void execExpressoes();

#endif //CPP_SIMPLIFICADORLOGICO_H
