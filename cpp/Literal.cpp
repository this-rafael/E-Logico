#include <iostream>
#include <string>
#include "Literal.h"


// Created by rafaelsp on 16/04/19.
//

bool is_a_nil_literal(const Literal *l) 
{
    return l->unary_operator == empty_str && l->proposition == empty_str && l->binary_operator == empty_str && l->first_value == NULL && l->second_value == NULL;
}



string literal_to_string(const Literal *literal)
{
    string representacao = "";
    
    if (literal->is_atomic_proposition)
    {
        representacao.push_back(literal->proposition);
    }
    else if (is_a_negate_atomic_proposition(literal))
    {
        representacao.push_back(literal->unary_operator);
        representacao.push_back(literal->proposition);
    }
    else if (is_a_nil_literal(literal))
    {
        representacao = "";
    }
    else
    {

        representacao.push_back(literal->unary_operator);
        representacao += "(";
        representacao += literal_to_string(literal->first_value);
        representacao += " ";
        representacao += binary_operator_to_string(literal->binary_operator);
        representacao += " ";
        representacao += literal_to_string(literal->second_value);
        representacao += ")";
    }
    return representacao;
}

string binary_operator_to_string(char anOperator)
{
    string ans = "";
    if (anOperator == '*')
    {
        ans += "->";
    }
    else if (anOperator == '#')
    {
        ans += "<->";
    }
    else
    {
        ans.push_back(anOperator);
    }

    return ans;
}

bool first_value_is_equals(const Literal *l, const Literal *k)
{
    return literals_is_equals(l->first_value, k->first_value);
}

bool second_value_is_equals(const Literal *l, const Literal *k)
{
    return literals_is_equals(l->second_value, k->second_value);
}

bool literals_is_equals(const Literal *l, const Literal *k)
{
    bool answer = true;
    answer &= unary_operator_is_equals(l, k);
    if (is_atomic_proposition(l))
    {
        if (is_atomic_proposition(k))
        {
            answer &= propositions_is_equals(l, k);
        }
        else
        {
            answer &= false;
        }
    }
    else
    {
        if (is_atomic_proposition(k))
        {
            answer &= false;
        }
        else
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

bool propositions_is_equals(const Literal *l, const Literal *k)
{
    return k->proposition == l->proposition;
}

bool unary_operator_is_equals(const Literal *l, const Literal *k)
{
    return k->unary_operator == l->unary_operator;
}

bool is_a_negate_atomic_proposition(const Literal *l)
{
    return is_atomic_proposition(l) && l->unary_operator == '~';
}

// method merely illustrative never gets used
bool is_atomic_proposition(const Literal *l)
{
    return l->second_value == nullptr && l->binary_operator == empty_str and l->proposition != empty_str;
}

void set_second_value(Literal *l)
{
    l->second_value = new Literal;
}

void set_first_value(Literal *l)
{
    l->first_value = new Literal;
}

void set_proposition_value(Literal *l, char value)
{
    if (is_a_valid_proposition(value))
    {
        l->proposition = value;
    }
}

bool is_a_valid_proposition(char value)
{
    bool ans = false;
    for (int i = 65; i <= 122; i++)
    {
        ans |= value == (char)i; // return's true if value in range of A... Z or a...z
    }

    return ans;
}

void set_binary_operator(Literal *l, char value)
{
    switch (value)
    {
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

    if (is_binary_operator(value))
    {
        l->binary_operator = value;
    }
}

bool is_binary_operator(char value)
{
    return value == '*' || value == '#' || value == '&' || value == '|';
}

void set_unary_operator(Literal *l, char value)
{
    if (value == '~')
    {
        l->unary_operator = value;
    }
}

void build_a_new_literal(Literal *current, char unary_operator, char binary_operator, Literal *first_value,
                         Literal *second_value)
{
    set_unary_operator(current, unary_operator);
    set_binary_operator(current, binary_operator);
    set_binary_operator(current, binary_operator);
    current->first_value = first_value;
    current->second_value = second_value;
}

void build_a_proposition(Literal *literal, char proposition, char unary_operator)
{
    literal->unary_operator = unary_operator;
    set_proposition_value(literal, proposition);
    (unary_operator == '~') ? literal->is_atomic_proposition = false : literal->is_atomic_proposition = true;
}

void print_info()
{
    cout << " Um Literal eh uma expressao booleana." << endl;
    cout << " Eh composto por uma Proposicao ou Expressao, um Operador Binario, e outra Proposicao ou Expressao." << endl << endl;
}

string choose_a_proposition()
{
    string value = "";
    cout << " Digite a Variavel associada a sua Proposicao:" << endl;
    cout << " >>> ";
    cin  >> value;
    cout << endl;
    return value;
}

char choose_a_binary_operator()
{
    string binary_operator_value;
    char char_value;
    cout << " Escolha entre os Operadores abaixo: " << endl;
    cout << " E: &, ^, ." << endl
         << " Ou: |, v, +" << endl
         << " Implica: ->, *" << endl;
    cout << " Bi-Implica: <->, #" << endl;
    cout << " >>> ";
    cin  >> binary_operator_value;
    cout << endl;


    switch (binary_operator_value.at(0))
    {
        case '-':
            char_value = '*';
            break;
        case '<':
            char_value = '#';
            break;
        case '^':
            char_value = '&';
            break;
        case '.':
            char_value = '&';
            break;
        case 'v':
            char_value = '|';
            break;
        case '+':
            char_value = '|';
            break;
        default:
            char_value = binary_operator_value.at(0);
            break;
    }
    
    return char_value;
}

char choose_a_unary_operator()
{
    char op;
    char unary_operator_value;
    
    cout << " Deseja fazer sua Proposicao ser Negada?" << endl
         << " 1 - Sim" << endl
         << " 2 - Nao" << endl;
    cout << ">>> ";
    
    cin  >> op;
    cout << endl;
    
    if (op == '1')
    {
        unary_operator_value = '~';
    }
    else
    {
        unary_operator_value = empty_str;
    }
    
    cout << endl
         << endl;
    return unary_operator_value;
}

void report_error_1()
{
    cout << " Algo de errado nao esta certo. Tente novamente!";
}

void choose_a_option_1()
{
    cout << "1- Para inserir uma Proposicao" << endl
         << "2- Para inserir uma Expressao" << endl;
}

void about_a_literal()
{
    cout << " Uma proposicao, pode ser considerada de duas formas." << endl;
    cout << " Uma Proposicao Atomica: Quando soh possui um valor, e pode conter um Operador Unario." << endl;
    cout << " Exemplo: ~p" << endl;
    cout << " Uma Expressao Composta: Que pode conter um Operador Unario, porem possui sempre um Primeiro Valor," << endl;
    cout << " um Segundo Valor, e conectando eles temos um Operador Binario." << endl << "Exemplo: (P | Q) & R" << endl << endl;
}

void *_receive_input(Literal *l)
{
    choose_a_option_1();
    cout << " >>> ";
    char option;
    cin  >> option;
    cout << endl;

    if (option == '2') // creates a new Literal, (P | Q) & R
    {

        Literal *first_value;
        Literal *second_value;
        first_value = new Literal;
        second_value = new Literal;

        l->unary_operator = choose_a_unary_operator();
        
        _receive_input(first_value);
        l->first_value = first_value;

        l->binary_operator = choose_a_binary_operator();
        
        _receive_input(second_value);
        l->second_value = second_value;
    } else if (option == '1')
    {
        const string &basicString = choose_a_proposition();
        char proposition, unary_operator;

        if (basicString.size() == 2)
        {
            proposition = basicString.at(1);
            unary_operator = basicString.at(0);
        }
        else
        {
            proposition = basicString.at(0);
            unary_operator = (char)0;
        }

        build_a_proposition(l, proposition, unary_operator);
    }
    else
    {
        report_error_1();
    }
}

void *receive_input(Literal *l)
{
    cout << endl; // dando um espaco antes de comecar
    print_info();
    about_a_literal();
    _receive_input(l);
}
