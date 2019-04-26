#ifndef CPP_TABLE_H
#define CPP_TABLE_H


#include "Literal.h"
#include <string>
#include <string.h>
#include <vector>
#include <sstream>
#include <cmath>

using namespace std;

bool in(char piece, string whole);

string vector_to_string(vector<char> vec);


string get_proposition_list(Literal *literal);


string int_to_string(int a);



string binary(int decimal);


string complete_binary(string binary, int size);


vector<string> possibilities(int number_of_propositions);


bool result(Literal *literal, string propositions, string possibilities );


string get_truth_table(Literal *literal);

void execGenerateTable();
#endif //CPP_TABLE_H//