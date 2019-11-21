#instalar pacotes
#install.packages("tidyr") 
#install.packages("dplyr")
#install.packages("stringr")
#install.packages("lubridate")

#rodar pacotes
library(tidyr)
library(dplyr)
library(stringr)
library(lubridate)

#importa banco de dados
paises <- read.csv("banco.csv", 
                   na.strings = "", 
                   stringsAsFactors = FALSE, 
                   header = TRUE,
                   encoding = "UTF-8")

str(paises) #estrutura do banco
summary(paises) #resumo

plot(paises$X1970, paises$X1980) #grafico de dispersao

# NAs
is.na(paises) #tem NAs?
any(is.na(paises)) #tem algum NA no banco inteiro?
sum(is.na(paises)) #quantos?

#cria banco "tidy" juntando todas as variaveis de ano (30) em uma coluna categorica
pais_tidy <- gather(paises, ano, valor, 
                    -c(pais, codigo, continente, date))
#cria banco "wide" separando a variavel categorica ano em varias colunas
pais_wide <- spread(pais_tidy, ano, valor)

#cria banco com a uniao da coluna "pais" e "codigo" na coluna "pais_cod" separado por /
pais_unido <- unite(paises, pais_cod, 
                    pais, codigo, sep = "/")

#cria banco com a separaçao da coluna "pais_cod" na coluna "pais" e "codigo" - separando onde tem a "/"
pais_sep <- separate(pais_unido, 
                     col = pais_cod, 
                     into = c("pais", "cod"), 
                     sep = "/")

summary(pais_tidy)

#library string 
pais_tidy$pais <- str_trim(pais_tidy$pais) #exclui os espaços antes e depois dos nomes dos paises na coluna pais

#adiciona uma string "X" a direita dos nomes dos continentes 
pais_unido$continente <- str_pad(pais_unido$continente, 
                               width = 3,
                               side = "right", 
                               pad = "X")

#troca todos os char "NA" na coluna pais por "North America"
pais_wide$continente <- str_replace(pais_wide$continente,
                                    "NA", "North America")
#retira todos os X da coluna ano (agora podemos transformar a coluna ano em numerica)
pais_tidy$ano <- str_remove(pais_tidy$ano, "X")

#funçao para citar os pacotes do R
citation("stringr") 

#pacote dplyr

#seleciona do banco pais_tidy as variaveis pais, ano, valor
sel <- pais_tidy %>%
        select(pais, ano, valor)

#ordena o banco pais_tidy por continente
cont <- arrange(pais_tidy, continente)

#filtra pais_tidy por ano > 1990, valor > 500 e ordem em ordem descrescente a variavel continente
pais_tidy %>%
  filter(ano > 1990) %>% 
  filter(valor > 500) %>%
  arrange(desc(continente))

#conta os casos na variavel pais
pais_tidy %>% 
  count(pais) 

#conta os casos na variavel pais e ordena por ordem crescente
pais_tidy %>%
  count(continente, sort = TRUE)

#conta os casos na variavel ano2
pais_tidy %>% 
  count(ano2)

#conta os casos na variavel pais mostrando (peso) a partir da variavel valor em ordem crescente
pais_tidy %>% 
  count(pais, wt = valor, sort = TRUE)

#agrupa por continente e pais e mostra em uma tabela realizando as funçoes sum(), mean(), min(), max() removendo os NAs
pais_tidy %>% 
  group_by(continente, pais) %>% 
  summarize(total = sum(valor, na.rm = TRUE), 
            media_valor = mean(valor, na.rm = TRUE),
            min = min(valor, na.rm = TRUE),
            max = max(valor, na.rm = TRUE))

#agrupa por continente e pais e mostra em uma tabela realizando a funçoes sum() e depois no resultado de sum() realiando as funçoes mean(), min(), max() removendo os NAs
pais_tidy %>% 
  group_by(continente, pais) %>% 
  summarize(total = sum(valor, na.rm = TRUE)) %>% 
  summarize(media_valor = mean(total, na.rm = TRUE),
            min = min(total, na.rm = TRUE),
            max = max(total, na.rm = TRUE))

#agrupa por pais e mostra o valor mais alto (top1) de cada pais
pais_tidy %>% 
   group_by(pais) %>% 
   top_n(1, valor)

#mostra os paises em cada continente com maiores medias em valor
pais_tidy %>% 
  group_by(continente, pais) %>% 
  summarize(media = mean(valor)) %>% 
  top_n(1, media)
