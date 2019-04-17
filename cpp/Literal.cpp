#include <iostream>
#include <string>
#include <string.h>
#include <vector>

using namespace std;
//
// Created by rafaelsp on 16/04/19.
//

struct Literal{
    bool is_atomic_preposition;
    char unary_operator = (char) 0;
    char binary_operator = (char) 0;
    char preposition = (char) 0;
    Literal *first_value;
    Literal *second_value;
};

void set_unary_operator(Literal *l, char value);

void set_binary_operator(Literal *l, char value);

bool is_binary_operator(char value);

void set_preposition_value(Literal *l, char value);

bool is_a_valid_preposition(char value);

void set_first_value(Literal *l);

void set_second_value(Literal *l);

bool is_atomic_preposition(const Literal *l);

bool is_a_negate_atomic_preposition(const Literal *l);

bool unary_operator_is_equals(const Literal *l, const Literal *k);

bool prepositions_is_equals(const Literal *l, const Literal *k);

bool binary_operator_is_equals(const Literal *l, const Literal *k);

bool literals_is_equals(const Literal *l, const Literal *k);

// remover daqui até
void defineQ(Literal *proposicao_interna_Q);

void defineP(Literal *proposicao_interna_P);

void defineJ(Literal *proposicao_interna_P, Literal *proposicao_interna_Q, Literal *proposicao_media_J);

void defineK(Literal *proposicao_interna_P, Literal *proposicao_interna_Q, Literal *proposicao_media_K);

void define_P_Alternativa(Literal *proposicao_interna_P_Alternativa);

void define_proposicao_Media_Para_Comparacao(Literal *proposicao_interna_P, Literal *proposicao_interna_Q,
                                             Literal *proposicao_Media_Para_Comparacao);

string literal_to_string(const Literal *literal);

int main_falso() { // lembrando que esse mais entra em conflito com o original
    Literal *proposicao_interna_P;
    Literal *proposicao_interna_P_Alternativa;
    Literal *proposicao_interna_Q;
    Literal *proposicao_media_K;
    Literal *proposicao_media_J;
    Literal *proposicao_Media_Para_Comparacao;
    Literal *proposicao_externa;
//
    proposicao_interna_P = new Literal; // definindo ~P
    defineP(proposicao_interna_P);

    proposicao_interna_Q = new Literal; // definindo Q
    defineQ(proposicao_interna_Q);

    proposicao_media_J = new Literal; // definindo ~P | Q
    defineJ(proposicao_interna_P, proposicao_interna_Q, proposicao_media_J);

    proposicao_media_K = new Literal;
    defineK(proposicao_interna_P, proposicao_interna_Q, proposicao_media_K);

    proposicao_interna_P_Alternativa = new Literal;
    define_P_Alternativa(proposicao_interna_P_Alternativa);

    proposicao_Media_Para_Comparacao = new Literal;
    define_proposicao_Media_Para_Comparacao(proposicao_interna_P, proposicao_interna_Q,
                                            proposicao_Media_Para_Comparacao);

    cout << literal_to_string(proposicao_media_J);
//
//
//    cout << "testes que retornam valores verdadeiros"<< endl;
//    cout << is_a_negate_atomic_preposition(proposicao_interna_P) << endl;
//    cout << is_atomic_preposition(proposicao_interna_Q) << endl;
//
//    cout << "testes que retornam valores falso"<< endl;
//    cout << is_a_negate_atomic_preposition(proposicao_interna_Q) << endl;
//    cout << is_atomic_preposition(proposicao_interna_P) << endl;
//
//    cout << "verificando se o equals funciona: " << endl;
//    cout << "testes que retornam valores verdadeiros"<< endl;
//    cout << literals_is_equals(proposicao_interna_P, proposicao_interna_P_Alternativa) << endl;
//    cout << literals_is_equals(proposicao_media_J, proposicao_media_K) << endl;
//
//    cout << "testes que retornam valores falso"<< endl;
//    cout << literals_is_equals(proposicao_interna_P,proposicao_interna_Q) << endl; // dois tipos proposicaoAtomica
//    cout << literals_is_equals(proposicao_interna_P, proposicao_media_J) << endl; // um proposicaoAtomica, outro nao
//    cout << literals_is_equals(proposicao_media_K, proposicao_Media_Para_Comparacao); // dois do tipo proposicao composta

    literal_to_string(proposicao_media_J);

}

string literal_to_string(const Literal *literal) {
    string representacao = "";
    if (literal->is_atomic_preposition) {
        representacao += literal->preposition;
    } else if (is_a_negate_atomic_preposition(literal)) {
        representacao += literal->unary_operator;
        representacao += literal->preposition;
    } else {
        string unary_operator_to_string = (&"" [ literal->unary_operator]); // ver se isso funciona mesmo
        string first_preposition_to_string = literal_to_string(literal->first_value);
        string binary_operator_to_string = (&" " [ literal->binary_operator]);
        string second_preposition_to_string = literal_to_string(literal->second_value);
        representacao += (unary_operator_to_string + " (" + first_preposition_to_string + " " + binary_operator_to_string + " " + second_preposition_to_string + ") ");
    }
    return representacao;
}

void define_proposicao_Media_Para_Comparacao(Literal *proposicao_interna_P, Literal *proposicao_interna_Q,
                                             Literal *proposicao_Media_Para_Comparacao) {
    proposicao_Media_Para_Comparacao->binary_operator = '|';
    proposicao_Media_Para_Comparacao->unary_operator = (char) 0;
    proposicao_Media_Para_Comparacao->preposition = (char) 0;
    proposicao_Media_Para_Comparacao->first_value = proposicao_interna_Q;
    proposicao_Media_Para_Comparacao->second_value = proposicao_interna_P;
}

void define_P_Alternativa(Literal *proposicao_interna_P_Alternativa) {
    proposicao_interna_P_Alternativa->is_atomic_preposition = true;
    proposicao_interna_P_Alternativa->binary_operator = (char) 0;
    proposicao_interna_P_Alternativa->unary_operator = '~';
    proposicao_interna_P_Alternativa->preposition = 'P';
    proposicao_interna_P_Alternativa->first_value = nullptr;
    proposicao_interna_P_Alternativa->second_value = nullptr;
}

void defineK(Literal *proposicao_interna_P, Literal *proposicao_interna_Q, Literal *proposicao_media_K) {
    proposicao_media_K->binary_operator = '|';
    proposicao_media_K->unary_operator = (char) 0;
    proposicao_media_K->preposition = (char) 0;
    proposicao_media_K->first_value = proposicao_interna_P;
    proposicao_media_K->second_value = proposicao_interna_Q;
}



void defineJ(Literal *proposicao_interna_P, Literal *proposicao_interna_Q, Literal *proposicao_media_J) {
    proposicao_media_J->binary_operator = '|';
    proposicao_media_J->unary_operator = (char) 0;
    proposicao_media_J->preposition = (char) 0;
    proposicao_media_J->first_value = proposicao_interna_P;
    proposicao_media_J->second_value = proposicao_interna_Q;
}

void defineP(Literal *proposicao_interna_P) {
    proposicao_interna_P->is_atomic_preposition = true;
    proposicao_interna_P->binary_operator = (char) 0;
    proposicao_interna_P->unary_operator = '~';
    proposicao_interna_P->preposition = 'P';
    proposicao_interna_P->first_value = nullptr;
    proposicao_interna_P->second_value = nullptr;
}

void defineQ(Literal *proposicao_interna_Q) {
    proposicao_interna_Q->is_atomic_preposition = true;
    proposicao_interna_Q->binary_operator = (char) 0;
    proposicao_interna_Q->unary_operator = (char) 0;
    proposicao_interna_Q->preposition = 'Q';
    proposicao_interna_Q->first_value = nullptr;
    proposicao_interna_Q->second_value = nullptr;

}

// aqui depois



bool first_value_is_equals(const Literal *l, const Literal *k)
{
    return literals_is_equals(l->first_value, k->first_value);
}

bool second_value_is_equals(const Literal *l, const Literal *k)
{
    return literals_is_equals(l->second_value, k->second_value);
}



bool literals_is_equals(const Literal *l, const Literal *k) {
    bool answer = true;
    answer &= unary_operator_is_equals(l, k);
    if(is_atomic_preposition(l))
    {
        if(is_atomic_preposition(k))
        {
            answer &= prepositions_is_equals(l, k);
        } else
        {
            answer &= false;
        }
    } else
    {
        if(is_atomic_preposition(k))
        {
            answer &= false;
        } else
        {

                answer &= first_value_is_equals(l, k);
                answer &= second_value_is_equals(l, k);
        }

    }
    answer &= binary_operator_is_equals(l, k);
    return answer;
}


bool binary_operator_is_equals(const Literal *l, const Literal *k)
{
    return k->binary_operator == l->binary_operator;
}

bool prepositions_is_equals(const Literal *l, const Literal *k)
{
    return k->preposition == l->preposition;
}

bool unary_operator_is_equals(const Literal *l, const Literal *k)
{
    return k->unary_operator == l->unary_operator;
}

bool is_a_negate_atomic_preposition(const Literal *l) {
    return is_atomic_preposition(l) && l->unary_operator == '~';
}

// method merely illustrative never gets used
bool is_atomic_preposition(const Literal *l)
{
    return l->second_value == nullptr && l->binary_operator == (char) 0 and l->preposition != (char) 0;
}

void set_second_value(Literal *l)
{
    l->second_value = new Literal;
}

void set_first_value(Literal *l)
{
    l->first_value = new Literal;
}

void set_preposition_value(Literal *l, char value)
{
    if(is_a_valid_preposition(value))
    l->preposition = value;
}

bool is_a_valid_preposition(char value) {
    bool ans = false;
    for(int i = 65; i <= 122; i++)
    {
        ans |= value == (char) i; // return's true if value in range of A... Z or a...z
    }

    return ans;
}

void set_binary_operator(Literal *l, char value)
{
    switch(value)
    {
        case 'v':
            value = '|';
            break;
        case '^':
            value = '&';
            break;
        default:
            value = value;
            break;
    }

    if(is_binary_operator(value))
    {
        l->binary_operator = value;
    }

}

bool is_binary_operator(char value) {
    return value == '*' || value == '#' || value == '&'|| value == '|';
}

void set_unary_operator(Literal *l, char value)
{
    if(value == '~' )
    {
        l->unary_operator = value;
    }
}

