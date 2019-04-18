#include <iostream>
#include <string>
#include "Literal.cpp"
#include "Literal.h"

void defineQ(Literal *proposicao_interna_Q);

void defineP(Literal *proposicao_interna_P);

void defineJ(Literal *proposicao_interna_P, Literal *proposicao_interna_Q, Literal *proposicao_media_J);

void defineK(Literal *proposicao_interna_P, Literal *proposicao_interna_Q, Literal *proposicao_media_K);

void define_P_Alternativa(Literal *proposicao_interna_P_Alternativa);

void define_proposicao_Media_Para_Comparacao(Literal *proposicao_interna_P, Literal *proposicao_interna_Q,
                                             Literal *proposicao_Media_Para_Comparacao);

void define_proposicao_externa(Literal *proposicao_interna_P, Literal *proposicao_media_J, Literal *proposicao_externa);

int main_literal_test() { // lembrando que esse mais entra em conflito com o original
    Literal *proposicao_interna_P;
    Literal *proposicao_interna_P_Alternativa;
    Literal *proposicao_interna_Q;
    Literal *proposicao_media_K;
    Literal *proposicao_media_J;
    Literal *proposicao_Media_Para_Comparacao;
    Literal *proposicao_externa;
    Literal *a;
    a = new Literal;
    build_a_preposition(a, 'p', '~');
    cout << literal_to_string(a) << endl;
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


    // testes
    cout << "testes que retornam valores verdadeiros" << endl;
    cout << is_a_negate_atomic_preposition(proposicao_interna_P) << endl;
    cout << is_atomic_preposition(proposicao_interna_Q) << endl;

    cout << "testes que retornam valores falso" << endl;
    cout << is_a_negate_atomic_preposition(proposicao_interna_Q) << endl;
    cout << is_atomic_preposition(proposicao_interna_P) << endl;

    cout << "verificando se o equals funciona: " << endl;
    cout << "testes que retornam valores verdadeiros" << endl;
    cout << literals_is_equals(proposicao_interna_P, proposicao_interna_P_Alternativa) << endl;
    cout << literals_is_equals(proposicao_media_J, proposicao_media_K) << endl;

    cout << "testes que retornam valores falso" << endl;
    cout << literals_is_equals(proposicao_interna_P, proposicao_interna_Q) << endl; // dois tipos proposicaoAtomica
    cout << literals_is_equals(proposicao_interna_P, proposicao_media_J) << endl; // um proposicaoAtomica, outro nao
    cout << literals_is_equals(proposicao_media_K, proposicao_Media_Para_Comparacao)
         << endl; // dois do tipo proposicao composta

    proposicao_externa = new Literal;
    build_a_new_literal(proposicao_externa, '~', '&', proposicao_media_K, proposicao_interna_P);

    string to_string;

    to_string = literal_to_string(proposicao_externa);
    cout << to_string << endl;

    return 0;
}

void
define_proposicao_externa(Literal *proposicao_interna_P, Literal *proposicao_media_J, Literal *proposicao_externa) {
    proposicao_externa->binary_operator = '&';
    proposicao_externa->unary_operator = '~';
    proposicao_externa->preposition = (char) 0;
    proposicao_externa->first_value = proposicao_media_J;
    proposicao_externa->second_value = proposicao_interna_P;
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
