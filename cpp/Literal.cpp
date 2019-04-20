#include <iostream>
#include <string>

using namespace std;
// Created by rafaelsp on 16/04/19.
//

struct Literal {
    bool is_atomic_proposition = false;
    char unary_operator = (char) 0;
    char binary_operator = (char) 0;
    char proposition = (char) 0;
    Literal *first_value = nullptr;
    Literal *second_value = nullptr;
};
