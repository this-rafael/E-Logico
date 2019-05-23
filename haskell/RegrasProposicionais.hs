module RegrasProposicionais where
--mudanca para criacao de branch
    resumoNegacao :: IO ()
    resumoNegacao = do
        putStrLn " A Dupla Negacao afirma que se temos uma afirmacao verdadeira, logo, se negarmos a negacao dessa afirmacao teremos uma equivalencia com a afirmacao"
        putStrLn " Como regra de simplicacao, temos que ~(~P) = P"
        putStrLn " Quer saber mais sobre a Dupla Negacao?"
    
    infoNegacao :: IO ()
    infoNegacao = do
        putStrLn " Na notacao simbolica temos:"
        putStrLn " P <--> ~(~P)"
        putStrLn " Exemplo de discurso:"
        putStrLn " P = Game of Thrones estreia hoje."
        putStrLn " ~P = Game of Thrones NAO estreia hoje."
        putStrLn " ~(~P) = Nao eh verdade que Game Of Thrones NAO estreia hoje."
    
    resumoConjuncao :: IO ()
    resumoConjuncao = do 
        putStrLn " A conjucao eh a combinacao de preposicoes que soh resultarah verdade se ambas as proposicoes forem verdadeiras."
        putStrLn " Como regra de simplicacao, quando temos as preposicoes P, Q, podemos deduzir que  P ^ Q."
        putStrLn " Quer saber mais sobre a conjuncao?"
    
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
    
    resumoAdicao :: IO()
    resumoAdicao = do
        putStrLn " A adicao irah unir as preposicoes de maneira que se ao menos uma das preposicoes for verdadeira, o resultado serah verdadeiro."
        putStrLn " Como regra de simplicacao, temos que ao possuirmos P, P v Q vai ser verdadeiro, assim como  Q v P."
        putStrLn " Quer saber mais sobre a adicao?"
    
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
    
    resumoIntroEquivalencia :: IO()
    resumoIntroEquivalencia = do 
        putStrLn " Atraves de implicacoes distintas com as mesmas proposicoes, podemos deduzir uma bicondicional entre as proposicoes."
        putStrLn" No caso, temos P --> Q, Q --> P, logo podemos deduzir P <--> Q."
    
    resumoElimEquivalencia :: IO()
    resumoElimEquivalencia = do
        putStrLn " Através de uma bicondicional, podemos deduzir que existe uma implicação em ambos os termos."
        putStrLn " No caso, temos P <--> Q, podemos deduzir P --> Q, ou Q --> P "
    
    resumoModusPonens :: IO()
    resumoModusPonens = do
        putStrLn " Através de uma implicação, caso a implicante seja confirmada, temos a dedução da implicância."
        putStrLn " Seja P --> Q, tendo P confirmado, podemos deduzir Q."
        putStrLn " Quer saber mais sobre Modus Ponnens?"
    
    infoModusPonens :: IO()
    infoModusPonens = do 
        putStrLn " As vezes chamada de regra do desapego, Modus Ponens é utilizado para a retirada da implicação, encurtando a fórmula lógica."
        putStrLn " Na notação simbólica temos:"
        putStrLn " P, P --> Q. logo Q"
        putStrLn " Exemplo de discurso:"
        putStrLn " P --> Q = Se tocar O vento eu desisto do show"
        putStrLn " P = Tocou o vento"
        putStrLn " Q = Eu desisti do show"
        putStrLn " Podemos deduzir Q pois em uma implicação, só existe uma maneira de se existir falsidade, sendo V --> F. Assim numa implicação quando sabemos que existe veracidade na implicante, dependemos apenas da implicância."
    
    resumoModusTollens :: IO()
    resumoModusTollens = do
        putStrLn " A partir de uma implicação, quando temos a negação do implicante, podemos deduzir a negação da implicante."
        putStrLn " Assim P --> Q, ~Q, temos ~P"
        putStrLn " Quer saber mais sobre Modus Tollens?"
    
    infoModusTollens :: IO()
    infoModusTollens = do
        putStrLn " Também chamado de Prova Indireta, ou negação consequente, Modus Tollens é utilizado para a retirada da implicação, encurtando a fórmula lógica."
        putStrLn " Exemplo de discurso:"
        putStrLn " P --> Q = Se tiver ingressos, então irei assistir Vingadores Ultimato."
        putStrLn " ~Q = Não irei assistir Vingadores Ultimato."
        putStrLn " ~P = Não tinha ingressos"
        putStrLn " Podemos deduzir ~P pois em uma implicação quando temos a negação da implicÂncia, só temos a corretude no caso de termos a negação do implicante. assim no caso F --> V, F --> V continuam corretos"
    
    resumoHipotetico :: IO()
    resumoHipotetico = do
        putStrLn " A partir de duas implicações onde a implicância de uma seja o implicante da segunda implicação, podemos deduzir que o implicante da primeira implica a implicância da segunda"
        putStrLn " Seja P --> Q, Q --> R então P --> R"
        putStrLn " Quer saber mais sobre Silogismo Hipotético?"
    
    infoHipotetico :: IO()
    infoHipotetico = do
        putStrLn " Utilizado na teoria da consequência, O silogismo hipotético não retira a implicação, apenas diminui o numero de termos e implicações presentes na fórmula."
        putStrLn " Exemplo de discurso:"
        putStrLn " P --> Q = Se sou aluno de Computação, então estudo programação."
        putStrLn " Q --> R = Se estudo programação, então sei programar."
        putStrLn " P --> R = Se sou aluno de Computação, então sei programar."
    

    resumoDisjuntivo :: IO()
    resumoDisjuntivo = do 
        putStrLn " A partir de uma operação de disjunção quando temos a negação de um termo, podemos deduzir o termo restante."
        putStrLn " Seja  P v Q. tendo  ~P, logo temos Q"
        putStrLn " Quer saber mais sobre Silogismo Disjuntivo?"

    infoDisjuntivo :: IO()
    infoDisjuntivo = do
        putStrLn " Conhecido historicamente como Modus Tollendo Ponens, o silogismo disjuntivo é indicado apenas para a simplificação de termos."
        putStrLn " Exemplo de discurso:"
        putStrLn " P v Q = Eu viajo de férias ou faço cursinho de inglês."
        putStrLn " ~P = não viajo de férias."
        putStrLn " Q = Então faço cursinho de inglês."
    
    resumoDilemaConstrutivo :: IO()
    resumoDilemaConstrutivo = do
        putStrLn " A partir de duas implicações totalmente distintas, se possuímos uma disjunção entre o implicante da primeira com o implicante da segunda implicação, podemos deduzir uma disjunção entre a implicância da primeira com a implicância da segunda disjunção."
        putStrLn " Sendo assim P --> Q, R --> S. Tendo P v R, podemos deduzir Q v S"
        putStrLn " Quer saber mais sobre Silogismo Disjuntivo?"
    
    infoDilemaConstrutivo :: IO()
    infoDilemaConstrutivo = do
        putStrLn " Também conhecido como dilema de transferência, serve para a simplificação de duas implicações resultando em uma disjunção"
        putStrLn " Exemplo de discurso:"
        putStrLn " P --> Q = Se eu me formei, então eu tenho emprego."
        putStrLn " R --> S = Se eu tenho dinheiro, então tenho um carro."
        putStrLn " P v R = Eu me formei ou tenho dinheiro."
        putStrLn " Q v S = Eu tenho um emprego ou tenho um carro."
    
    resumoExportacao :: IO()
    resumoExportacao = do 
        putStrLn " A partir de uma implicação, se o implicante for formado por uma conjunção, podemos deduzir uma implicação do primeiro termo da conjunção implicando numa implicação do segundo termo da conjunção implicando na implicância original."
        putStrLn " Sendo (P ^ Q) --> S, temos P --> (Q --> S)."
    
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
    
    valida :: String -> Bool
    valida resposta = 
        if (resposta == "sim") then True
        else False
    
    opcoesRegras :: Int -> IO()
    opcoesRegras opc
        | opc == 1 = do
            resumoNegacao
            putStr " >>> ";
            resp <- getLine
            if (valida resp) 
                then infoNegacao
            else putStrLn "tudo bem! até mais ver em francês, Au re voir!"

        | opc == 2 = do
            resumoConjuncao
            putStr " >>> ";
            resp <- getLine
            if (valida resp) 
                then infoConjuncao
            else putStr "tudo bem! até mais ver em francês, Au re voir!"
        
        | opc == 3 = do
            resumoAdicao
            putStr " >>> ";
            resp <- getLine
            if (valida resp) 
                then infoAdicao
            else putStr "tudo bem! até mais ver em francês, Au re voir!"
        
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
            else putStr "tudo bem! até mais ver em francês, Au re voir!"
        
        | opc == 7 = do
            resumoModusTollens
            putStr " >>> ";
            resp <- getLine
            if (valida resp) 
                then infoModusTollens
            else putStr "tudo bem! até mais ver em francês, Au re voir!"
        
        | opc == 8 = do
            resumoHipotetico
            putStr " >>> ";
            resp <- getLine
            if (valida resp) 
                then infoHipotetico
            else putStr "tudo bem! até mais ver em francês, Au re voir!"
        
        | opc == 9 = do
            resumoDisjuntivo
            putStr " >>> ";
            resp <- getLine
            if (valida resp) 
                then infoDisjuntivo
            else putStr "tudo bem! até mais ver em francês, Au re voir!"
        
        | opc == 10 = do 
            resumoDilemaConstrutivo
            putStr " >>> ";
            resp <- getLine
            if (valida resp) 
                then infoDilemaConstrutivo
            else putStr "tudo bem! até mais ver em francês, Au re voir!"
        
        | opc == 11 = do
            resumoExportacao
        
        | opc == 0 = putStr "" -- tenho que retornar algo aqui
        
        | otherwise = do
            putStrLn " Abaixa o volume da TV e me escuta pelo telefone! pode repetir?"
    
    laco :: Int -> IO()
    laco 0 = putStrLn " Ciao! "
    laco opc = do 
        menuRegras
        putStr " >>> "
        opc <- readLn :: IO Int
        opcoesRegras opc

        laco opc


    execRegras :: IO()
    execRegras = laco 666 -- tem que iniciar com um Int qualquer ...
