#include<iostream>

#include "Literal.h"

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

using namespace std;

void listarOpcoes(){
	cout << "\n\t\t --- Opcoes Numericas --- \n";
	cout << " \t1 - Negação\n";
	cout << " \t2 - Conjunção\n";
	cout << " \t3 - Adição\n";
	cout << " \t4 - Introdução da Equivalência\n";
	cout << " \t5 - Eliminação da Equivalência\n";
	cout << " \t6 - Modus Ponens\n";
	cout << " \t7 - Modus Tollens\n";
	cout << " \t8 - Silogismo Hipotético\n";
	cout << " \t9 - Silogismo Disjuntivo\n";
	cout << " \t10 - Dilema Construtivo\n";
	cout << " \t11 - Exportação\n";
	cout << " \t0 - Voltar ao menu principal\n\n";
	cout << "Digite a sua opção!\n";
}

void execExpressoes() {

    // char option;
    // cin  >> option;
    // cout << endl;

    switch (option)
    {
        case (option == 'Modus Ponens'):
            // Criar 2 Literais
            // modus_ponens(literal1, literal2);
            break;
        case (option == 'Modus Ponens'):
            // 
            // 
            break;
        default:
            // cout << 'Voltando para Main';
            break;
    }
}

int main_de_simplicadores(){
	Literal *literal1;
	Literal *literal2;
    Literal *literal3;
	literal1 = new Literal;
	literal2 = new Literal;
   	literal3 = new Literal;
    receive_input(literal1);
    receive_input(literal2);
    receive_input(literal3);

    cout << adicao_disjuntiva(literal1);
    cout << eliminacao_de_equivalencia(literal1);
    cout << introducao_de_equivalencia(literal1, literal2);
	cout << modus_ponens(literal1, literal2);
    cout << modus_tollens(literal1, literal2);
    cout << silogismo_disjuntivo(literal1, literal2);
    cout << silogismo_hipotetico(literal1, literal2);
    cout << dilema_construtivo(literal1, literal2, literal3);
    cout << exportacao(literal1);

	return 0;
}

basic_string<char> conjuncao(Literal *valor1, Literal *valor2) {
    // conjuncao (1 | 0) ^ (1 | 0) retorna True | False
    string answer = "";
    if (valor1->is_atomic_proposition && valor2->is_atomic_proposition) {
        if (valor1->proposition == '1' && valor2->proposition == '1') {
            answer = "1";
        } else {
            answer = "0";
        }
    } else
    {
        answer = "Nao eh possivel aplicar Conjuncao nessa expressao.";
    }
    return answer;
}

basic_string<char> negacao(Literal *valor1) {
    // negacao ~(~P) retorna P
    string answer = "";
    if (valor1->unary_operator == '~' && literals_is_equals(valor1->first_value, valor1->second_value)
        && valor1->first_value->unary_operator == '~') {
        answer = literal_to_string(valor1);
    }else
    {
        answer = "Nao eh possivel aplicar Negacao nessa expressao.";
    }
    return answer;
}

basic_string<char> adicao_disjuntiva(Literal *valor1) {
    // adicao_disjuntiva (P) retorna P | "Qualquer Expressão"
    string answer = "";
    if (!(is_a_nil_literal(valor1))) {
        answer = literal_to_string(valor1) + " | Qualquer Expressão";
    }else
    {
        answer = "Nao eh possivel aplicar Adicao Disjuntiva nessa expressao.";
    }
    return answer;
}

basic_string<char> modus_ponens(Literal *valor1, Literal *valor2) {
    // modus_ponens ((P -> Q), P) retorna Q
    string answer = "";
    if((valor1->binary_operator == '*') && literals_is_equals(valor1->first_value, valor2))
    {
        answer = literal_to_string(valor1->second_value);
    } else
    {
        answer = "Nao eh possivel aplicar Modus Ponens nessa expressao.";
    }
    return answer;
}

basic_string<char> modus_tollens(Literal *valor1, Literal *valor2) {
    // modus_tollens (P -> Q) ^ ~Q) retorna ~P
    string answer = "";
    if((valor1->binary_operator == '*') && (("~" + literal_to_string(valor1->second_value)) == literal_to_string(valor2)))
    {
        answer.push_back('~');
        answer += literal_to_string(valor1->first_value);
    } else
    {
        answer = "Nao eh possivel aplicar Modus Tollens nessa expressao.";
    }
    return answer;
}

basic_string<char> silogismo_disjuntivo(Literal *valor1, Literal *valor2) {
    // silogismo_disjuntivo (P v Q) ^ ~Q retorna P
    string answer = "";
    if ((valor1->binary_operator == 'v') && ("~" + literal_to_string(valor1->second_value)) == literal_to_string(valor2))
    {
        answer = literal_to_string(valor1->first_value);
    } else
    {
        answer = "Nao eh possivel aplicar Silogismo Disjuntivo nessa expressao.";
    }
    return answer;
}

basic_string<char> silogismo_hipotetico(Literal *valor1, Literal *valor2) {
    // silogismo_hipotetico (P -> Q) ^ (Q -> R) retorna (P -> R)
    string answer = "";
    
    if (valor1->binary_operator == '*' && valor2->binary_operator == '*' && (literals_is_equals(valor1->second_value, valor2->first_value)))
    {
        answer = ("(" + literal_to_string(valor1->first_value) + " -> " + literal_to_string(valor2->second_value) + ")");
    } else
    {
        answer = "Nao eh possivel aplicar Silogismo Hipotetico nessa expressao.";
    }
    return answer;
}

basic_string<char> exportacao(Literal *valor1) {
    // exportacao ((P ^ Q) -> R) retorna P -> (Q -> R)
    string answer = "";

    if (!is_a_nil_literal(valor1->first_value) && valor1->first_value->binary_operator == '^' && valor1->binary_operator == '*')
    {
        answer = (literal_to_string(valor1->first_value->first_value) + " -> (" +
         literal_to_string(valor1->first_value->second_value) + " -> " + literal_to_string(valor1->second_value) + ")");
    } else
    {
        answer = "Nao eh possivel aplicar Exportacao nessa expressao.";
    }
    return answer;
}

basic_string<char> dilema_construtivo(Literal *valor1, Literal *valor2, Literal *valor3) {
    // dilema_construtivo (P -> Q) ^ (r -> s) ^ (P ^ r) retorna q v s
    string answer = "";

    if (valor1->binary_operator == '*' && valor2->binary_operator == '*' && valor3->binary_operator == 'v')
    {
        answer = ("(" + literal_to_string(valor1->second_value) + " v " + literal_to_string(valor2->second_value) + ")");
    } else
    {
        answer = "Nao eh possivel aplicar Dilema Construtivo nessa expressao.";
    }
    return answer;
}

basic_string<char> eliminacao_de_equivalencia(Literal *valor1) {
    // eliminacao_de_equivalencia (P <-> Q) retorna (P -> Q) ^ (Q -> P)
    string answer = "";

    if (valor1->binary_operator == '#')
    {
        answer = ("(" + literal_to_string(valor1->first_value) + " -> " + literal_to_string(valor1->second_value) +
                 ") ^ (" + literal_to_string(valor1->second_value) + " -> " + literal_to_string(valor1->first_value) + ")");
    } else
    {
        answer = "Nao eh possivel aplicar Eliminacao de Equivalencia nessa expressao.";
    }
    return answer;
}

basic_string<char> introducao_de_equivalencia(Literal *valor1, Literal *valor2) {
    // introducao_de_equivalencia (P -> Q) ^ (Q -> P) retorna (P <-> Q)
    string answer = "";

    if (valor1->binary_operator == '*' && valor2->binary_operator == '*' &&
        literals_is_equals(valor1->first_value, valor2->second_value) && literals_is_equals(valor1->second_value, valor2->first_value))
    {
        answer = ("(" + literal_to_string(valor1->first_value) + " <-> " + literal_to_string(valor2->first_value) + ")");
    } else
    {
        answer = "Nao eh possivel aplicar Introducao de Equivalencia nessa expressao.";
    }
    return answer;
}
