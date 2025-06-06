#NOME ESMAEL RODRIGUES DA SILVA
#MATRICULA: 476203

#N 1°
#a) O percentual de pessoas ocupadas por sexo;
#b) O rendimento médio mensal por sexo;
#c) A distribuição de pessoas desocupadas por faixa etária (14 a 17 anos, 18 a 24 anos, 25 a 39
#anos, 40 a 59 anos, 60 anos ou mais);
#d) Rendimento médio mensal por faixa etária.
#e)Compare os valores obtidos nos itens (a) - (d) com os dados referentes ao mesmo trimestre
#de 2020. Monte quadros comparativos e analise a evolução dos valores.

#Instalando os pacotes
install.packages("PNADcIBGE")
library(PNADcIBGE)
library(survey)
library(dplyr)
library(haven)
library(lmtest)
library(rgl)
library(faraway)

gc()
memory.limit (9999999999)
fit<-lm(Y ~ X)
gc()

#Fazendo a importação dos dados PNAD no site do IBGE
variaveis_selecionadasPNAD <- c("UF", "V2007", "V2009", "VD4001", "VD4002", "VD4020","VD4009","VD4016","VD4020")
dadosPNADc2019.4 <- get_pnadc(year = 2019, quarter = 4, vars = variaveis_selecionadasPNAD)
dados2019_4 <- dadosPNADc2019.4$variables

#ANO 2019 (4ºTRIMESTRE)
#a)Percentual de pessoas ocupadas por sexo.
oc_sexo2019.4 <- svyby(~V2007, ~VD4002, dadosPNADc2019.4, svymean, na.rm = T)
oc_sexo2019.4

#b)Rendimento médio mensal por sexo.
rend_med_mensal_sexo2019.4 <- svyby(~VD4020, ~V2007, dadosPNADc2019.4, svymean, na.rm = T)
rend_med_mensal_sexo2019.4

#c) Distribuição de pessoas desocupadas por faixa etária.
dadosPNADc2019.4 <-update(dadosPNADc2019.4, Idade = case_when(
  V2009 %in% 14:17 ~ "14-17",
  V2009 %in% 18:24 ~ "18-24", 
  V2009 %in% 25:39 ~ "25-39", 
  V2009 %in% 40:59 ~ "40-59", 
  V2009 > 59 ~ "60+")
)
desoc_idade2019.4 <- svyby(~Idade, ~VD4002, dadosPNADc2019.4, svymean, na.rm = T)
desoc_idade2019.4

#d) Rendimento médio mensal por faixa etária.
rend_med_mensal_idade2019.4 <- svyby(~VD4020, ~Idade, dadosPNADc2019.4, svymean, na.rm = T)
rend_med_mensal_idade2019.4


#2020 (4ºTRIMESTRE)
variaveis_selecionadasPNADc2020 <- c("UF", "V2007", "V2009", "VD4001", "VD4002", "VD4020","VD4009","VD4016","VD4020")
dadosPNADc2020.4 <- get_pnadc(year = 2020, quarter = 4, vars = variaveis_selecionadasPNAD)
dados2020.4 <- dadosPNADc2020.4$variables

#a)Percentual de pessoas ocupadas por sexo.
oc_sexo2020.4 <- svyby(~V2007, ~VD4002, dadosPNADc2020.4, svymean, na.rm = T)
oc_sexo2020.4

#b)Rendimento médio mensal por sexo.
rend_med_mensal_sexo2020.4 <- svyby(~VD4020, ~V2007, dadosPNADc2020.4, svymean, na.rm = T)
rend_med_mensal_sexo2020.4

#c) Distribuição de pessoas desocupadas por faixa etária.
dadosPNADc2020.4 <-update(dadosPNADc2020.4, Idade = case_when(
  V2009 %in% 14:17 ~ "14-17",
  V2009 %in% 18:24 ~ "18-24", 
  V2009 %in% 25:39 ~ "25-39", 
  V2009 %in% 40:59 ~ "40-59", 
  V2009 > 59 ~ "60+")
)
desoc_idade2020.4 <- svyby(~Idade, ~VD4002, dadosPNADc2020.4, svymean, na.rm = T)
desoc_idade2020.4

#d) Rendimento médio mensal por faixa etária.
rend_med_mensal_idade2020.4 <- svyby(~VD4020, ~Idade, dadosPNADc2020.4, svymean, na.rm = T)
rend_med_mensal_idade2020.4

#e)Compare os valores obtidos nos itens (a) - (d) do 4ºtrimestre 2019 e 4ºtrimestre 2020. 
#Monte quadros comparativos e analise a evolução dos valores.

quadro1<-dplyr::right_join(oc_sexo2019.4,oc_sexo2020.4, by = "VD4002")
quadro1

#a)Pode-se perceber que que a ocupação do sexo do 4ºtrimestre-2019, a mulher: 44,06% e o homem: 55,94%. Já no mesmo 
#trimestre de 2020, tem-se que a mulher possui uma ocupação de 43,50% e o homem: 56,50%. Comparando os dois anos, 
#percebe-se que 2020 teve maior ocupação para o homem e menor ocupação para mulher em relação a 2019.

quadro2<-dplyr::right_join(rend_med_mensal_sexo2019.4,rend_med_mensal_sexo2020.4, by = "V2007")
quadro2

#b)Em 2019,o rendimento médio mensal para o homem foi de R$2654,90 e para mulher R$2107,33. Em 2020, o rendimento
#médio mensal para homem foi R$2682,62 e para mulher R$2217,60, logo em 2020 possui maior rendimento medio mensal 
#para os dois sexos.

quadro3<-dplyr::right_join(desoc_idade2019.4,desoc_idade2020.4, by = "VD4002")
quadro3

#c)Em relação a desocupação por idade em 2019, a menor desocupação foi na faixa etária foi de igual ou maior de 60 anos: 
#2,90% e a maior foi na faixa etária de 25 á 39 anos: 34,78%. Já em 2020, também as mesmas faixas etárias apresentaram
#menor e maior desocupação (igual ou > 60anos:2,82% e 25-39 anos: 35,26%)

quadro4<-dplyr::right_join(rend_med_mensal_idade2019.4,rend_med_mensal_idade2020.4, by = "Idade")   
quadro4

#d)Em 2019, a faixa etária que apresentou o menor rendimento médio mensal foi de 14-17 anos: R$: 554,84 e maior rendimento
#na faixa etária de igual ou >60 anos: 2929,50. Já em 2020, as mesmas faixas etárias também mostraram o menor e o maior 
#rendimento médio mensal (14-17anos: R$626,20 e igual ou >60anos: R$2989,69). Vale ressaltar que os rendimentos de 2020 em
#valores reais são maiores que o de 2019.

#N 2°

#Obs: No caso das estatísticas descritivas utilize as variáveis: V2009, VD4020 e VD4035.
#Variáveis:

#V2007  - Sexo
#V2009  - Idade do morador na data de referência
#V2010  - Cor ou raça
#VD3004 - Nível de instrução mais elevado alcançado (pessoas de 5 anos ou mais de idade)
#VD4020 - Rendimento mensal efetivo de todos os trabalhos para pessoas de 14 anos ou mais de idade
#(apenas para pessoas que receberam em dinheiro, produtos ou mercadorias em qualquer trabalho)
#VD4035 - Horas efetivamente trabalhadas na semana de referÃªncia em todos os trabalhos para
#pessoas de 14 anos ou mais de idade

#Importando a base da PNADcContínua (4ºtrimestre-2019)
variaveis_selecionadasPNAD <- c("UF", "V2007", "V2009", "V2010", "VD3004", "VD4020", "VD4035")
dadosPNADc <- get_pnadc(year = 2019, quarter = 4, vars = variaveis_selecionadasPNAD2)
dados2019 <- dadosPNADc$variables

#Histograma
gc()
memory.limit(9999999999)
svyhist(~ as.numeric(V2007), dadosPNADc, main = "Histograma", xlab = "Sexo")
svyhist(~ as.numeric(V2009), dadosPNADc, main = "Histograma", xlab = "Idade do morador")
svyhist(~ as.numeric(V2010), dadosPNADc, main = "Histograma", xlab = "Cor ou Raça")
svyhist(~ as.numeric(VD3004), dadosPNADc, main = "Histograma", xlab = "Nível de instrução")
svyhist(~ as.numeric(VD4020), dadosPNADc, main = "Histograma", xlab = "Rendimento mensal efetivo - VD4020")
svyhist(~ as.numeric(VD4035), dadosPNADc, main = "Histograma", xlab = "Número de Horas trabalhadas")
gc()
#Gráfico de Caixa

par(mfrow=c(2,2))
layout(matrix(c(1, 1,
                2, 3), nrow=2, byrow=TRUE))
svyboxplot(V2009 ~ V2007, dadosPNADc, main = "Idade do morador por sexo")
svyboxplot(V2009 ~ V2010, dadosPNADc, main = "Idade do morador por Cor ou Raça")
svyboxplot(V2009 ~ VD3004, dadosPNADc, main = "Idade do morador por Nível de instrução")

par(mfrow=c(2,2))
layout(matrix(c(1, 1,
                2, 3), nrow=2, byrow=TRUE))
svyboxplot(VD4020 ~ V2007, dadosPNADc, main = "Rendimento mensal efetivo por sexo")
svyboxplot(VD4020 ~ V2010, dadosPNADc, main = "Rendimento mensal efetivo por Cor ou Raça")
svyboxplot(VD4020 ~ VD3004, dadosPNADc, main = "Rendimento mensal efetivo por nível de instrução")

par(mfrow=c(2,2))
layout(matrix(c(1, 1,
                2, 3), nrow=2, byrow=TRUE))
svyboxplot(VD4035 ~ V2007, dadosPNADc, main = "Número de Horas trabalhadas por sexo")
svyboxplot(VD4035 ~ V2010, dadosPNADc, main = "Número de Horas trabalhadas por Cor ou Raça")
svyboxplot(VD4035 ~ VD3004, dadosPNADc, main = "Número de Horas trabalhadas por nível de instrução")


#Gráfico de dispersão

par(mfrow=c(2,2))
layout(matrix(c(1, 1,
                2, 3), nrow=2, byrow=TRUE))
svyplot(V2009 ~ V2007, dadosPNADc, style = "bubble", xlab = "Sexo", ylab = "Idade do morador")
svyplot(VD4020 ~ V2007, dadosPNADc, style = "bubble", xlab = "Sexo", ylab = "Rendimento mensal efetivo")
svyplot(VD4035 ~ V2007, dadosPNADc, style = "bubble", xlab = "Sexo", ylab = "Número de Horas trabalhadas")

par(mfrow=c(2,2))
layout(matrix(c(1, 1,
                2, 3), nrow=2, byrow=TRUE))
svyplot(VD4020 ~ V2010, dadosPNADc, style = "bubble", xlab = "Cor ou Raça", ylab = "Rendimento mensal efetivo")
svyplot(V2009 ~ V2010, dadosPNADc, style = "bubble", xlab = "Cor ou Raça", ylab = "Idade do morador")
svyplot(VD4035 ~ V2010, dadosPNADc, style = "bubble", xlab = "Cor ou Raça", ylab = "Número de Horas trabalhadas")

par(mfrow=c(2,2))
layout(matrix(c(1, 1,
                2, 3), nrow=2, byrow=TRUE))
svyplot(V2009 ~ VD3004, dadosPNADc, style = "bubble", xlab = "Nível de Instrução", ylab = "Idade do Morador")
svyplot(VD4035 ~ VD3004, dadosPNADc, style = "bubble", xlab = "Nível de Instrução", ylab = "Número de Horas trabalhadas")
svyplot(VD4020 ~ VD3004, dadosPNADc, style = "bubble", xlab = "Nível de Instrução", ylab = "Rendimento mensal efetivo")


# Estatísticas descritivas
nomes<-c("Média","Mediana","Máximo", "Mínimo")

#Idade do morador
media_idade_morador <- svymean(~V2009, dadosPNADc, na.rm = T)
mediana_idade_morador <- svyquantile(~V2009, dadosPNADc, quantiles = .5, na.rm = T)
max_idade <- max(dadosPNADc$variables$V2009, na.rm = TRUE)
min_idade <- min(dadosPNADc$variables$V2009, na.rm = TRUE)
estat_desc_idade_mor <- data.frame(media_idade_morador[1],mediana_idade_morador[1],max_idade,min_idade)
names(estat_desc_idade_mor) <- nomes
estat_desc_idade_mor

#Rendimento mensal
media_rend_mens <- svymean(~VD4020, dadosPNADc, na.rm = T)
mediana_rend_mens <- svyquantile(~VD4020, dadosPNADc, quantiles = .5, na.rm = T)
max_rend <- max(dadosPNADc$variables$VD4020, na.rm = TRUE)
min_rend <- min(dadosPNADc$variables$VD4020, na.rm = TRUE)
estat_desc_rend <- data.frame(media_rend_mens[1],mediana_rend_mens[1],max_rend,min_rend)
names(estat_desc_rend) <- nomes
estat_desc_rend

#Horas trabalhadas
media_horas <- svymean(~VD4035, dadosPNADc, na.rm = T)
mediana_horas <- svyquantile(~VD4035, dadosPNADc, quantiles = .5, na.rm = T)
max_horas <- max(dadosPNADc$variables$VD4035, na.rm = TRUE)
min_horas <- min(dadosPNADc$variables$VD4035, na.rm = TRUE)
estat_desc_horas <- data.frame(media_horas[1],mediana_horas[1],max_horas,min_horas)
names(estat_desc_horas) <- nomes
estat_desc_horas


#N 3° 
#(a) Uma variável distribuída como normal padrão ser maior que 3.
1-pnorm(3)

#(b) Uma variável normalmente distribuída com média 35 e desvio padrão 6 ser maior que 42.
1-pnorm(42,mean=35,sd=6)

#(c) Obtendo 10 de 10 sucessos em uma distribuição binomial com probabilidade de 0,8.
dbinom(x=10, size = 10,prob = 0.8)

#(d) X < 0,9 quando X tem a distribuição uniforme padrão.
punif(0.9)

#(e) X > 6,5 em uma distribuição X^2 com 2 graus de liberdade.
pchisq(6.5, df = 2,lower.tail = FALSE)


#N 4° Para estimar uma regressão linear múltipla no R devemos utilizar a função lm
#Sendo assim, importe para o RStudio o arquivo nomeado cidade.dta (Stata) e responda os itens a
#seguir:

#Fixar Diretório, importar os dados e fixar a base
setwd("D:/Jessica/Ciências Econômicas UFC/4º SEMESTRE/MÉTODOS COMPUTACIONAIS/Lista de Exercícios II_JessicaMariaSilvaVasconcelos")
cidades <- read_dta("base.cidades.dta")
attach(cidades)

#a) Plotar um gráfico de dispersão entre entre a taxa de divórcio (div) e a taxa de matrimômio (mat).
plot(div,mat,main = "Gráfico de Dispersão", xlab = "Taxa de Divórcio", ylab = "Taxa de Matrinômio")

#b)Verificar a correlação entre a taxa de divórcio (div) e a taxa de matrimômio (mat).
cor(div,mat)

#c)Faça uma regressão linear simples da taxa de divórcio contra a taxa de matrimônio e verifique
#a significância global, individual e o grau de ajustamento do modelo (R²).
reg_div_mat <- lm(div~mat)
summary(reg_div_mat)

#Conforme a regressão linear simples, pode-se perceber que o modelo é globalmente significante, pois no teste F,o p-valor 
#foi de < 2.2e-16.
#Vale ressaltar que a variável matrimônio é significante, pois conforme o teste T, o p-valor foi de < 2.2e-16.
#O R² corresponde à 86,88%, ou seja, quer dizer que as variações da taxa do matrimônio são explicadas em 86,88% nas variações
#da taxa de divòrcio. Percebe-se também que uma variação de uma unidade na taxa do matrimônio promove 0,303 de variação na 
#taxa do divórcio.

#d)Adicione ao modelo de regressão linear simples acima as varáveis medpop (mediana da idade da população) e a dummy indicativa 
#de região e, em seguida, reinterprete os resultados.

cidades2 <- cidades %>%
  mutate(region = case_when(regiao == 1 ~ "A",regiao == 2 ~ "B", regiao == 3 ~ "C"))
attach(cidades2)
reg_multipla <- lm(div~mat+medpop+region)
summary(reg_multipla)

##e) Testar a presença de heterocedasticidade e multicolinearidade no modelo. Interprete o
#resultado dos testes.

#Teste de multicolinariedade e heterocedasticidade.
vif(reg_multipla)
bptest(reg_multipla)

#Todas as estatísticas VIF foram menor que 5, logo não tem multicolinearidade e não apresenta heterocedasticidade.


#N 5° 

#ln(TC)=B1 + B2*ln(Q) + B3*ln(PL) + B4*ln(PF) + B5*ln(PK) + e

#Observação: Use o Rstudio para importar a base de dados. Em seguida criar as variáveis em logaritmo
#e realizar a estimação.
 
#Importando os dados e fixar base
nerlove <-read.csv2("D:/Jessica/Ciências Econômicas UFC/4º SEMESTRE/MÉTODOS COMPUTACIONAIS/base de dados nerlove.csv")
nerlove <- nerlove[,1:5]
nerlove
attach(nerlove)

#Responda:  
#a) Interprete os resultados obtidos.
regm_nerlove <- lm(log(TC)~log(Q)+log(PL)+log(PF)+log(PK))
resultados<-c(summary(regm_nerlove))

#Analisando a regressão múltipla percebe-se que somente as variáveis Produto (Q) e Preço do Combustível (PF) foram 
#estatisticamente significantes. 
#Vale ressaltar que todas as outras variáveis em ceteris paribus, uma variação de 1% na variável Produto (Q) gera uma
#variação de 0,72091% na variável Custo (TC).
#Vale ressaltar que todas as outras variáveis em ceteris paribus, uma variação de 1% na variável Preço do Combustível (PF) 
#gera uma variação de 0,42581% na variável Custo (TC)

#b) O modelo é globalmente ajustado? Justifique.
#Analisando a regressão múltipla, percebe-se que pelo test T, o p-valor foi < 2.2e-16, logo o modelo global é 
#estatisticamente  significante.
#Analisando o R²,as variáveis independetes são explicadas em 92,6% nas variações da variável Custo (CT).

#c) Use o pacote rgl para esboçar um Gráfico 3D com as variáveis PREÇO DO CAPITAL (PK),PREÇO DO TRABALHO (PL) e 
#PREÇO DO COMBUSTÍVEL (PF).
plot3d(PK,PL,PF)

#d) Analise a coerência dos sinais dos estimadores.
#Analisando a regressão, os sinais apresentados dos estimadores pelas variáveis Produto (Q) e Preço do Combustível (PF) são
#adequados e esperados, visto que, que quanto maior o volume produzido ou unidades produzidas, maior será o custo da produção.
#Logo quanto maior o preço do combustível, maior será o custo da produção.