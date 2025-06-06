#UNIVERSIDADE FEDERAL DO CEARÁ
#CURSO DE FINANÇAS
#DISCIPLINA.: MÉTODOS COMPUTACIONAIS APLICADOS
#DISCENTE: JOÃO BATISTA SOUSA DA SILVA
#MATRÍCULA: 473748


#QUESTÃO 05 – Criar em R as matrizes
x<-matrix(c(3,2,-1,1),ncol=2,byrow=TRUE)
x

y<-matrix(c(1,4,0,0,1,-1),ncol=3,byrow=TRUE)
y

#a) 2∗x
2*x

#b) x*x
x*x

#c) x%∗%x
x%∗%x

#d) x%∗%y
x%∗%y

#e) t(y)
t(y)

#f) solve(y)
solve(y)

#g) x^-1*x
solve(x)*x


#QUESTÃO 06 – Faça o que se pede:
#a) Criar um vetor com nome altura contendo os seguintes elementos: 1.75, 1.5, 1.85, 1.55 e 1.7.
altura<-c(1.75, 1.5, 1.85, 1.55, 1.7)
altura

#b) Criar um vetor com nome classificação contendo os seguintes elementos: alto, baixo, alto, baixo e alto.
classificação<-c("alto","baixo","alto","baixo","alto")
classificação

#c) Criar um data frame a partir dos vetores altura e classificação e atribua o nome de dados.
dados<-data.frame(altura,classificação)
dados

#d) Criar uma lista com as informações: altura, classificação e dados. Atribua o nome lista a esta operação.
lista<-list(altura,classificação,dados)
lista

#e) Suponha que após a criação da lista, no item d, surgiu uma errata e você precisa modificar a
#matriz dados dentro da lista. Onde se lê altura 1.5 leia-se 1.6. Realize as devidas alterações
#no objeto
lista[[3]][2,1]<-1.6
lista


#QUESTÃO 07 - Criar uma função para simular a jogada de moedas (cara ou coroa). A função deverá
#possuir dois argumentos (x e n), onde x será́ a "moeda" c("cara", "coroa") e n será́ o número de vezes
#que deseja jogar a moeda. OBS: Não esquecer de utilizar a função sample com repetição.

jogada_de_moedas<-function(x,n) {
  sample(x,n,replace=T)
  }

moeda<-c("Cara","Coroa")

#A) Utilizar a função para obter uma amostra de 10 resultado de lançamentos da moeda.
jogada_de_moedas(moeda,10)

#B) Utilizar a função para obter uma amostra de 1000 resultado de lançamentos da moeda.
jogada_de_moedas(moeda,1000)

#C) Utilize a função table para obter a quantidade de caras e coroas de uma amostra aleatória a
#partir de 1000 lançamentos da moeda.
table(jogada_de_moedas(moeda,1000))


#QUESTÃO 08 - A autorização de despejo para uma indústria requer que a concentração média
#mensal de Carbono Orgânico Dissolvido (COD) seja inferior a 50 mg/L. A indústria quer que isso
#seja interpretado como 50 mg/L está dentro do intervalo de confiança da média, que vai ser estimada
#a partir de 20 observações por mês. Para as 20 observações a seguir, estaria a indústria em
#conformidade com esta interpretação do padrão?
COD = c(57, 60, 49, 50, 51, 60, 49, 53, 49, 56, 64, 60, 49, 52, 69, 40, 44, 38, 53, 66)
COD

#a) Apresente um resumo estatístico do vetor COD.
summary(COD)

#b) Ordene o vetor do menor para o maior valor.
sort(COD)

#c) Crie um gráfico de ramos e folhas a partir destes dados.
stem(COD)

#d) Crie um gráfico de caixa e avalie se a distribuição dos dados é simétrica ou não.

boxplot(COD,main="Gráfico tipo Boxplot",xlab="valor",col="red")
#Avaliação:Como a linha da mediana está próxima ao primeiro quartil,
#os dados são assimétricos positivos.

#e) Realize um teste de hipótese bicaudal para averiguar se de fato a média de COD é igual a
#50.0. Utilize níveis de significância de 1%, 5% e 10%, respectivamente. Interprete os
#resultados dos testes.

t.test(COD,alternative=c("two.sided"),mu=50,conf.level=0.99)
#Como p-value=0.07419 > α =0,01, não se rejeita a hipótese nula. 
#Não é possível concluir que existe uma diferença estatisticamente significante.
#A autorização deve ser fornecida.

t.test(COD,alternative=c("two.sided"),mu=50,conf.level=0.95)
#Como p-value=0.07419 > α =0,05, não se rejeita a hipótese nula. 
#Não é possível concluir que existe uma diferença estatisticamente significante.
#A autorização deve ser fornecida.

t.test(COD,alternative=c("two.sided"),mu=50,conf.level=0.90)
#Como p-value=0.07419 < α =0,1, se rejeita a hipótese nula. 
#Conclui-se que existe uma diferença estatisticamente significante.
#A autorização não deve ser fornecida.


#QUESTÃO 09 - Gere dois vetores x e y com 100 observações aleatórias retirados de uma distribuição
#normal e mostre no gráfico (plot).

x<-rnorm(100)
y<-rnorm(100)
plot(x, y, main="x vs y", xlab="Valores de x",ylab="Valores de y")


#QUESTÃO 10 - Um biólogo foi ao campo e contou o número de sapos em 20 locais. Ele também
#anotou a umidade (umid) e a temperatura (temp) em cada local. Faça dois gráficos de pontos para
#mostrar a relação do número de sapos com as variáveis temperatura e umidade. Use a função par()
#para dividir a janela em duas.

#Os dados são:
#sapos 6-5-10-11-26-16-17-37-18-21-22-15-24-25-29-31-32-13-39-40
#umid 62-24-21-30-34-36-41-48-56-74-57-46-58-61-68-76-79-33-85-86
#temp 31-23-28-30-15-16-24-27-18-10-17-13-25-22-34-12-29-35-26-19

sapos<-c(6,5,10,11,26,16,17,37,18,21,22,15,24,25,29,31,32,13,39,40)
sapos
umid<-c(62,24,21,30,34,36,41,48,56,74,57,46,58,61,68,76,79,33,85,86)
umid
temp<- c(31,23,28,30,15,16,24,27,18,10,17,13,25,22,34,12,29,35,26,19)
temp

par(mfrow=c(1,2))
plot(temp, sapos, main="Sapos por temperatura", xlab="Temperatura",ylab="Sapos")
plot(umid, sapos, main="Sapos por umidade", xlab="Umidade",ylab="Sapos")

