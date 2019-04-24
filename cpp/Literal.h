//
// Created by rafaelsp on 17/04/19.
//

#ifndef CPP_LITERAL_H
#define CPP_LITERAL_H

#include <iostream>
#include <string.h>

using namespace std;

static const char empty_str = (char) 0;

struct Literal {
    bool is_atomic_proposition = false;
    char unary_operator = (char) 0;
    char binary_operator = (char) 0;
    char proposition = (char) 0;
    Literal *first_value = nullptr;
    Literal *second_value = nullptr;
};


bool is_a_nil_literal(const Literal *l);

string literal_to_string(const Literal *literal);

string binary_operator_to_string(char anOperator);

bool first_value_is_equals(const Literal *l, const Literal *k);

bool second_value_is_equals(const Literal *l, const Literal *k);

bool literals_is_equals(const Literal *l, const Literal *k);

bool binary_operator_is_equals(const Literal *l, const Literal *k);

bool propositions_is_equals(const Literal *l, const Literal *k);

bool unary_operator_is_equals(const Literal *l, const Literal *k);
bool is_a_negate_atomic_proposition(const Literal *l);
bool is_atomic_proposition(const Literal *l);

void set_second_value(Literal *l);

void set_first_value(Literal *l);

void set_proposition_value(Literal *l, char value);
bool is_a_valid_proposition(char value);

void set_binary_operator(Literal *l, char value);
bool is_binary_operator(char value);

void set_unary_operator(Literal *l, char value);

void build_a_new_literal(Literal *current, char unary_operator, char binary_operator, Literal *first_value,
                         Literal *second_value);

void build_a_proposition(Literal *literal, char proposition, char unary_operator);

void print_info();

string choose_a_proposition();

char choose_a_binary_operator();

char choose_a_unary_operator();

void report_error_1();

void choose_a_option_1();
void about_a_literal();

void *_receive_input(Literal *l);

void *receive_input(Literal *l);
#endif //CPP_LITERAL_H