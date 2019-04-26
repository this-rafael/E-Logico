#include <iostream>
#include "Literal.h"
#include <string>
#include <string.h>
#include <vector>
#include <sstream>
#include <cmath>


string &build_first_line(const string &propositions1, int number_propositions, string &first_line);

/** 
 * Metodo "in", serve para checar se um caractere (piece) estah contido
 * em uma string (whole).
 *
 * retorna se estah ou nao.
 *
 * */
bool in(char piece, string whole){
    bool result = false;
    for (int i = 0; i < whole.length(); i++){
        if (piece == (whole[i])) {
            result = true;
        }
    }
    return result;
}

string vector_to_string(vector<char> vec){
    string result = "";
    for (int i = 0; i < vec.size(); i++){
        result += vec[i];
    }
    return result;
}

/** 
 * Gera uma lista com as proposicoes do literal.
 * Exemplo:
 * Literal: "(p & (q | r))" gera {"p","q","r")
 *
 * Recebe o literal e pega seu toString (expression)
 * Declara um conjunto de caracteres a serem ignorados na contagem (ignored_chars)
 * Declara o vetor de proposicoes (propositions)
 * Por fim, varre o toString do literal, checando quem sao os elementos diferentes
 * dos caracteres ignorados e salvando na lista de propositions (nao salva repeticoes)
 *
 * retorna a lista de proposicoes
 */
string get_proposition_list(Literal *literal){
    string expression = literal_to_string(literal);
    string ignored_chars = "()~&|*#><- ";
    ignored_chars.push_back((char) 0);
    vector<char> propositions;
    int vector_index = 0;
    for (int i = 0; i < expression.length(); i++){
        char c = expression[i];
        if ((!(in(c,ignored_chars))) && !(in(c,vector_to_string(propositions)))){
            propositions.push_back(expression[i]);
        }
    }
    string result = vector_to_string(propositions);
    return result;
}

/** 
 * Converte um inteiro em uma string
 */
string int_to_string(int a){
    stringstream ss;
    ss << a;
    string str = ss.str();
    return str;
}

/** 
 * Transforma um decimal em uma string que representa
 * o binario
 *
 */
string binary(int decimal){
    int a[10], n, i;
    n = decimal;
    for(i=0; n>0; i++){
        a[i] = n%2;
        n = n/2;
    }

    string bin = "";

    for(i=i-1 ;i>=0 ;i--){
        bin += int_to_string(a[i]);
    }

    return bin;
}

/**  
 * Completa a string com zeros a esquerda, para
 * que todos binarios tenham o mesmo lenght
 *
 */
string complete_binary(string binary, int size){
    int counter = binary.length();
    while (counter < size){
        binary = "0" + binary;
        counter += 1;
    }
    return binary;
}

/** 
 * Tendo em maos o numero de proposicoes, gera uma lista
 * de strings que representam as possibilidades (interpretacoes) da tabela
 *
 */
vector<string> possibilities(int number_of_propositions){
    int table_size = pow(2,number_of_propositions);
    vector<string> pos;
    for (int i = 0; i < table_size; i++){
        string bin = binary(i);
        bin = complete_binary(bin,number_of_propositions);
        pos.push_back(bin);
    }
    return pos;
}

/** 
 * Resolve a expressao para a interpretacao (possibilidade) em questao:
 *
 * Se o literal for atomico, retorna-o resolvido em formato de boolean, para
 * subir na arvore
 *
 * Se nao for atomico, chama recursivamente o metodo duas vezes (para as duas proposicoes)
 * de acordo com a operacao do literal. Ex:
 * "(p | q) & r" vai ser passado "result(p|q) and result(r)"
 *
 * Com isso, eh obtido a saida da tabela verdade para a interpretacao em questao.
 */
bool result(Literal *literal, string propositions, string possibilities ){
    bool res = true;

    if (literal->binary_operator == (char) 0){ // atomic_proposition
        for (int i = 0; i < propositions.length(); i++){
            char &atomic_proposition = get_proposition_list(literal)[0];
            if (atomic_proposition == propositions[i]) {
                res = possibilities[i] != '0';
            }
        }

        (literal->unary_operator == '~') ? res = !res : res = res;

    } else if (literal->binary_operator == '&'){
        res = result(literal->first_value,propositions,possibilities) && result(literal->second_value,propositions,possibilities);
        if (literal->unary_operator == '~'){
            res = !(res);
        }

    } else if (literal->binary_operator == '|'){
        res = result(literal->first_value,propositions,possibilities) || result(literal->second_value,propositions,possibilities);
        if (literal->unary_operator == '~') {
            res = !(res);
        }
    } else if (literal->binary_operator == '*'){
        res = not(result(literal->first_value,propositions,possibilities)) || result(literal->second_value,propositions,possibilities);
        if (literal->unary_operator == '~'){
            res = !(res);
        }

    } else if (literal->binary_operator == '#'){
        res = (result(literal->first_value,propositions,possibilities) && result(literal->second_value,propositions,possibilities)) || not(result(literal->first_value,propositions,possibilities)) && not(result(literal->second_value,propositions,possibilities));
        if (literal->unary_operator == '~') {
            res = !(res);
        }
    }
    return res;
}

/** 
 * Gera a tabela completa em formato de string, para isso
 * procura as variaveis, possibilidades (interpretacoes), e para
 * cada linha, chama o metodo result, junta todas as linhas e no final retorna a tabela.
 *
 */
string get_truth_table(Literal *literal){
    string propositions1 = get_proposition_list(literal);

    int number_propositions = propositions1.length();

    vector<string> pos = possibilities(number_propositions);

    string table = "";
    string first_line = "";

    first_line = build_first_line(propositions1, number_propositions, first_line);

    table += first_line + "| result\n";


    for(int i = 0; i < pos.size(); i++){

        basic_string<char> &current_interpretation = pos[i];
        bool res = result(literal, propositions1, current_interpretation);
        string answer = "";
        (res) ? answer = "1" : answer = "0";
        
        string line = "";

        for (int j = 0; j < number_propositions; j++){
            line += current_interpretation[j];
            line += " ";
        }

        line += "| ";
        line += answer;
        line += "\n";

        table += line;
    }

    return table;

}

/**
* Método de construção da primeira linha 
*/
string &build_first_line(const string &propositions1, int number_propositions, string &first_line) {
    for (int i = 0; i < number_propositions; i++) {
        first_line += propositions1[i];
        first_line += " ";
    }
    return first_line;
}

void execGenerateTable() {
    cout << "\n Agora vamos montar o literal do qual será criada a tabela!\n";

    Literal *l;
    l = new Literal;
    receive_input(l);


    cout << " A tabela verdade para " << " " << literal_to_string(l) << " e:" << endl;
    string table = get_truth_table(l);
    cout << table;
}