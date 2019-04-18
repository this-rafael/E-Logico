//
// Created by rafaelsp on 17/04/19.
//

#ifndef CPP_LITERAL_H
#define CPP_LITERAL_H


#include <iostream>
#include <string>


// define functions
bool is_atomic_preposition(const Literal *l);

bool is_a_negate_atomic_preposition(const Literal *l);

bool is_atomic_preposition(const Literal *l);

bool is_a_valid_preposition(char value);

bool is_binary_operator(char value);

bool prepositions_is_equals(const Literal *l, const Literal *k);

bool literals_is_equals(const Literal *l, const Literal *k);

bool binary_operator_is_equals(const Literal *l, const Literal *k);

bool unary_operator_is_equals(const Literal *l, const Literal *k);

string literal_to_string(const Literal *literal) {
    string representacao = "";
    if (literal->is_atomic_preposition) {
        representacao += literal->preposition;
    } else if (is_a_negate_atomic_preposition(literal)) {
        representacao += literal->unary_operator;
        representacao += literal->preposition;
    } else {

        representacao.push_back(literal->unary_operator);
        representacao += "(";
        representacao += literal_to_string(literal->first_value);
        representacao += " ";
        representacao.push_back(literal->binary_operator);
        representacao += " ";
        representacao += literal_to_string(literal->second_value);
        representacao += ")";

    }
    return representacao;
}

bool first_value_is_equals(const Literal *l, const Literal *k) {
    return literals_is_equals(l->first_value, k->first_value);
}

bool second_value_is_equals(const Literal *l, const Literal *k) {
    return literals_is_equals(l->second_value, k->second_value);
}

bool literals_is_equals(const Literal *l, const Literal *k) {
    bool answer = true;
    answer &= unary_operator_is_equals(l, k);
    if (is_atomic_preposition(l)) {
        if (is_atomic_preposition(k)) {
            answer &= prepositions_is_equals(l, k);
        } else {
            answer &= false;
        }
    } else {
        if (is_atomic_preposition(k)) {
            answer &= false;
        } else {

            answer &= first_value_is_equals(l, k);
            answer &= second_value_is_equals(l, k);
        }

    }
    answer &= binary_operator_is_equals(l, k);
    return answer;
}

bool binary_operator_is_equals(const Literal *l, const Literal *k) {
    return k->binary_operator == l->binary_operator;
}

bool prepositions_is_equals(const Literal *l, const Literal *k) {
    return k->preposition == l->preposition;
}

bool unary_operator_is_equals(const Literal *l, const Literal *k) {
    return k->unary_operator == l->unary_operator;
}

bool is_a_negate_atomic_preposition(const Literal *l) {
    return is_atomic_preposition(l) && l->unary_operator == '~';
}

// method merely illustrative never gets used
bool is_atomic_preposition(const Literal *l) {
    return l->second_value == nullptr && l->binary_operator == (char) 0
           and l->preposition != (char) 0;
}

void set_second_value(Literal *l) {
    l->second_value = new Literal;
}

void set_first_value(Literal *l) {
    l->first_value = new Literal;
}

void set_preposition_value(Literal *l, char value) {
    if (is_a_valid_preposition(value)) {
        l->preposition = value;
    }
}

bool is_a_valid_preposition(char value) {
    bool ans = false;
    for (int i = 65; i <= 122; i++) {
        ans |= value == (char) i; // return's true if value in range of A... Z or a...z
    }

    return ans;
}

void set_binary_operator(Literal *l, char value) {
    switch (value) {
        case 'v':
            value = '|';
            break;
        case '^':
            value = '&';
            break;
        default:
            value = value; // @suppress("Assignment to itself")
            break;
    }

    if (is_binary_operator(value)) {
        l->binary_operator = value;
    }

}

bool is_binary_operator(char value) {
    return value == '*' || value == '#' || value == '&' || value == '|';
}

void set_unary_operator(Literal *l, char value) {
    if (value == '~') {
        l->unary_operator = value;
    }
}

void build_a_new_literal(Literal *current, char unary_operator, char binary_operator, Literal *first_value,
                         Literal *second_value) {
    set_unary_operator(current, unary_operator);
    set_binary_operator(current, binary_operator);
    set_binary_operator(current, binary_operator);
    current->first_value = first_value;
    current->second_value = second_value;
}

void build_a_preposition(Literal *literal, char preposition, char unary_operator) {

    literal->unary_operator = unary_operator;
    set_preposition_value(literal, preposition);

}

#endif //CPP_LITERAL_H
