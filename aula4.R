library(dplyr)
library(ggplot2)
library(gapminder)

gap <- gapminder

summary(gap)
str(gap)

#cria um banco br com os casos do Brasil
br <- gap %>% 
        filter(country == "Brazil")

#gera um grafico de dispersao entre a variavel gdpPercap e lifeExp no banco br
#atençao para as tres camadas: 1 - dados 2 - aes() variaveis x e y e 3 - geometria geom()
ggplot(br, aes(x = gdpPercap, y = lifeExp)) +
  geom_point()

#filtra os casos de 2002 no banco gap
ano02 <- gap %>% 
  filter(year == 2002)

#cria grafico com o banco ano02 com cores diferenciadas por continente
ggplot(ano02, aes(x = gdpPercap, y = lifeExp, colour = continent)) + geom_point()

#ggplot(ano02, aes(x = gdpPercap, y = lifeExp)) +
 # geom_point(aes(colour = "blue"))

#cria grafico do banco ano02 com formas diferenciadas por continente
ggplot(ano02, aes(x = gdpPercap, y = lifeExp, 
                 shape = continent)) + geom_point()

#cria grafico do banco ano 02 com tamanho diferente por populaçao e cor diferenciada por continente
ggplot(ano02, aes(x = gdpPercap, y = lifeExp, 
                  size = pop, colour = continent)) + geom_point()

#alteraçoes na camada geom_point() - todas as alteraçoes muda para todos os elementos 
#alpha = deixa mais transparente as formas (de 0 a 1)
ggplot(ano02, aes(x = gdpPercap, y = lifeExp, 
                  size = pop)) +
  geom_point(shape = 16, colour = "blue", alpha = 0.5)

#add uma nova camada de labels em cada pais - tem que ter a geom_text() e o argumento label dentro de aes()
ggplot(ano02, aes(x = gdpPercap, y = lifeExp, 
                  size = pop, label = country)) +
  geom_point() + geom_text()

#adicionar cores novas - tem que ser codigo hex de cor (procurar cores html ou css)
minha_cor <- "#99ffff" #cria variavel com definiçao de cor

#adiciona no grafico a cor desejada
ggplot(ano02, aes(x = gdpPercap, y = lifeExp) +
  geom_point(aes(colour = minha_cor)) 

#cria grafico facetado por continente
ggplot(ano02, aes(x = gdpPercap, y = lifeExp, 
                  size = pop)) +  geom_point() + facet_grid(.~ continent)

#adiciona camadas de estatistica
ggplot(ano02, aes(x = gdpPercap, y = lifeExp)) +
  geom_point() +
  stat_smooth(method = "lm", se = F, col = "red")

ggplot(ano02, aes(x = gdpPercap, y = lifeExp)) +
  geom_point() +
  stat_smooth()

#histogramas de expectativa de vida
ggplot(ano02, aes(lifeExp, fill = continent)) +
  geom_histogram(binwidth = 0.5) #preenchimento por continente - padrao das colunas 'e `stacked`

ggplot(ano02, aes(lifeExp, fill = continent)) +
  geom_histogram(binwidth = 0.5, position = "identity") #muda posicionamento das colunas

#grafico de poligonos de frequencia (msm coisa que histograma)
ggplot(ano02, aes(lifeExp, color = continent)) +
  geom_freqpoly(binwidth = 0.5) 

#modo de construçao com a sintaxe do dplyr
ano02 %>% ggplot(aes(fill = continent))+
  geom_bar(aes(continent)) + theme_bw() #muda o tema do grafico

ano02 %>% ggplot(aes(fill = continent))+
  geom_bar(aes(continent)) + theme_bw() +
  labs(title = "meu grafico", x = "Continente", y = "contagem") #adiciona nome do grafico com label no eixo x e y

#boxplot cor azul com outiliers de vermelho - atençao que no geom_boxplot() o preenchimento 'e fora de aes()
ano02 %>% 
  ggplot(aes(continent, lifeExp)) +
  geom_boxplot(outlier.color = "red", fill = "blue", show.legend = FALSE) 

#grafico de linha - variavel gdpPercap ao longo do tempo
ggplot(br, aes(x = year, y = gdpPercap)) +
  geom_line()

#banco mtcars
#grafico barra da variavel "cyl" com cor a partir dos fatores "am" 
ggplot(mtcars, aes(x = cyl, fill = factor(am))) +
  geom_bar() 

#alteraçao da paleta de cores (camada scale_fill_brewer())
ggplot(mtcars, aes(x = cyl, fill = factor(am))) +
  geom_bar() +
  scale_fill_brewer(palette = "Set1")

#grafico barra da variavel "cyl" com cor a partir dos fatores "am" - alteraçao no argumento position da camada geom_bar()
ggplot(mtcars, aes(x = cyl, fill = factor(am))) +
  geom_bar(position = "stack") 

#grafico barra da variavel "cyl" com cor a partir dos fatores "am" - alteraçao no argumento position da camada geom_bar()
ggplot(mtcars, aes(x = cyl, fill = factor(am))) + 
  geom_bar(position = "dodge") 

#grafico barra da variavel "cyl" com cor a partir dos fatores "am" - alteraçao no argumento position da camada geom_bar()
ggplot(mtcars, aes(x = cyl, fill = factor(am))) +
  geom_bar(position = "identity") 
