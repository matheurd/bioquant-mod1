###Exercicio 1
#Um ALUNO DE PIBIC DA UnB TEM QUE VERIFICAR SE SUA POPULACAO DE AVES 
#PERTENCE A UMA POPULACAO CUJA MEDIA DE TAMANHO DAS ASAS   E 2.2

##Defiinir as variav�is##

dados <-c (1.6,3.4,2.3,4.1,4.2,6.6,1.7,4.3)

## Teste dos dados##

shapiro.test(dados)

## Verificar se pertecem a popula��o com a m�dia das asas de 2.2##

mean(dados)

##O valor de p pr�ximo a 0,5 com a m�dia de 3,525, rejeita a hip�tese de que sejam da mesma popula��o##


###Exercicio 2
#Em um estudo, as seguintes aves de dois locais tiveram suas asas medidas  para verificar se sao da
#mesma populacao

local1 <-c (16.3,21.2,15.0,10.8,13.9,23.5, 11.0,6.4,2.8,12.0)

local2 <-c (13.3,21.6,27.2,21.7,26.7,33.0,10.9,29.6,9.3,24.3)

#Veja se h� uma diferen�a significativa entre as populacoes dos dois locais usando  a analiise correta
#lembrando de  verificar os pre requisitos necessarios para tal analise

##O teste Shapiro-wilk,verifica que as as ditribui��es s�o normais, pois o valor de p � maior que 0,05##

shapiro.test(local1)

shapiro.test(local2)

##S�o popula��es diferentes devido o valor de p ser maior que %5, sendo p=0.44

var.test(local1, local2)

## � possiv�l ver isso nos dados sugere o mesmo que o p-valor##

boxplot(local1,local2, main = "Aves", names = c("Local 1", "Local 2")

 
###Exercicio 3
#Uma pesquisadora quer verificar se determinada racao tem efeito sobre o peso de frangos.
#Com isso ele gerou dois bancos de dados: um antes da utilizacao da racao e outro depois.
#Verifique se de fato a racao tem efeito significativo sobre essa populacao aplicando
#o teste  correto,lembrando de  verificar os pre requisitos necessarios para tal analise. Cada individuo est� pareado na sequencia antes e depois, ou seja o primeiro peso de cada sequencia corresponde ao individuo 1, o segundo ao individuo 2, e assim por diante.


antes<-c(5166,6080,7290,7031,6700,8908,4214,5135,5002,4900,8043,6205,8800)

depois<-c(6310,6295,4497,5182,4273,6591,6425,4600,5407,5509,4900,5100,4900)

## 
shapiro.test(antes)

shapiro.test(depois)
## A m�dia e o m�xima mostram que h� um diferen�a nos pesos das poula��es antesXdepois"
summary(antes)

summary(depois)
## O dados visuais monstram que a ra��o tem efeito significativo sobre o peso nas poula��es"
boxplot(antes,depois, main="Efeito da ra��o sobre o peso", names = c("antes", "depois"))

##Com mesmo com o valor baixo sendo p=0.04, � poss�vel rejeitar a hip�tese nula, logo a ra��o tem efeito no peso dos frangos"
t.test(antes,depois, var.equal = TRUE)
