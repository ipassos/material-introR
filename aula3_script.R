#instalar pacote: install.packages("Stat2Data")

library(Stat2Data) #chama o pacote 
data(Titanic) #baixa o banco Titanic

head(Titanic, n = 20) #ve as primeiras 20 observaçoes do banco
tail(Titanic, n = 40) #ve as primeiras 40 observaçoes do banco

str(Titanic) #estrutura do banco
summary(Titanic) #resumo das variaveis do banco

which(Titanic$Age < 1) #quais elementos da variavel Age tem valor < 1
subset(Titanic, Titanic$Age < 1) #mostra todas as informaçoes dos elementos que tem Age < 1

Titanic$Age[Titanic$Age < 1] <- 0 #substitui as idades menores que 1 por 0

max(Titanic$Age, na.rm = T) #o valor maximo da variavel Age (sem contar os NAs)
min(Titanic$Age, na.rm = T) #o valor maximo da variavel Age (sem contar os NAs)
mean(Titanic$Age, na.rm = T) #o valor maximo da variavel Age (sem contar os NAs)

Titanic$Name <- as.character(Titanic$Name) #transforma a variavel Name em char
Titanic$Survived <- as.factor(Titanic$Survived) #transforma a variavel Survived em factor
Titanic$SexCode <- as.factor(Titanic$SexCode) #transforma a variavel SexCode em factor

which(Titanic$PClass == "*") #Descobre qual o elemento que tem o valor * na PClass
Titanic[457, ] #retorna a linha inteira do elemento que tem o valor * na PClass

Titanic$PClass[Titanic$PClass == "*"] <- NA #transforma o valor * em NA

Titanic$PClass <- factor(Titanic$PClass) #atualiza os factors da PClass (agora sem o *)

#comandos para exclusao de casos com NA
complete.cases(Titanic)
na.omit(Titanic)

#histograma da variavel Age
hist(Titanic$Age, xlim = c(0, 80), main = "Grafico", 
     col = "royalblue", lwd = 3)
hist(Titanic$Age, breaks = c(-1,15,30,40,75), xlim = c(0, 80), main = "Grafico", 
     col = "royalblue", lwd = 3)

#Cria variavel nova com as idades em categorias
Titanic$AgeRecod <- cut(Titanic$Age, 
                        breaks = c(-Inf,15,30,40,75),
                        labels = c("Até 15", "De 15 a 30", 
                                   "De 30 a 40", "Mais de 40"))

#Tabelas de frequencia
freq_class <- table(Titanic$PClass) #frequencia absoluta
prop.table(freq_class) #frequencia relativa

prop.table(table(Titanic$Sex)) #os dois comandos anteriores jutnos

tit_fem <- subset(Titanic, Titanic$Sex == "female") #cria um novo dataset apenas com as mulheres do banco

sex_surv <- xtabs(~SexCode+Survived, data = Titanic) #crosstab da variavel SexCode e da Survived
summary(sex_surv) #teste qui-quadrado

chisq.test(sex_surv) #teste qui-quadrado Pearson com correçao Yates
fisher.test(sex_surv) #teste Fisher

prop.table(table(Titanic$Sex,Titanic$Survived),1)*100 # % crosstab na linha
prop.table(table(Titanic$Sex,Titanic$Survived),2)*100 # % crosstab na coluna


boxplot(Titanic$Age) #boxplot variavel Age
 
plot(Titanic$SexCode, ylim = c(0,800)) #plot barra SexCode, com definiçao limite y

plot(Titanic$Survived, Titanic$Sex) #plot barras agregadas
plot(Titanic$AgeRecod) #plot variavel categorica age

pie(freq_class) #pizza da frequencia da Classe
barplot(freq_class, horiz = T) #grafico barra freq classe horizontal 

st <- table(Titanic$Sex, Titanic$Survived)
barplot(st, ylim = c(0,1000), main = "Distribuição", 
        col=c("darkblue", "red")) #stacked graph das variaveis Sex e Survived

write.csv(Titanic, file = "titanic.csv", na = "NA") #exportaçao do banco

