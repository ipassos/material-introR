## R como uma calculadora

#soma
2 + 2 

#subtraçao
2 - 2 

#multiplicaçao
2 * 2 

#divisao
2 / 2 

#potencia
2 ^ 2 

#resto da divisao
2 %% 2 

#parte inteira da divisao
2 %/% 2 

##Atribuiçao de variaveis (objetos)

#para atribuir variavel '<-' a seta sempre tem que apontar para o nome da variavel
#prefiram nomes com letras minusculas

#variavel de classe 'numeric'
x <- 5 #agora o R vai armazenar na memoria que x tem o valor 5
y <- 5 * 10 #tbm posso armazenar resultados de calculos

#variavel de classe texto - 'character'
nome <- "isso 'e um texto"

#variavel de classe 'logical' - T ou TRUE ou F ou FALSE
verdadeiro <- T
falso <- F

#perguntar qual e a classe do objeto - funçao class()
class(x)

##Vetores - objetos que armazenam outros objetos
#sintaxe -> c()

#criar vetor numérico
a <- c(5, 6, 4) #vetor de tamanho 3

#criar vetor texto
b <- c("a", "b", "c") #vetor de tamanho 3

#criar vetor logico
c <- c(T, F, T) #vetor de tamanho 3

#vetores so podem armazenar objetos da mesma classe - portanto "herdam" a classe dos objetos armazenados

#Dar nome aos vetores - funçao names()
vector <- c("Fulano", "taxista")   
names(vector) <- c("Nome", "Profissão")   

#Soma de vetores

# primeiro atribuo 3 vetores distintos
vetor1 <- c(5, -8, 9, 7, 5)
vetor2 <- c(255, 385, 49, 89, 98)
vetor3 <- c(-10, 56, -45, -85, 54)

#otimizar a atribuiçao de nomes
nomes <- c("a", "b", "c", "d", "e") #crio um vetor texto com os nomes dos vetores e armazeno em uma variavel
names(vetor1) <- nomes #para cada vetor que quero utilizar esses nomes indico na funçao names() o vetor "nomes"
names(vetor1) <- nomes
names(vetor1) <- nomes

#atribuo a soma dos 3 vetores a uma variavel chamada soma
soma <- vetor1 + vetor2 + vetor3

#para saber a soma dentro do vetor preciso usar funçao sum()
soma_vet1 <- sum(vetor1) #atribuo cada resultado a uma variavel nova
soma_vet2 <- sum(vetor2)
soma_vet3 <- sum(vetor3)

#operadores relacionais

soma_vet1 > soma_vet2 #quero saber se a soma do vetor1 'e maior que a soma do vetor 2
soma_vet2 < soma_vet3 #quero saber se a soma do vetor2 'e menor que a soma do vetor 3
#posso usar o <= (menor igual) e => (maior igual) de forma equivalente

vetor1 == vetor2 #quero saber se cada posiçao do vetor1 'e igual ao valor armazenado na casa correspondente do vetor 2
vetor2 != vetor3 #quero saber se cada posiçao do vetor2 nao 'e igual ao valor armazenado na casa correspondente do vetor3

##Selecao de valores dentro de um vetor - endereçamento 
## [] <- isso indica o endereço da "casinha" dentro de um vetor

vetor2[3] #selecao da "casinha" 3 do vetor2

##Selecionar mais de um valor do vetor  
vetor2[c(1,5)]  #seleciona o valor 1 E 5 do vetor2

##Selecionar intervalos dentro de um vetor
vetor3[2:4]  #seleciona os valores de 2 a 4 do vetor3

##Seleçao de vetores nomeados
#Em vetores nomeados eu posso selecionar as casas indicando os nomes das casas

vetor1["b"]   #seleciono a casa de nome "b" do vetor 1

vetor2[c("a", "d")] #seleciono as casas de nomes "a" e "d" do vetor2

#Comparação: podemos comparar objetos com os sinais de comparação, inclusive vetores. 

vetor3 > 15 #estou perguntando ao R quais dos números dentro de cada "casinha" do vetor sao maiores que 5 
# O R retorna com respostas logicas TRUE e FALSE em cada casa correspondente   

#SE eu quero que o R retorne os numeros dentro do vetor preciso fazer de outra forma:
vetor1[vetor1>0]    #Dessa forma eu descubro os numeros mas nao sei em quais casas do vetor original eles estavam

#atribuir a uma nova variavel a seleçao de um vetor - começamos a trabalhar com a ideia de "filtragem" aqui
neg <- vetor3[vetor3<0]   #armazeno dentro de "neg" os valores negativos do vetor3

rev(vetor2) #funçao rev() inverte um vetor - mas nao muda o vetor original!!

##criando sequencias  

b <- 1:8  #sequencia de 1 ate 8 - vai de 1 em 1 
c <- 2.5:10  #sequencia de 2.5 ate 10 - vai de 1 em 1  

#funçao seq() consigo definir melhor as sequencias
seq(10, 30) #sequencia de 10 a 30
seq(10, 30, by = 2) #sequencia de 10 a 30 de 2 em 2

#sequencia de valores repetidos - funçao rep()
rep(5, 3) # sequência de 5, repetida 3 vezes   
rep(1:5, 3) #sequência de 1 a 5, repetida 3 vezes   
rep(1:5, each = 3) #sequência de 1 a 5, cada número repetido 3 vezes   

#tamanho de vetores - funçao lenght()
length(1:20)   #o tamanho da sequencia de 1 a 20
length(vetor1)   #o tamanho dp vetor1

#adicionar valores em um vetor   
vetor1[5+1] <- 5   #por endereçamento direto aqui eu preciso saber o tamanho do vetor- x 'e o valor da ultima casa do vetor 
  #observe o que acontece se eu fizer em um vetor de tamanho 5: vetor2[5+2] <- 6

vetor1[length(vetor1) + 1] <- 9  #endereçamento indireto- aqui eu nao preciso saber o tamanho do vetor - utilizo a funçao length para ajudar

vetor1 <- c(vetor1, 10)   #modo recursivo - aqui eu substituo o vetor pelo proprio vetor e um 10 - estamos concatenando o vetor e um numero
  #de movo equivalente poderia fazer vetor1 <- c(10, vetor1) e adicionar 10 na primeira casa do vetor

#excluir item dentro de um vetor   
vetor1 <- vetor1[-c(1:3)]   #substituo o vetor1 pelo proprio vetor1 sem as casas de 1 a 3 
