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
        putStrLn " Através de uma bicondicional, podemos deduzir que existe uma implicação em ambos os termos."
        putStrLn " No caso, temos P <--> Q, podemos deduzir P --> Q, ou Q --> P "
    
    {-
    Função que retorna informações da opção Modus Ponens
    -}
    resumoModusPonens :: IO()
    resumoModusPonens = do
        putStrLn " Através de uma implicação, caso a implicante seja confirmada, temos a dedução da implicância."
        putStrLn " Seja P --> Q, tendo P confirmado, podemos deduzir Q."
        putStrLn " Quer saber mais sobre Modus Ponnens?"
    
    {-
    Função que retorna informações adicionais da opção Modus Ponens
    -}
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
    
    {-
    Função que retorna informação da opção Modus Tollens
    -}
    resumoModusTollens :: IO()
    resumoModusTollens = do
        putStrLn " A partir de uma implicação, quando temos a negação do implicante, podemos deduzir a negação da implicante."
        putStrLn " Assim P --> Q, ~Q, temos ~P"
        putStrLn " Quer saber mais sobre Modus Tollens?"
    
    {-
    Função que retorna informações adicionais da opção Modus Tollens
    -}
    infoModusTollens :: IO()
    infoModusTollens = do
        putStrLn " Também chamado de Prova Indireta, ou negação consequente, Modus Tollens é utilizado para a retirada da implicação, encurtando a fórmula lógica."
        putStrLn " Exemplo de discurso:"
        putStrLn " P --> Q = Se tiver ingressos, então irei assistir Vingadores Ultimato."
        putStrLn " ~Q = Não irei assistir Vingadores Ultimato."
        putStrLn " ~P = Não tinha ingressos"
        putStrLn " Podemos deduzir ~P pois em uma implicação quando temos a negação da implicÂncia, só temos a corretude no caso de termos a negação do implicante. assim no caso F --> V, F --> V continuam corretos"
    
    {-
    Função que retorna informações da opção do Silogismo Hipotético
    -}
    resumoHipotetico :: IO()
    resumoHipotetico = do
        putStrLn " A partir de duas implicações onde a implicância de uma seja o implicante da segunda implicação, podemos deduzir que o implicante da primeira implica a implicância da segunda"
        putStrLn " Seja P --> Q, Q --> R então P --> R"
        putStrLn " Quer saber mais sobre Silogismo Hipotético?"
    
    {-
    Função que retorna informações adicionais do Silogismo Hipotético
    -}
    infoHipotetico :: IO()
    infoHipotetico = do
        putStrLn " Utilizado na teoria da consequência, O silogismo hipotético não retira a implicação, apenas diminui o numero de termos e implicações presentes na fórmula."
        putStrLn " Exemplo de discurso:"
        putStrLn " P --> Q = Se sou aluno de Computação, então estudo programação."
        putStrLn " Q --> R = Se estudo programação, então sei programar."
        putStrLn " P --> R = Se sou aluno de Computação, então sei programar."
    

    {-
    Função que retorna informações da opção do Silogismo Disjuntivo
    -}
    resumoDisjuntivo :: IO()
    resumoDisjuntivo = do 
        putStrLn " A partir de uma operação de disjunção quando temos a negação de um termo, podemos deduzir o termo restante."
        putStrLn " Seja  P v Q. tendo  ~P, logo temos Q"
        putStrLn " Quer saber mais sobre Silogismo Disjuntivo?"

    {-
    Função que retorna informações adicionais do Silogismo Disjuntivo
    -}
    infoDisjuntivo :: IO()
    infoDisjuntivo = do
        putStrLn " Conhecido historicamente como Modus Tollendo Ponens, o silogismo disjuntivo é indicado apenas para a simplificação de termos."
        putStrLn " Exemplo de discurso:"
        putStrLn " P v Q = Eu viajo de férias ou faço cursinho de inglês."
        putStrLn " ~P = não viajo de férias."
        putStrLn " Q = Então faço cursinho de inglês."
    
    {-
    Função que retorna informações do Dilema Construtivo
    -}
    resumoDilemaConstrutivo :: IO()
    resumoDilemaConstrutivo = do
        putStrLn " A partir de duas implicações totalmente distintas, se possuímos uma disjunção entre o implicante da primeira com o implicante da segunda implicação, podemos deduzir uma disjunção entre a implicância da primeira com a implicância da segunda disjunção."
        putStrLn " Sendo assim P --> Q, R --> S. Tendo P v R, podemos deduzir Q v S"
        putStrLn " Quer saber mais sobre Silogismo Disjuntivo?"
    
    {-
    Função que retorna informações adicionais do Dilema Construtivos
    -}
    infoDilemaConstrutivo :: IO()
    infoDilemaConstrutivo = do
        putStrLn " Também conhecido como dilema de transferência, serve para a simplificação de duas implicações resultando em uma disjunção"
        putStrLn " Exemplo de discurso:"
        putStrLn " P --> Q = Se eu me formei, então eu tenho emprego."
        putStrLn " R --> S = Se eu tenho dinheiro, então tenho um carro."
        putStrLn " P v R = Eu me formei ou tenho dinheiro."
        putStrLn " Q v S = Eu tenho um emprego ou tenho um carro."
    
    {-
    Função que retorna informações da opção Exportação
    -}
    resumoExportacao :: IO()
    resumoExportacao = do 
        putStrLn " A partir de uma implicação, se o implicante for formado por uma conjunção, podemos deduzir uma implicação do primeiro termo da conjunção implicando numa implicação do segundo termo da conjunção implicando na implicância original."
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
