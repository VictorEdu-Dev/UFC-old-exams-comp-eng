#DISCENTE: JOAO BATISTA SOUSA DA SILVA
#MATRICULA: 473748


#QUEST. 05

x<-matrix(c(3,2,-1,1),ncol=2,byrow=TRUE)
x

y<-matrix(c(1,4,0,0,1,-1),ncol=3,byrow=TRUE)
y

#a)
2*x

#b)
x*x

#c)
x%*%x

#d)
x%*%y

#e)
t(y)

#f)
solve(y)

#g)
solve(x)*x


#QUEST. 06

#a) 
altura<-c(1.75, 1.5, 1.85, 1.55, 1.7)
altura

#b) 
classifica??o<-c("alto","baixo","alto","baixo","alto")
classifica??o

#c)
dados<-data.frame(altura,classifica??o)
dados

#d)
lista<-list(altura,classifica??o,dados)
lista

#e)
lista[[3]][2,1]<-1.6
lista


#QUEST. 07

jogada_de_moedas<-function(x,n) {
  sample(x,n,replace=T)
  }

moeda<-c("Cara","Coroa")

#A)
jogada_de_moedas(moeda,10)

#B)
jogada_de_moedas(moeda,1000)

#C)
table(jogada_de_moedas(moeda,1000))


#QUEST. 08
COD = c(57, 60, 49, 50, 51, 60, 49, 53, 49, 56, 64, 60, 49, 52, 69, 40, 44, 38, 53, 66)
COD

#a)
summary(COD)

#b)
sort(COD)

#c)
stem(COD)

#d)
boxplot(COD,main="Gráfico tipo Boxplot",xlab="valor",col="red")
#Como a linha da mediana está próxima ao primeiro quartil,
#os dados são assimétricos positivos.

#e)

t.test(COD,alternative=c("two.sided"),mu=50,conf.level=0.99)
t.test(COD,alternative=c("two.sided"),mu=50,conf.level=0.95)

#Considerando n?veis de signific?ncia de 1% e 5%, o p-value 0.07419 se
#mostrou maior, logo n?o se rejeita a hip?tese nula em nenhum desses casos.
#N?o h? evid?ncias suficientes para dizer que a m?dia de concentra??o de COD
#dessa ind?stria diverge de 50mg/L. N?o ? poss?vel concluir que existe uma
#diferen?a estatisticamente significante. A autoriza??o deve ser fornecida.

t.test(COD,alternative=c("two.sided"),mu=50,conf.level=0.90)

#Como p-value=0.07419 < 0,1, se rejeita a hip?tese nula. 
#H? evid?ncias suficientes para dizer que a m?dia de concentra??o de COD
#dessa ind?stria diverge de 50mg/L.Conclui-se que existe uma diferen?a
#estatisticamente significante. A autoriza??o n?o deve ser fornecida.

#Para as 20 observa??es apresentadas, a ind?sstria est? em conformidade com
#o padr?o, exceto se considerado n?vel de signific?ncia de 10%, pois, nesse
#caso, o intervalo de confian?a n?o cont?m 50mg/L, todo o intervalo de
#confian?a est? acima de 50mg/L, logo a m?dia de emiss?o da ind?stria
#provavelmente est? acima do desejado.


#QUEST. 09

x<-rnorm(100)
y<-rnorm(100)
plot(x, y, main="x vs y", xlab="Valores de x",ylab="Valores de y")


#QUEST. 10

sapos<-c(6,5,10,11,26,16,17,37,18,21,22,15,24,25,29,31,32,13,39,40)
sapos
umid<-c(62,24,21,30,34,36,41,48,56,74,57,46,58,61,68,76,79,33,85,86)
umid
temp<- c(31,23,28,30,15,16,24,27,18,10,17,13,25,22,34,12,29,35,26,19)
temp

par(mfrow=c(2,3))
plot(temp, sapos, main="Sapos por temperatura", xlab="Temperatura",ylab="Sapos")
plot(umid, sapos, main="Sapos por umidade", xlab="Umidade",ylab="Sapos")

