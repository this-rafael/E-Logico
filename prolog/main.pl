:- initialization main.
:- [util_interface].
/*
    -Aqui você deposita a chamada do seu módulo.
    Você pode modularizar sua classe adicionando um 
        :- module(nomeDaSuaClasse,[]) 
    no inicio da sua classe.
    -Depois é só invoca-lá aqui 
    exemplos: 
              |
              v
*/
%:-use_module('simplificador_logico').
:- [truth_table_generator].


main :-
    menuApresentacao, nl,
    loop.

menuApresentacao:-
    % tty_clear,
    write("MenuApresentacao aqui").

loop:-
    %metodo de apresentacao de opcoes
    write('menu vem aqui'),nl,
    read_line_to_string(user_input, Entrada),
        (Entrada = "1" -> truthTable;
         Entrada = "2" -> conversor;
         Entrada = "3" -> simplificadorLogico;
         Entrada = "4" -> regrasProposicionais;
         Entrada = "0" -> write("Espero que volte novamente!!!"), nl, halt(0)).

 /*Aqui vai vir todos os métodos das classes que virão a ser criadas! 
    Se atentem que o loop tem que ser chamado após o final do processo pra voltar 
    para o menu. por favorzinho não esquecer do LOOP.
 */
truthTable:-
    % tty_clear,
    truth_table_generator(), loop.
conversor:-
    % tty_clear,
    writeln('aqui vem o conversor'), loop.
simplificadorLogico:-
    % tty_clear,
    writeln('aqui vem o simplificadorLogico'), loop.
regrasProposicionais:-
    % tty_clear,
    writeln('aqui aparece as coisas das regrasProposicionais'), loop.
