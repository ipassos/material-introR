################################################################ LISTA 2 ################################################################
######################################################## INTRODUÇAO AO R - 2019 #########################################################

################################################################ BLOCO 3 ################################################################ 
############################################################### Matrizes ################################################################

## Recrie os vetores de cada país (da lista anterior). De modo que não tenhamos mais a soma no final de cada um deles. 
#Dica: apenas rode novamente o código da criação dos vetores.

#21 - Crie uma matriz a partir dos vetores paises criado anteriormente. Armazene em uma nova variável. Verifique se o argumento "byrow" deve ser TRUE ou FALSE 

#22 - Coloque os respectivos nomes dos meses e dos países na matriz criada. 

#23 - Efetue a soma das colunas e linhas e adicione-as na matriz. 
#A matriz deve ficar no final como o arquivo "Tabela Final.png" - utilize o arquivo apenas para conferir a sua tabela.

#24 - Selecione o primeiro elemento da terceira linha da matriz.

#25 - Selecione o segundo elemento da ultima coluna da matriz.

#26 - Selecione a primeira linha inteira.

#27 - Selecione a quinta coluna inteira.

#28 - Selecione a primeira e terceira linha das colunas 2 e 5. 

################################################################ BLOCO 4 ################################################################ 
############################################################# Data Frames ###############################################################

#29 - Transforme a matriz paises final em um dataframe. Atençao: necessario transpor a matriz

#30 - Crie o seguinte data frame

df <- data.frame(paste("0000", 1:25, sep = ""), 
           factor(rep(c("branca", "negra", "indígena"), c(10, 10, 5))),
           factor(rep(c("F","M"), c(13,12))), 
           sample(c(16:50), 25, replace = T), 
           factor(rep(c("superior","tecnico", "medio"), c(5, 8, 12))), 
           sample(seq(500, 30000, by = 500), 25, replace = T), 
           factor(rep(c("solteiro","casado", "viuvo", "separado"), c(5, 10, 2, 8))))
colnames(df) <- c("individuo", "raca", "sexo", "idade", "escol", "renda", "civil")

#31 - Selecione as mulheres do seu data frame

#32 - Selecione os homens negros maiores de 30 anos do seu data frame

#33 - Selecione mulheres brancas com renda maior que 1500

#34 - Selecione pessoas com nivel superior que tem mais que 20 anos.

#35 - Ordene o seu data frame por ordem crescente de idade

################################################################ BLOCO 5 ################################################################ 
################################################################  Listas ################################################################

#36 - Crie uma lista com os vetores, matrizes e data frames que voce tem armazenado na memoria
