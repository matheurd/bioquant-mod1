


# Two way ANOVa com interacao 
# Para analisar a interacao da especie com o local, utilizamos o 
# simbolo :
resultado3 <- aov(prod2 ~ fat2+local+fat2:local, data = frutos2)
summary(resultado3)


# Test post hoc - Teste de Tukey ----
# Observamos que ha variacao entre as medias, mas quais medias
# variam entre elas? Sera que todas sao diferentes ou nao?

posth <-TukeyHSD(resultado2)
posth
plot(posth)

# Quando a barra cruzar o zero no eixo x, significa que a diferenca
# entre esses grupos nao e significativo. 
# Se a diferencia for positiva, a media do primeiro fator e maior 
# que do segundo fator.

# Quais sao as medias que nao tem diferencias significativas?









# Teste Kruskal wallis ----

# Visto se tem diferenca ou nao, devemos verificar onde esta a diferenca
# Vamos usar um Tukey nao parametrico para o kruskal wallis
pairwise.wilcox.test(Planilha_galhas$N_galhas,Planilha_galhas$Planta)



####### Aula Regress�o Linear

# Regress�o Linear
# Quanto que a vari�vel y varia em rela��o a variavel x
# Por�m antes disso, vamos falar de:

## Correla��o
# Se as vari�veis est�o correlacionadas, ou seja, o grau pelo qual duas 
# Variaveis tendem a mudar juntas.
# � dado pelo coeficiente de correla��o "r"

## Pearson
# parametrico
# preferencialmente cont�nuas

# Spearman
# uando n�o existe normalidade e/ou nao existe rela��o linear

# Kendall
# se existe correla��o entre duas vari�veis ordinais,usando uma escala ou gradiente.
# � um m�todo adequado quando amostras t�m tamanhos reduzidos,


# Correlacao entre massa de peixes e comprimento dos otolitos
x <-c(6.6,6.9,7.3,7.5,8.2,8.3,9.1,9.2,9.4,10.2)
y <-c(86,92,71,74,185,85,201,283,255,222)
shapiro.test()

# Parece que h� uma correla��o positiva entre as duas vari�veis e podemos testar se esta correla��o e real ou 
# nao usando a fun��o cor.test().
# Testamos a signific�ncia da rela��o
# A correla��o � maior que 0? (two.sided)
plot(x,y)

cor.test(x,y,method="pearson",alternative="two.sided")






#### Regress�o linear
# Note, que a pergunta n�o � se elas est�o relacionadas, e sim como.
# EM BUSCA DA EQUA��O DA RETA!!

#Um exemplo de regress�o simples linear: dados sobre a massa de fertilizante (gm-2) aplicada (b) e a
#colheita de grama obtida (gm-2) para cada aplica��o de fertilizante (a).
a=c(25,50,75,100,125,150,175,200,225,250)
b=c(84,80,90,154,148,169,206,244,212,248)


## Fazendo a regress�o, ajustando o modelo linear
regressao=lm(b~a)
regressao

# Verificando a signific�ncia e a intera��o das vari�veis.
summary(regressao)
summary(aov(regressao))

# Construindo a equa��o da reta
# ax+b, onde a= coeficiente angular, b= intercepto
# Para encontra-los podemos olhar a funcao acima ou usar a fun��o
# coef.
coef(regressao)
# y=0.811x+51.93

# Plotando os dados
plot(b~a)

# Colocando a reta de regress�o
abline(regressao)

# Adicione a formula da reta de regressao ao grafico
text(80,200,"y=0.811+51.93")

## Diagn�stico completo dos res�duos
par(mfrow=c(2,2))
plot(regressao)

# Valores estimados de acordo com o melhor ajuste
fitted(regressao)
# Valores da diferen�a entre os valores estimados e observados
residuals(regressao)
l=data.frame(a=400)
predict(regressao,l,interval="confidence")
