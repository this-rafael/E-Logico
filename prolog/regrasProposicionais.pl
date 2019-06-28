:- [menu].

resumoRegras() :-
    writeln("\n Regras para simplificacao de expressoes logicas\n"),
    writeln(" Aqui vamos apresentar algumas regras para as simplificacao de expressoes logicas complexas em expressoes simples!\n").


resumoNegacao() :-
    writeln("\n A Dupla Negacao afirma que se temos uma afirmacao verdadeira, logo, se negarmos a negacao dessa afirmacao teremos uma equivalencia com a afirmacao"),
    writeln(" Como regra de simplicacao, temos que ~(~P) = P"),
    writeln(" Quer saber mais sobre a Dupla Negacao?").
    
 
infoNegacao() :-
    writeln("\n Na notacao simbolica temos:"),
    writeln(" P <--> ~(~P)"),
    writeln(" Exemplo de discurso:"),
    writeln(" P = Game of Thrones estreia hoje."),
    writeln(" ~P = Game of Thrones NAO estreia hoje."),
    writeln(" ~(~P) = Nao eh verdade que Game Of Thrones NAO estreia hoje.").
    

resumoConjuncao() :- 
    writeln("\n A conjucao eh a combinacao de preposicoes que soh resultarah verdade se ambas as proposicoes forem verdadeiras."),
    writeln(" Como regra de simplicacao, quando temos as preposicoes P, Q, podemos deduzir que  P ^ Q."),
    writeln(" Quer saber mais sobre a conjuncao?").
    

infoConjuncao() :-
    writeln("\n Na notacao simbolica temos:"),
    writeln(" P ^ Q"),
    writeln(" Exemplo de discurso:"),
    writeln(" P = Estudei para a prova."),
    writeln(" Q = Tirei uma nota boa"),
    writeln(" P ^ Q = Estudei para a prova E tirei uma nota boa"),
    writeln(" Em operacoes logicas, a conjuncao funciona como a multiplicacao, Exemplo:"),
    writeln(" 1 ^ 1 = 1    1 ^ 0 = 0    0 ^ 0 = 0").
    

resumoAdicao() :-
    writeln("\n A adicao irah unir as preposicoes de maneira que se ao menos uma das preposicoes for verdadeira, o resultado serah verdadeiro."),
    writeln(" Como regra de simplicacao, temos que ao possuirmos P, P v Q vai ser verdadeiro, assim como  Q v P."),
    writeln(" Quer saber mais sobre a adicao?").
    

infoAdicao() :-
    writeln("\n Na notacao simbolica temos:"),
    writeln(" P v Q"),
    writeln(" Exemplo de discurso:"),
    writeln(" P = Irei ao Sao Joao de Campina"),
    writeln(" Q = Irei a praia em Joao Pessoa"),
    writeln(" P v Q = Irei ao Sao Joao de Campina OU a praia em Joao Pessoa"),
    writeln(" Em operacoes, a adicao conservarah a veracidade, ao menos que nao exista. Exemplo:"),
    writeln(" 1 v 1 = 1    1 v 0 = 1    0 v 0 = 0").
    

resumoIntroEquivalencia() :-
    writeln("\n Atraves de implicacoes distintas com as mesmas proposicoes, podemos deduzir uma bicondicional entre as proposicoes."),
    writeln(" No caso, temos P --> Q, Q --> P, logo podemos deduzir P <--> Q.").
    

resumoElimEquivalencia() :-
    writeln("\n Atraves de uma bicondicional, podemos deduzir que existe uma implicacao em ambos os termos."),
    writeln(" No caso, temos P <--> Q, podemos deduzir P --> Q, ou Q --> P ").
    

resumoModusPonens() :-
    writeln("\n Atraves de uma implicaçao, caso a implicante seja confirmada, temos a deducao da implicancia."),
    writeln(" Seja P --> Q, tendo P confirmado, podemos deduzir Q."),
    writeln(" Quer saber mais sobre Modus Ponnens?").
    

infoModusPonens() :-
    writeln("\n As vezes chamada de regra do desapego, Modus Ponens eh utilizado para a retirada da implicacao, encurtando a formula logica."),
    writeln(" Na notação simbolica temos:"),
    writeln(" P, P --> Q. logo Q"),
    writeln(" Exemplo de discurso:"),
    writeln(" P --> Q = Se tocar o vento eu desisto do show"),
    writeln(" P = Tocou o vento"),
    writeln(" Q = Eu desisti do show"),
    writeln(" Podemos deduzir Q pois em uma implicacao, só existe uma maneira de se existir falsidade, sendo V --> F."),
    writeln(" Assim numa implicacao, quando sabemos que existe veracidade na implicante, dependemos apenas da implicancia.").
    

resumoModusTollens() :-
    writeln("\n A partir de uma implicacao, quando temos a negacao do implicante, podemos deduzir a negacao da implicante."),
    writeln(" Assim P --> Q, ~Q, temos ~P"),
    writeln(" Quer saber mais sobre Modus Tollens?").
    

infoModusTollens() :-
    writeln("\n Tambem chamado de Prova Indireta, ou negacao consequente, Modus Tollens eh utilizado para a retirada da implicacao, encurtando a formula logica."),
    writeln(" Exemplo de discurso:"),
    writeln(" P --> Q = Se tiver ingressos, então irei assistir Vingadores Ultimato."),
    writeln(" ~Q = Nao irei assistir Vingadores Ultimato."),
    writeln(" ~P = Nao tinha ingressos"),
    writeln(" Podemos deduzir ~P pois em uma implicacao quando temos a negacao da implicancia, so temos a corretude no caso de termos a negacao do implicante."),
    writeln(" Assim no caso F --> V, F --> V continuam corretos").
    

resumoHipotetico() :-
    writeln("\n A partir de duas implicacoes onde a implicancia de uma seja o implicante da segunda implicacao, podemos deduzir que o implicante da primeira implica a implicancia da segunda"),
    writeln(" Seja P --> Q, Q --> R entao P --> R"),
    writeln(" Quer saber mais sobre Silogismo Hipotetico?").
    

infoHipotetico() :-
    writeln("\n Utilizado na teoria da consequencia, O silogismo hipotetico nao retira a implicacao, apenas diminui o numero de termos e implicacoes presentes na formula."),
    writeln(" Exemplo de discurso:"),
    writeln(" P --> Q = Se sou aluno de Computacao, então estudo programação."),
    writeln(" Q --> R = Se estudo programacao, então sei programar."),
    writeln(" P --> R = Se sou aluno de Computacao, então sei programar.").


resumoDisjuntivo() :-
    writeln(" A partir de uma operação de disjuncao quando temos a negacao de um termo, podemos deduzir o termo restante."),
    writeln(" Seja  P v Q. tendo  ~P, logo temos Q"),
    writeln(" Quer saber mais sobre Silogismo Disjuntivo?").


infoDisjuntivo() :-
    writeln(" Conhecido historicamente como Modus Tollendo Ponens, o silogismo disjuntivo eh indicado apenas para a simplificacao de termos."),
    writeln(" Exemplo de discurso:"),
    writeln(" P v Q = Eu viajo de ferias ou faço cursinho de ingles."),
    writeln(" ~P = Nao viajo de ferias."),
    writeln(" Q = Entao faco cursinho de ingles.").
    

resumoDilemaConstrutivo() :-
    writeln(" A partir de duas implicacoes totalmente distintas, se possuimos uma disjuncao entre o implicante da primeira com o implicante da segunda implicacao, podemos deduzir uma disjuncao entre a implicancia da primeira com a implicancia da segunda disjuncao."),
    writeln(" Sendo assim P --> Q, R --> S. Tendo P v R, podemos deduzir Q v S"),
    writeln(" Quer saber mais sobre Silogismo Disjuntivo?").
    

infoDilemaConstrutivo() :-
    writeln(" Tambam conhecido como dilema de transferencia, serve para a simplificacao de duas implicacoes resultando em uma disjuncao"),
    writeln(" Exemplo de discurso:"),
    writeln(" P --> Q = Se eu me formei, entao eu tenho emprego."),
    writeln(" R --> S = Se eu tenho dinheiro, entao tenho um carro."),
    writeln(" P v R = Eu me formei ou tenho dinheiro."),
    writeln(" Q v S = Eu tenho um emprego ou tenho um carro.").
    

resumoExportacao() :-
    writeln(" A partir de uma implicacao, se o implicante for formado por uma conjuncao, podemos deduzir uma implicacao do primeiro termo da conjuncao implicando numa implicacao do segundo termo da conjuncao implicando na implicancia original."),
    writeln(" Sendo (P ^ Q) --> S, temos P --> (Q --> S).").



/************************************************************ INTERAÇÕES ****************************************************************************************************************/


menuRegras() :-
    writeln("\t\t --- Lista de Regras --- "),
    writeln(" \t1 - Negação;"),
    writeln(" \t2 - Conjunção;"),
    writeln(" \t3 - Adição;"),
    writeln(" \t4 - Introdução da Equivalência;"),
    writeln(" \t5 - Eliminação da Equivalência;"),
    writeln(" \t6 - Modus Ponens;"),
    writeln(" \t7 - Modus Tollens;"),
    writeln(" \t8 - Silogismo Hipotético;"),
    writeln(" \t9 - Silogismo Disjuntivo;"),
    writeln(" \t10 - Dilema Construtivo;"),
    writeln(" \t11 - Exportação;"),
    writeln(" \t0 - Voltar ao menu principal;\n"),
    writeln(" Digite a sua opção!").

valida(Resposta, Return) :- 
    (Resposta == "sim"), Return = true;
    Return = false.
    

user_choice(1) :-
    resumoNegacao,
    write(" >>> "), aux_str_input(Answer),
    (Answer == "sim"), infoNegacao;
    write(" tudo bem! ate mais ver em frances, Au re voir!").

user_choice(2) :-
    resumoConjuncao,
    write(" >>> "), aux_str_input(Answer),
    (Answer == "sim"), infoConjuncao;
    write(" tudo bem! ate mais ver em frances, Au re voir!").

user_choice(3) :-
    resumoAdicao,
    write(" >>> "), aux_str_input(Answer),
    (Answer == "sim"), infoAdicao;
    write(" tudo bem! ate mais ver em frances, Au re voir!").

user_choice(4) :-
    resumoIntroEquivalencia.
        
user_choice(5) :-
    resumoElimEquivalencia.

user_choice(6) :-
    resumoModusPonens,
    write(" >>> "), aux_str_input(Answer),
    (Answer == "sim"), infoModusPonens;
    write(" tudo bem! ate mais ver em frances, Au re voir!").
        
user_choice(7) :-
    resumoModusTollens,
    write(" >>> "), aux_str_input(Answer),
    (Answer == "sim"), infoModusTollens;
    write(" tudo bem! ate mais ver em frances, Au re voir!").

user_choice(8) :-
    resumoHipotetico,
    write(" >>> "), aux_str_input(Answer),
    (Answer == "sim"), infoHipotetico;
    write(" tudo bem! ate mais ver em frances, Au re voir!").

user_choice(9) :-
    resumoDisjuntivo,
    write(" >>> "), aux_str_input(Answer),
    (Answer == "sim"), infoDisjuntivo;
    write(" tudo bem! ate mais ver em frances, Au re voir!").

user_choice(10) :-
    resumoDilemaConstrutivo,
    write(" >>> "), aux_str_input(Answer),
    (Answer == "sim"), infoDilemaConstrutivo;
    write(" tudo bem! ate mais ver em frances, Au re voir!").
        
user_choice(11) :- 
    resumoExportacao.
        

user_user_choiceDefault() :-
    write(" Abaixa o volume da TV e me escuta pelo telefone! pode repetir?").


loopRegrasProposicionais() :-
    menuRegras(), nl, writeln(" >>> "),
    read_line_to_string(user_input, Entrada),
    (Entrada = "1" -> user_choice(1);
    Entrada = "2" -> user_choice(2);
    Entrada = "3" -> user_choice(3);
    Entrada = "4" -> user_choice(4);
    Entrada = "5" -> user_choice(5);
    Entrada = "6" -> user_choice(6);
    Entrada = "7" -> user_choice(7);
    Entrada = "8" -> user_choice(8);
    Entrada = "9" -> user_choice(9);
    Entrada = "10" -> user_choice(10);
    Entrada = "11" -> user_choice(11);
    Entrada = "0" -> write("Espero que volte novamente!!!"), nl; 
    user_user_choiceDefault()),
    loopRegrasProposicionais().