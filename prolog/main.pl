:- initialization main.
:- [util_interface].
:- [menu].
:- [regrasProposicionais].
:- [truth_table_generator].
:- [simplificador_logico].
:- [conversor].


main :-
    tty_clear,
    menuApresentacao(), nl,
    loop.

menuApresentacao:-
    % tty_clear,
    auxMenuApresentacao().

loop:-
    %metodo de apresentacao de opcoes
    menuOpcoes(), nl,
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
    truth_table_generator(), tty_clear, loop.
conversor:-
    execConversor(), loop.
simplificadorLogico:-
    % tty_clear,
    call_main(), loop.
regrasProposicionais:-
    % tty_clear,
    loopRegrasProposicionais() , loop.
