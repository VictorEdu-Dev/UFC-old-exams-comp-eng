#ESmaelRodriguesdaSilva 
#Economia n°476203
#Lista 1
install.packages("ISWR")
library(ISWR)
# QUESTÃO DE N° 5
X<-matrix(c(3,2,-1,1),nrow = 2,byrow = T)
y<-matrix(c(1,4,0,0,1,-1),nrow = 2,byrow = T)
#item(a)
2*X
#item(b)
X*X
#item(c)
X%*%X
#item(d)
X%*%y
#item(e)
t(y)
#item(f)
solve(y)#é uma 2x3
#item(g)
X^(-1)*X
# QUESTÃO DE N° 6
#item(a)
altura<-c(1.75,1.5,1.85,1.55,1.7)
#item(b)
classificação<-c("alto","baixo","alto","baixo","alto")
#item(c)
dados<-data.frame(altura,classificação)
#item(d)
lista<-list(altura,classificação,dados)
#item(e)
lista[[3]][2,1]<-1.6
#QUESTÃO DE N°7
REBOLARMOEDA<-function(x,n){sample(x,n,replace = T)}
moeda<-c("cara","coroa")
#item(a)
REBOLARMOEDA(moeda,10)
#item(b)
REBOLARMOEDA(moeda,1000)
#item(c)
table(REBOLARMOEDA(moeda,1000))
#QUESTÃO DE N°8
COD<-c(57,60,49,50,51,60,49,53,49,56,64,60,49,52,69,40,44,38,53,66)
#item(a)
summary(COD)
#item(b)
sort(COD)
#item(c)
stem(COD)
#item(d)
boxplot(COD) #ASSIMÉTRICOS
#item(e)
t.test(COD,alternative = c("two.sided"),mu=50,conf.level = 0.99)
#NÃO SE REJEITA, HIPÓTESE NULA
t.test(COD,altenative=c("two.sided"),mu=50,conf.level = 0.95)
#NÃO SE REJEITA, HIPÓTESE NULA
t.test(COD,altenative=c("two.sided"),mu=50,conf.level = 0.90)
#SE REJEITA A HIPÓTESE NULA NESSE CASO 
#QUESTÃO 9
m<-rnorm(100)
n<-rnorm(100)
plot(m,n)
#QUESTÃO DE N°10
sapos<-c(6,5,10,11,26,16,17,37,18,21,22,15,24,25,29,31,32,13,39,40)
umid<-c(62,24,21,30,34,36,41,48,56,74,57,46,58,61,68,76,79,33,85,86)
temp<-c(31,23,28,30,15,16,24,27,18,10,17,13,25,22,34,12,29,35,26,19)
par(mfrow=c(2,2))
plot(temp,sapos,main ="sapos por temp")
plot(umid,sapos,main = "sapos por umid")     
