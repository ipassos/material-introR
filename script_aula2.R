#Coerção de classes

b <-  c(1, 2, 3, 4) #vetor de numeros
b <- as.character(b) #transforma o vetor b em vetor de caracteres

log <- c(T, F, T, F) #vetor logico
log <- as.numeric(log) #transforma o vetor log em vetor numerico (0 e 1)

c <- c("1", "2", "4") #vetor de caracteres
c <- as.integer(c) #transforma o vetor c em numeros

bin <- c(0, 1, 0, 1) #vetor numerico
bin <- as.logical(bin) #transforma vetor em logico

#Desafio
length(rep(rev(seq(1, 18, by = 3)), times = 5)) #concatenaçao de funçoes

#Matrizes 

#funçao matrix() cria matriz

matrix(1:30, byrow = F, nrow = 10) #criaçao de matriz de 1 a 30 preenchendo os numeros por colunas
matrix(1:30, byrow = T, nrow = 10) #criaçao de matriz de 1 a 30 preenchendo os numeros por linhas

todos <- c(vetor1, vetor2, vetor3) #concatenaçao dos meus vetores em um vetor so
matriz <- matrix(todos,
                 byrow = T, nrow = 3) #transformaçao dos vetores em uma matriz

matriz <- matrix(c(vetor1, vetor2, vetor3),
                 byrow = T, nrow = 3) #forma direta (mesma coisa que fazer os dois passos anteriores)

colnames(matriz) <- c("Col1", "Col2", "Col3", "Col4", "Col5") #funçao colnames() para nomear as colunas da matriz
rownames(matriz) <- c("Primeiro", "Segundo", "Terceiro") #funçao rownames() para nomear as linhas da matriz

### ATENÇAO PARA OS 4 PASSOS A SEGUIR ###
somaL <- rowSums(matriz) #funçao rowSums() cria um vetor com a soma das linhas da matriz
matriz <- cbind(matriz, somaL) #utilizar funçao cbind() para criar uma nova coluna com o vetor somaL
somaC <- colSums(matriz) #funçao colSums() cria um vetor com a soma das colunas da matriz
matriz <- rbind(matriz, somaC) #utilizar funçao rbind() para criar uma nova linha com o vetor somaC

#SELEÇAO DE ELEMENTOS DENTRO DA MATRIZ
matriz[3,6] #3 linha e 6 coluna
matriz[1:2,6] #linha de 1 a 2 e 6 coluna
matriz[1:2,4:6] #linha 1 a 2 e coluna 4 a 6
matriz[c(1,3),4:6] #linha 1 e 3 coluna 4 a 6
matriz[,6] #coluna 6 inteira
matriz[2,] #coluna 2 inteira

mean(matriz[,3]) #media da coluna 3
mean(matriz[2,]) #media da linha 2

#ESTRUTURA "FACTOR"

genero <- rep(c("F", "M"), each = 4) #cria um vetor de char de F e M 
genero2 <- factor(genero) #informa para o R que o vetor genero tem variaveis categoricas
levels(genero2) <- c("Female", "Male") #muda o nome das categorias - Atençao para a ordem da mudança

male <- genero2[2] 
female <- genero2[1]
male > female #compara as duas categorias - atençao para a saida do R - a mensagem de erro

sat <- c("Bom", "Ruim", "Pessimo", "Otimo", "Pessimo") #cria um vetor de respostas de satisfaçao
sat <- factor(sat, order = T, levels = c("Pessimo", "Ruim", "Bom", "Otimo")) #informo que o vetor de satisfaçao contem variavel do tipo categoricas e que essas categorias possuem uma ordem pre estabelecida

df <- data.frame(vetor1, vetor2, vetor3) #transformo meus vetores em um data.frame 
df2 <- transpose(df) #se faço a partir de vetores preciso transpor a matriz - depende de como quero que ela fique - utilizar pacote "data.table" - primeiro instalar (install.packages("data.table")) e depois chamar o pacote library(data.table)

df3 <- data.frame(matriz) #crio data.frame a partir de matriz criada anteriormente

#criaçao de data.frame - cada linha 'e uma variavel 
banco <- data.frame(paste("0000", 1:25, sep = ""), #criaçao de ID de 25 individuos 0000+(1:25)
                    factor(rep(c("branca", "negra", "indígena"), c(10, 10, 5))), #criacao de variavel categorica com repetiçao de tipos de characteres
                    factor(rep(c("f","m"), c(13,12))), #criacao de variavel categorica com repetiçao de tipos de characteres
                    sample(c(16:50), 25, replace = T), #criaçao de variavel  com sorteio (com repetiçao) de 25 numeros de 16 a 50
                    factor(rep(c("superior","tecnico", "medio"), c(5, 8, 12))), #criacao de variavel categorica com repetiçao de tipos de characteres
                    sample(seq(1000, 30000, by = 1000), 25, replace = T), #criaçao de variavel de sequencia de 1000 a 30000 de 1000 em 1000 com sorteio (com repetiçao) de 25 
                    factor(rep(c("solteiro","casado", "viuvo", "separado"), c(5, 10, 2, 8))))  #criacao de variavel categorica com repetiçao de tipos de characteres
colnames(banco) <- c("individuo", "raca", "sexo", "idade", "escol", "renda", "civil") #definiçao de nomes das variaveis (colunas) com a funçao colnames()

str(banco) #retorna a estrutura de cada variavel do bancos de dados
summary(banco) #retorna um resumo descritivo das variaveis 

banco[1:5,"sexo"] #seleçao da linha 1 a 5 da variavel sexo
banco[1:5,] #seleçao da linha 1 a 5
banco[c(1,8,10,22),] #selecao da linha 1, 8, 10 e 22
banco[, c(2,4,5)] #selecao da coluna 2, 4 e 5

mulheres <- subset(banco, banco$sexo == "f") #seleçao das pessoas do sexo feminino do banco - atribuiçao a um novo banco

subset(banco, banco$idade > 30 & banco$raca == "negra") #seleçao de pessoas com idade maior que 30 anos e da raça "negra"
subset(banco, banco$renda <= 5000 | banco$raca != "branca") #seleçao de pessoas com renda menor ou igual a 5000 e pessoas com raça diferente de branca

which(banco$idade > 30 & banco$raca == "negra") #retornas quais pessoas que tem idade maior que 30 e sao negras

ord_rend <- order(banco$renda, decreasing = T) #retorna um vetor com a ordem decrescente a partir da variavel renda
banco2 <- banco[ord_rend,] #cria um banco novo com a ordem pre-estabelecida

lista <- list(banco2, male, b, matriz) #cria uma lista com o data.frame "banco2", com os vetores "male" e "b" e a matriz "matriz"

#instalar pacote Stat2Data
install.packages("Stat2Data")
library(Stat2Data) #chama pacote

data(Titanic) #download do banco Titanic

head(Titanic, n = 20) #mostra os primeiros 20 valores do banco
tail(Titanic, n = 20) #mostra os ultimos 20 valores do banco

str(Titanic) #estrutura do Titanic
summary(Titanic) #resumo do Titanic

class(Titanic$Age) #retorna a classe da variavel

which(Titanic$Age < 1) #quais casos do banco Titanic correspondem a idade menor que 1?

subset(Titanic, Titanic$Age <1) #seleciona apenas as pessoas com idade menor que 1
