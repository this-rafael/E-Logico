#include<iostream>

#include "Literal.h"
#include "simplificadorLogico.h"


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
	cout << "\tDigite a sua opção!\n";
}

void execExpressoes() {

    int options;
    listarOpcoes();
    cout << " >>> ";
    cin  >> options;
    cout << endl;

    Literal *literal1;
    Literal *literal2;
    Literal *literal3;

    literal1 = new Literal;
    literal2 = new Literal;
    literal3 = new Literal;
    switch (options) {
        case (1):
            // Negacao
            cout << "\t Digite uma Expressão duplamente negada." << endl;
            _receive_input(literal1);
            cout << negacao(literal1);
            break;

        case (2):
            // Conjuncao
            cout << "\t Digite os valores 1 ou 0 para a primeira Proposicao." << endl;
            _receive_input(literal1);
            cout << "\t Digite os valores 1 ou 0 para a primeira Proposicao" << endl;
            _receive_input(literal2);
            cout << conjuncao(literal1, literal2);
            break;
        
        case (3):
            // Adicao Dijuntiva
            cout << "\t Digite uma Expressao." << endl;
            _receive_input(literal1);
            cout << adicao_disjuntiva(literal1);
            break;

        case (4):
            // Introducao da Equivalencia
            cout << "\t Digite uma Expressao com Implicacao." << endl;
            _receive_input(literal1);
            cout << "\t Digite uma Expressao com Implicacao e Proposicoes invertidas." << endl;
            _receive_input(literal2);
            cout << introducao_de_equivalencia(literal1, literal2);
            break;
            
        case (5):
            // Eliminacao da Equivalencia
            cout << "\t Digite uma Expressao com Bi-implicacao." << endl;
            _receive_input(literal1);
            cout << eliminacao_de_equivalencia(literal1);
            break;
        
        case (6):
            // Modus Ponens
            cout << "\t Digite uma Expressao com Implicacao." << endl;
            _receive_input(literal1);
            cout << " \t Digite uma Proposicao com o primeiro valor da primeira Expressao." << endl;
            _receive_input(literal2);
            cout << modus_ponens(literal1, literal2);
            break;
        
        case (7):
            // Modus Tollens
            cout << "\t Digite uma Expressao com Implicacao." << endl;
            _receive_input(literal1);
            cout << "\t Digite uma Proposicao, negando o segundo valor da primeira Expressao." << endl;
            _receive_input(literal2);
            cout << modus_tollens(literal1, literal2);
            break;
        
        case (8):
            // Silogismo Hipotetico
            cout << "\t Digite uma Expressao com Implicacao." << endl;
            _receive_input(literal1);
            cout << "\t Digite uma nova Expressao com Implicacao, e o primeiro valor sendo o segundo da primeira Expressao." << endl;
            _receive_input(literal2);
            cout << silogismo_hipotetico(literal1, literal2);
            break;
        
        case (9):
            // Silogismo Disjuntivo
            cout << "\t Digite uma Expressao com Disjuncao." << endl;
            _receive_input(literal1);
            cout << "\t Digite uma Proposicao negando o segundo valor da primeira Expressao." << endl;
            _receive_input(literal2);
            cout << silogismo_disjuntivo(literal1, literal2);
            break;
        
        case (10):
            // Dilema Construtivo
            cout << "\t Digite uma Expressao com Implicacao." << endl;
            _receive_input(literal1);
            cout << "\t Digite outra Expressao com Implicacao." << endl;
            _receive_input(literal2);
            cout << "\t Digite uma Expressao com Conjuncao, com os primeiros valores das Expressoes anteriores." << endl;
            _receive_input(literal3);
            cout << dilema_construtivo(literal1, literal2, literal3);
            break;

        case (11):
            // Exportacao
            cout << "\t Digite uma Expressao com Conjuncao, que Implica em uma Proposicao." << endl;
            _receive_input(literal1);
            cout << exportacao(literal1);
            break;

        case (0):
            cout << " Voltando para Pagina Principal." << endl;
            break;

        default:
            cout << " Voltando para Pagina Principal." << endl;
            break;
    }
}

basic_string<char> conjuncao(Literal *valor1, Literal *valor2) {
    // conjuncao (1 | 0) ^ (1 | 0) retorna True | False
    string answer = "";
    if (valor1->is_atomic_proposition && valor2->is_atomic_proposition) {
        if (valor1->proposition == '1' && valor2->proposition == '1') {
            answer = " Sua Expressao resulta em: 1";
        } else {
            answer = " Sua Expressao resulta em: 0";
        }
    } else
    {
        answer = " Nao eh possivel aplicar Conjuncao nessa expressao.";
    }
    return answer;
}

basic_string<char> negacao(Literal *valor1) {
    // negacao ~(~P) retorna P
    string answer = "";
    if (valor1->unary_operator == '~' && literals_is_equals(valor1->first_value, valor1->second_value)
        && valor1->first_value->unary_operator == '~') {
        answer = (" Sua dupla negacao resulta em: " + literal_to_string(valor1->first_value));
    }else
    {
        answer = " Nao eh possivel aplicar Negacao nessa expressao.";
    }
    return answer;
}

basic_string<char> adicao_disjuntiva(Literal *valor1) {
    // adicao_disjuntiva (P) retorna P | "Qualquer Expressão"
    string answer = "";
    if (!(is_a_nil_literal(valor1))) {
        answer = (" Essa Expressao pode ser considerada igual a: " + literal_to_string(valor1) + " | Qualquer Expressão");
    }else
    {
        answer = " Nao eh possivel aplicar Adicao Disjuntiva nessa expressao.";
    }
    return answer;
}

basic_string<char> modus_ponens(Literal *valor1, Literal *valor2) {
    // modus_ponens ((P -> Q), P) retorna Q
    string answer = "";
    if((valor1->binary_operator == '*') && literals_is_equals(valor1->first_value, valor2))
    {
        answer = (" Aplicando-se o metodo Modus Ponens, tem-se o resultado da Expressao: " + literal_to_string(valor1->second_value));
    } else
    {
        answer = " Nao eh possivel aplicar Modus Ponens nessa expressao.";
    }
    return answer;
}

basic_string<char> modus_tollens(Literal *valor1, Literal *valor2) {
    // modus_tollens (P -> Q) ^ ~Q) retorna ~P
    string answer = "";
    if((valor1->binary_operator == '*') && (("~" + literal_to_string(valor1->second_value)) == literal_to_string(valor2)))
    {
        answer = (" Aplicando-se o metodo Modus Tollens, tem-se o resultado da Expressao: ");
        answer.push_back('~');
        answer += literal_to_string(valor1->first_value);
    } else
    {
        answer = " Nao eh possivel aplicar Modus Tollens nessa expressao.";
    }
    return answer;
}

basic_string<char> silogismo_disjuntivo(Literal *valor1, Literal *valor2) {
    // silogismo_disjuntivo (P v Q) ^ ~Q retorna P
    string answer = "";
    if ((valor1->binary_operator == 'v') && ("~" + literal_to_string(valor1->second_value)) == literal_to_string(valor2))
    {
        answer = (" Aplicando-se o metodo Silogismo Disjuntivo, tem-se o resultado da Expressao: " + literal_to_string(valor1->first_value));
    } else
    {
        answer = " Nao eh possivel aplicar Silogismo Disjuntivo nessa expressao.";
    }
    return answer;
}

basic_string<char> silogismo_hipotetico(Literal *valor1, Literal *valor2) {
    // silogismo_hipotetico (P -> Q) ^ (Q -> R) retorna (P -> R)
    string answer = "";
    
    if (valor1->binary_operator == '*' && valor2->binary_operator == '*' && (literals_is_equals(valor1->second_value, valor2->first_value)))
    {
        answer =  (" Aplicando-se o metodo Silogismo Hipotetico, tem-se o resultado da Expressao: " + 
        ("(" + literal_to_string(valor1->first_value) + " -> " + literal_to_string(valor2->second_value) + ")"));
    } else
    {
        answer = " Nao eh possivel aplicar Silogismo Hipotetico nessa expressao.";
    }
    return answer;
}

basic_string<char> exportacao(Literal *valor1) {
    // exportacao ((P ^ Q) -> R) retorna P -> (Q -> R)
    string answer = "";

    if (!is_a_nil_literal(valor1->first_value) && valor1->first_value->binary_operator == '^' && valor1->binary_operator == '*')
    {
        answer =  (" Aplicando-se o metodo Exportacao, tem-se o resultado da Expressao: " +
         (literal_to_string(valor1->first_value->first_value) + " -> (" +
         literal_to_string(valor1->first_value->second_value) + " -> " + literal_to_string(valor1->second_value) + ")"));
    } else
    {
        answer = " Nao eh possivel aplicar Exportacao nessa expressao.";
    }
    return answer;
}

basic_string<char> dilema_construtivo(Literal *valor1, Literal *valor2, Literal *valor3) {
    // dilema_construtivo (P -> Q) ^ (r -> s) ^ (P ^ r) retorna q v s
    string answer = "";

    if (valor1->binary_operator == '*' && valor2->binary_operator == '*' && valor3->binary_operator == 'v')
    {
        answer =  (" Aplicando-se o metodo Dilema Construtivo, tem-se o resultado da Expressao: " + 
        ("(" + literal_to_string(valor1->second_value) + " v " + literal_to_string(valor2->second_value) + ")"));
    } else
    {
        answer = " Nao eh possivel aplicar Dilema Construtivo nessa expressao.";
    }
    return answer;
}

basic_string<char> eliminacao_de_equivalencia(Literal *valor1) {
    // eliminacao_de_equivalencia (P <-> Q) retorna (P -> Q) ^ (Q -> P)
    string answer = "";

    if (valor1->binary_operator == '#')
    {
        
        answer =  (" Aplicando-se o metodo Eliminacao de Equivalencia, tem-se o resultado da Expressao: " + 
        ("(" + literal_to_string(valor1->first_value) + " -> " + literal_to_string(valor1->second_value) +
                 ") ^ (" + literal_to_string(valor1->second_value) + " -> " + literal_to_string(valor1->first_value) + ")"));
    } else
    {
        answer = " Nao eh possivel aplicar Eliminacao de Equivalencia nessa expressao.";
    }
    return answer;
}

basic_string<char> introducao_de_equivalencia(Literal *valor1, Literal *valor2) {
    // introducao_de_equivalencia (P -> Q) ^ (Q -> P) retorna (P <-> Q)
    string answer = "";

    if (valor1->binary_operator == '*' && valor2->binary_operator == '*' &&
        literals_is_equals(valor1->first_value, valor2->second_value) && literals_is_equals(valor1->second_value, valor2->first_value))
    {
        answer = (" Aplicando-se o metodo Introducao de Equivalencia, tem-se o resultado da Expressao: " + 
        ("(" + literal_to_string(valor1->first_value) + " <-> " + literal_to_string(valor2->first_value) + ")"));
    } else
    {
        answer = " Nao eh possivel aplicar Introducao de Equivalencia nessa expressao.";
    }
    return answer;
}
