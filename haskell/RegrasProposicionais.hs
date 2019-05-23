module RegrasProposicionais where
    
    {-
    Função que retorna o resumo da opção Negação
    -} 
    resumoNegacao :: IO ()
    resumoNegacao = do
        putStrLn " A Dupla Negacao afirma que se temos uma afirmacao verdadeira, logo, se negarmos a negacao dessa afirmacao teremos uma equivalencia com a afirmacao"
        putStrLn " Como regra de simplicacao, temos que ~(~P) = P"
        putStrLn " Quer saber mais sobre a Dupla Negacao?"
    
    {-
    Função que retorna informações adicionais à opção Negação
    -}
    infoNegacao :: IO ()
    infoNegacao = do
        putStrLn " Na notacao simbolica temos:"
        putStrLn " P <--> ~(~P)"
        putStrLn " Exemplo de discurso:"
        putStrLn " P = Game of Thrones estreia hoje."
        putStrLn " ~P = Game of Thrones NAO estreia hoje."
        putStrLn " ~(~P) = Nao eh verdade que Game Of Thrones NAO estreia hoje."
    
    {-
    Função que retorna um resumo da opção Conjunção
    -}
    resumoConjuncao :: IO ()
    resumoConjuncao = do 
        putStrLn " A conjucao eh a combinacao de preposicoes que soh resultarah verdade se ambas as proposicoes forem verdadeiras."
        putStrLn " Como regra de simplicacao, quando temos as preposicoes P, Q, podemos deduzir que  P ^ Q."
        putStrLn " Quer saber mais sobre a conjuncao?"
    

    {-
    Função que retorna informações adicionais da opção conjunção
    -}
    infoConjuncao :: IO ()
    infoConjuncao = do
        putStrLn " Na notacao simbolica temos:"
        putStrLn " P ^ Q"
        putStrLn " Exemplo de discurso:"
        putStrLn " P = Estudei para a prova."
        putStrLn " Q = Tirei uma nota boa"
        putStrLn " P ^ Q = Estudei para a prova E tirei uma nota boa"
        putStrLn " Em operacoes logicas, a conjuncao funciona como a multiplicacao, Exemplo:"
        putStrLn " 1 ^ 1 = 1    1 ^ 0 = 0    0 ^ 0 = 0"
    
    {-
    Função que retorna informações da opção Adição
    -}
    resumoAdicao :: IO()
    resumoAdicao = do
        putStrLn " A adicao irah unir as preposicoes de maneira que se ao menos uma das preposicoes for verdadeira, o resultado serah verdadeiro."
        putStrLn " Como regra de simplicacao, temos que ao possuirmos P, P v Q vai ser verdadeiro, assim como  Q v P."
        putStrLn " Quer saber mais sobre a adicao?"
    
    {-
    Função que retorna informações adicionais da opção Adição
    -}
    infoAdicao :: IO()
    infoAdicao = do
        putStrLn " Na notacao simbolica temos:"
        putStrLn " P v Q"
        putStrLn " Exemplo de discurso:"
        putStrLn " P = Irei ao Sao Joao de Campina"
        putStrLn " Q = Irei a praia em Joao Pessoa"
        putStrLn " P v Q = Irei ao Sao Joao de Campina OU a praia em Joao Pessoa"
        putStrLn " Em operacoes, a adicao conservarah a veracidade, ao menos que nao exista. Exemplo:"
        putStrLn " 1 v 1 = 1    1 v 0 = 1    0 v 0 = 0"
    
    {-
    Função que retorna informações da opção Introdução a Equivalência
    -}
    resumoIntroEquivalencia :: IO()
    resumoIntroEquivalencia = do 
        putStrLn " Atraves de implicacoes distintas com as mesmas proposicoes, podemos deduzir uma bicondicional entre as proposicoes."
        putStrLn" No caso, temos P --> Q, Q --> P, logo podemos deduzir P <--> Q."
    
    {-
    Função que retorna informações da opção Eliminação de Equivalência
    -}
    resumoElimEquivalencia :: IO()
    resumoElimEquivalencia = do
        putStrLn " Atraves de uma bicondicional, podemos deduzir que existe uma implicacao em ambos os termos."
        putStrLn " No caso, temos P <--> Q, podemos deduzir P --> Q, ou Q --> P "
    
    {-
    Função que retorna informações da opção Modus Ponens
    -}
    resumoModusPonens :: IO()
    resumoModusPonens = do
        putStrLn " Atraves de uma implicaçao, caso a implicante seja confirmada, temos a deducao da implicancia."
        putStrLn " Seja P --> Q, tendo P confirmado, podemos deduzir Q."
        putStrLn " Quer saber mais sobre Modus Ponnens?"
    
    {-
    Função que retorna informações adicionais da opção Modus Ponens
    -}
    infoModusPonens :: IO()
    infoModusPonens = do 
        putStrLn " As vezes chamada de regra do desapego, Modus Ponens eh utilizado para a retirada da implicacao, encurtando a formula logica."
        putStrLn " Na notação simbolica temos:"
        putStrLn " P, P --> Q. logo Q"
        putStrLn " Exemplo de discurso:"
        putStrLn " P --> Q = Se tocar o vento eu desisto do show"
        putStrLn " P = Tocou o vento"
        putStrLn " Q = Eu desisti do show"
        putStrLn " Podemos deduzir Q pois em uma implicacao, só existe uma maneira de se existir falsidade, sendo V --> F. Assim numa implicacao quando sabemos que existe veracidade na implicante, dependemos apenas da implicancia."
    
    {-
    Função que retorna informação da opção Modus Tollens
    -}
    resumoModusTollens :: IO()
    resumoModusTollens = do
        putStrLn " A partir de uma implicacao, quando temos a negacao do implicante, podemos deduzir a negacao da implicante."
        putStrLn " Assim P --> Q, ~Q, temos ~P"
        putStrLn " Quer saber mais sobre Modus Tollens?"
    
    {-
    Função que retorna informações adicionais da opção Modus Tollens
    -}
    infoModusTollens :: IO()
    infoModusTollens = do
        putStrLn " Tambem chamado de Prova Indireta, ou negacao consequente, Modus Tollens eh utilizado para a retirada da implicacao, encurtando a formula logica."
        putStrLn " Exemplo de discurso:"
        putStrLn " P --> Q = Se tiver ingressos, então irei assistir Vingadores Ultimato."
        putStrLn " ~Q = Nao irei assistir Vingadores Ultimato."
        putStrLn " ~P = Nao tinha ingressos"
        putStrLn " Podemos deduzir ~P pois em uma implicacao quando temos a negacao da implicancia, so temos a corretude no caso de termos a negacao do implicante. assim no caso F --> V, F --> V continuam corretos"
    
    {-
    Função que retorna informações da opção do Silogismo Hipotético
    -}
    resumoHipotetico :: IO()
    resumoHipotetico = do
        putStrLn " A partir de duas implicacoes onde a implicancia de uma seja o implicante da segunda implicacao, podemos deduzir que o implicante da primeira implica a implicancia da segunda"
        putStrLn " Seja P --> Q, Q --> R entao P --> R"
        putStrLn " Quer saber mais sobre Silogismo Hipotetico?"
    
    {-
    Função que retorna informações adicionais do Silogismo Hipotético
    -}
    infoHipotetico :: IO()
    infoHipotetico = do
        putStrLn " Utilizado na teoria da consequencia, O silogismo hipotetico nao retira a implicacao, apenas diminui o numero de termos e implicacoes presentes na formula."
        putStrLn " Exemplo de discurso:"
        putStrLn " P --> Q = Se sou aluno de Computacao, então estudo programação."
        putStrLn " Q --> R = Se estudo programacao, então sei programar."
        putStrLn " P --> R = Se sou aluno de Computacao, então sei programar."
    

    {-
    Função que retorna informações da opção do Silogismo Disjuntivo
    -}
    resumoDisjuntivo :: IO()
    resumoDisjuntivo = do 
        putStrLn " A partir de uma operação de disjuncao quando temos a negacao de um termo, podemos deduzir o termo restante."
        putStrLn " Seja  P v Q. tendo  ~P, logo temos Q"
        putStrLn " Quer saber mais sobre Silogismo Disjuntivo?"

    {-
    Função que retorna informações adicionais do Silogismo Disjuntivo
    -}
    infoDisjuntivo :: IO()
    infoDisjuntivo = do
        putStrLn " Conhecido historicamente como Modus Tollendo Ponens, o silogismo disjuntivo eh indicado apenas para a simplificacao de termos."
        putStrLn " Exemplo de discurso:"
        putStrLn " P v Q = Eu viajo de ferias ou faço cursinho de ingles."
        putStrLn " ~P = Nao viajo de ferias."
        putStrLn " Q = Entao faco cursinho de ingles."
    
    {-
    Função que retorna informações do Dilema Construtivo
    -}
    resumoDilemaConstrutivo :: IO()
    resumoDilemaConstrutivo = do
        putStrLn " A partir de duas implicacoes totalmente distintas, se possuimos uma disjuncao entre o implicante da primeira com o implicante da segunda implicacao, podemos deduzir uma disjuncao entre a implicancia da primeira com a implicancia da segunda disjuncao."
        putStrLn " Sendo assim P --> Q, R --> S. Tendo P v R, podemos deduzir Q v S"
        putStrLn " Quer saber mais sobre Silogismo Disjuntivo?"
    
    {-
    Função que retorna informações adicionais do Dilema Construtivos
    -}
    infoDilemaConstrutivo :: IO()
    infoDilemaConstrutivo = do
        putStrLn " Tambam conhecido como dilema de transferencia, serve para a simplificacao de duas implicacoes resultando em uma disjuncao"
        putStrLn " Exemplo de discurso:"
        putStrLn " P --> Q = Se eu me formei, entao eu tenho emprego."
        putStrLn " R --> S = Se eu tenho dinheiro, entao tenho um carro."
        putStrLn " P v R = Eu me formei ou tenho dinheiro."
        putStrLn " Q v S = Eu tenho um emprego ou tenho um carro."
    
    {-
    Função que retorna informações da opção Exportação
    -}
    resumoExportacao :: IO()
    resumoExportacao = do 
        putStrLn " A partir de uma implicacao, se o implicante for formado por uma conjuncao, podemos deduzir uma implicacao do primeiro termo da conjuncao implicando numa implicacao do segundo termo da conjuncao implicando na implicancia original."
        putStrLn " Sendo (P ^ Q) --> S, temos P --> (Q --> S)."
    
    {-
    Função que retorna a lista de opções da classe
    -}
    menuRegras :: IO()
    menuRegras = do 
        putStrLn "\t\t --- Lista de Regras --- "
        putStrLn " \t1 - Negação;"
        putStrLn " \t2 - Conjunção;"
        putStrLn " \t3 - Adição;"
        putStrLn " \t4 - Introdução da Equivalência;"
        putStrLn " \t5 - Eliminação da Equivalência;"
        putStrLn " \t6 - Modus Ponens;"
        putStrLn " \t7 - Modus Tollens;"
        putStrLn " \t8 - Silogismo Hipotético;"
        putStrLn " \t9 - Silogismo Disjuntivo;"
        putStrLn " \t10 - Dilema Construtivo;"
        putStrLn " \t11 - Exportação;"
        putStrLn " \t0 - Voltar ao menu principal;\n"
        putStrLn " Digite a sua opção!"
    
    {-
    Função que valida a resposta do usuário
    -}
    valida :: String -> Bool
    valida resposta = 
        if (resposta == "sim") then True
        else False
    
    {-
    Menu de opção de entrada para as regras
    -}
    opcoesRegras :: Int -> IO()
    opcoesRegras opc
        | opc == 1 = do
            resumoNegacao
            putStr " >>> ";
            resp <- getLine
            if (valida resp) 
                then infoNegacao
            else putStrLn " tudo bem! ate mais ver em frances, Au re voir!"

        | opc == 2 = do
            resumoConjuncao
            putStr " >>> ";
            resp <- getLine
            if (valida resp) 
                then infoConjuncao
            else putStr " tudo bem! ate mais ver em frances, Au re voir!"
        
        | opc == 3 = do
            resumoAdicao
            putStr " >>> ";
            resp <- getLine
            if (valida resp) 
                then infoAdicao
            else putStr " tudo bem! ate mais ver em frances, Au re voir!"
        
        | opc == 4 = do
            resumoIntroEquivalencia
        
        | opc == 5 = do
            resumoElimEquivalencia
        
        | opc == 6 = do
            resumoModusPonens
            putStr " >>> ";
            resp <- getLine
            if (valida resp) 
                then infoModusPonens
            else putStr " tudo bem! ate mais ver em frances, Au re voir!"
        
        | opc == 7 = do
            resumoModusTollens
            putStr " >>> ";
            resp <- getLine
            if (valida resp) 
                then infoModusTollens
            else putStr " tudo bem! ate mais ver em frances, Au re voir!"
        
        | opc == 8 = do
            resumoHipotetico
            putStr " >>> ";
            resp <- getLine
            if (valida resp) 
                then infoHipotetico
            else putStr " tudo bem! ate mais ver em frances, Au re voir!"
        
        | opc == 9 = do
            resumoDisjuntivo
            putStr " >>> ";
            resp <- getLine
            if (valida resp) 
                then infoDisjuntivo
            else putStr " tudo bem! ate mais ver em frances, Au re voir!"
        
        | opc == 10 = do 
            resumoDilemaConstrutivo
            putStr " >>> ";
            resp <- getLine
            if (valida resp) 
                then infoDilemaConstrutivo
            else putStr " tudo bem! ate mais ver em frances, Au re voir!"
        
        | opc == 11 = do
            resumoExportacao
        
        | opc == 0 = putStr "" -- tenho que retornar algo aqui
        
        | otherwise = do
            putStrLn " Abaixa o volume da TV e me escuta pelo telefone! pode repetir?"

    {-
    Função que simula o laço em regras proposicionais
    -}
    laco :: Int -> IO()
    laco 0 = putStrLn " Ciao! "
    laco opc = do 
        menuRegras
        putStr " >>> "
        opc <- readLn :: IO Int
        opcoesRegras opc

        laco opc
        
    {-
    Função de chamada na classe main do projeto
    -}
    execRegras :: IO()
    execRegras = laco 666 -- tem que iniciar com um Int qualquer ...
