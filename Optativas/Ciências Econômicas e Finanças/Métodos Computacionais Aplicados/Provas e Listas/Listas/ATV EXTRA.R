
title: "ATIVIDADE EXTRA - MCA"
author: "L�via Celita de Oliveira Lopes"
date: "13/08/2021"
output: pdf_document

#Funcoes utilizadas
install.packages("ggplot2")
library(PNADcIBGE)
library(survey)
library (dplyr)
#Chamando variaveis que selecionem os dados de cada ano
#Descrevendo as variaveis:
#   V2007 = sexo, 
#   V2009 = idade; 
#   VD4001 = situação da força de trabalho;
#   VD4002 = situação de ocupação;
#   VD4020 = Rendimento efetivo do trabalho;
#    
variaveis<- c("UF","V2007","V2009","VD4001", "VD4002","VD4020")

### Download dos dados da PNAD
dados15<- get_pnadc(
year = 2015,
quarter = 1,
vars = variaveis,
labels = T,
deflator = T,
design = T,
savedir = tempdir()
)
dados15 <- update(dados15, idade=case_when(
  V2009 %in% 14:17 ~ "14-17",
  V2009 %in% 18:24 ~ "18-24", 
  V2009 %in% 25:39 ~ "25-39", 
  V2009 %in% 40:59 ~ "40-59", 
  V2009 > 59 ~ "60+")
)
dados16<- get_pnadc(
year = 2016,
quarter = 1,
vars = variaveis,
labels = T,
deflator = T,
design = T,
savedir = tempdir()
)
dados16 <- update(dados16, idade=case_when(
  V2009 %in% 14:17 ~ "14-17",
  V2009 %in% 18:24 ~ "18-24", 
  V2009 %in% 25:39 ~ "25-39", 
  V2009 %in% 40:59 ~ "40-59", 
  V2009 > 59 ~ "60+")
)
dados17<- get_pnadc(
year = 2017,
quarter = 1,
vars = variaveis,
labels = T,
deflator = T,
design = T,
savedir = tempdir()
)
dados17 <- update(dados17, idade=case_when(
  V2009 %in% 14:17 ~ "14-17",
  V2009 %in% 18:24 ~ "18-24", 
  V2009 %in% 25:39 ~ "25-39", 
  V2009 %in% 40:59 ~ "40-59", 
  V2009 > 59 ~ "60+")
)
dados18<- get_pnadc(
year = 2018,
quarter = 1,
vars = variaveis,
labels = T,
deflator = T,
design = T,
savedir = tempdir()
)
dados18 <- update(dados18, idade=case_when(
  V2009 %in% 14:17 ~ "14-17",
  V2009 %in% 18:24 ~ "18-24", 
  V2009 %in% 25:39 ~ "25-39", 
  V2009 %in% 40:59 ~ "40-59", 
  V2009 > 59 ~ "60+")
)
dados19<- get_pnadc(
year = 2019,
quarter = 1,
vars = variaveis,
labels = T,
deflator = T,
design = T,
savedir = tempdir()
)
dados19 <- update(dados19, idade=case_when(
  V2009 %in% 14:17 ~ "14-17",
  V2009 %in% 18:24 ~ "18-24", 
  V2009 %in% 25:39 ~ "25-39", 
  V2009 %in% 40:59 ~ "40-59", 
  V2009 > 59 ~ "60+")
)
dados20<- get_pnadc(
year = 2020,
quarter = 1,
vars = variaveis,
labels = T,
deflator = T,
design = T,
savedir = tempdir()
)
dados20 <- update(dados20, idade=case_when(
  V2009 %in% 14:17 ~ "14-17",
  V2009 %in% 18:24 ~ "18-24", 
  V2009 %in% 25:39 ~ "25-39", 
  V2009 %in% 40:59 ~ "40-59", 
  V2009 > 59 ~ "60+")
)
dados21<- get_pnadc(
year = 2021,
quarter = 1,
vars = variaveis,
labels = T,
deflator = T,
design = T,
savedir = tempdir()
)
dados21 <- update(dados21, idade=case_when(
  V2009 %in% 14:17 ~ "14-17",
  V2009 %in% 18:24 ~ "18-24", 
  V2009 %in% 25:39 ~ "25-39", 
  V2009 %in% 40:59 ~ "40-59", 
  V2009 > 59 ~ "60+")
)
library(survey)
library(dplyr)
#item 
## Taxa de pessoas desocupadas por sexo, para o estado do Ceara�
txd15m <- svyratio(~VD4002 == "Pessoas desocupadas",~VD4001 == "Pessoas na forca de trabalho", subset(dados15, V2007=="Mulher" & UF=="Ceara"), se=F,na.rm = T)
txd15h <- svyratio(~VD4002 == "Pessoas desocupadas",~VD4001 == "Pessoas na forca de trabalho", subset(dados15, V2007=="Homem" & UF=="Ceara"), na.rm = T)
txd15brm <- svyratio(~VD4002 == "Pessoas desocupadas",~VD4001 == "Pessoas na forca de trabalho", subset(dados15, V2007=="Mulher"), na.rm = T)
txd15brh <- svyratio(~VD4002 == "Pessoas desocupadas",~VD4001 == "Pessoas na forca de trabalho", subset(dados15, V2007=="Homem"), na.rm = T)
rm15m <- svymean(~VD4020, subset(dados15, V2007=="Mulher" & UF=="Ceara"), na.rm=T)
rm15h <- svymean(~VD4020, subset(dados15, V2007=="Homem" & UF=="Ceara"), na.rm=T)
rm15brm <- svymean(~VD4020, subset(dados15, V2007=="Mulher"), na.rm=T)
rm15brh <- svymean(~VD4020, subset(dados15, V2007=="Homem"), na.rm=T)
rmage15 <- svyby(~VD4020, ~idade, dados15, svymean, na.rm = T)
txdage15 <- svyby(~idade, ~VD4002, dados15, svymean, na.rm = T)
rm(dados15) #Limpando os dados de 2015 para liberar espaco na memoria


txd16m <- svyratio(~VD4002 == "Pessoas desocupadas",~VD4001 == "Pessoas na forca de trabalho", subset(dados16, V2007=="Mulher" & UF=="Ceara"), na.rm = T)
txd16h <- svyratio(~VD4002 == "Pessoas desocupadas",~VD4001 == "Pessoas na forca de trabalho", subset(dados16, V2007=="Homem" & UF=="Ceara"), na.rm = T)
txd16brm <- svyratio(~VD4002 == "Pessoas desocupadas",~VD4001 == "Pessoas na forca de trabalho", subset(dados16, V2007=="Mulher"), na.rm = T)
txd16brh <- svyratio(~VD4002 == "Pessoas desocupadas",~VD4001 == "Pessoas na forca de trabalho", subset(dados16, V2007=="Homem"), na.rm = T)
rm16m <- svymean(~VD4020, subset(dados16, V2007=="Mulher" & UF=="Ceara"), na.rm=T)
rm16h <- svymean(~VD4020, subset(dados16, V2007=="Homem" & UF=="Ceara"), na.rm=T)
rm16brm <- svymean(~VD4020, subset(dados16, V2007=="Mulher"), na.rm=T)
rm16brh <- svymean(~VD4020, subset(dados16, V2007=="Homem"), na.rm=T)
rmage16 <- svyby(~VD4020, ~idade, dados16, svymean, na.rm = T)
txdage16 <- svyby(~idade, ~VD4002, dados16, svymean, na.rm = T)
rm(dados16) #Limpando os dados de 2016 para liberar espaco na memoria


txd17m <- svyratio(~VD4002 == "Pessoas desocupadas",~VD4001 == "Pessoas na forca de trabalho", subset(dados17, V2007=="Mulher" & UF=="Ceara"), na.rm = T)
txd17h <- svyratio(~VD4002 == "Pessoas desocupadas",~VD4001 == "Pessoas na forca de trabalho", subset(dados17, V2007=="Homem" & UF=="Ceara"), na.rm = T)
txd17brm <- svyratio(~VD4002 == "Pessoas desocupadas",~VD4001 == "Pessoas na forca de trabalho", subset(dados17, V2007=="Mulher"), na.rm = T)
txd17brh <- svyratio(~VD4002 == "Pessoas desocupadas",~VD4001 == "Pessoas na forca de trabalho", subset(dados17, V2007=="Homem"), na.rm = T)
rm17m <- svymean(~VD4020, subset(dados17, V2007=="Mulher" & UF=="Ceara"), na.rm=T)
rm17h <- svymean(~VD4020, subset(dados17, V2007=="Homem" & UF=="Ceara"), na.rm=T)
rm17brm <- svymean(~VD4020, subset(dados17, V2007=="Mulher"), na.rm=T)
rm17brh <- svymean(~VD4020, subset(dados17, V2007=="Homem"), na.rm=T)
rmage17 <- svyby(~VD4020, ~idade, dados17, svymean, na.rm = T)
txdage17 <- svyby(~idade, ~VD4002, dados17, svymean, na.rm = T)
rm(dados17) #Limpando os dados de 2017 


txd18m <- svyratio(~VD4002 == "Pessoas desocupadas",~VD4001 == "Pessoas na forca de trabalho", subset(dados18, V2007=="Mulher" & UF=="Ceara"), na.rm = T)
txd18h <- svyratio(~VD4002 == "Pessoas desocupadas",~VD4001 == "Pessoas na forca de trabalho", subset(dados18, V2007=="Homem" & UF=="Ceara"), na.rm = T)
txd18brm <- svyratio(~VD4002 == "Pessoas desocupadas",~VD4001 == "Pessoas na forca de trabalho", subset(dados18, V2007=="Mulher"), na.rm = T)
txd18brh <- svyratio(~VD4002 == "Pessoas desocupadas",~VD4001 == "Pessoas na forca de trabalho", subset(dados18, V2007=="Homem"), na.rm = T)
rm18m <- svymean(~VD4020, subset(dados18, V2007=="Mulher" & UF=="Ceara"), na.rm=T)
rm18h <- svymean(~VD4020, subset(dados18, V2007=="Homem" & UF=="Ceara"), na.rm=T)
rm18brm <- svymean(~VD4020, subset(dados18, V2007=="Mulher"), na.rm=T)
rm18brh <- svymean(~VD4020, subset(dados18, V2007=="Homem"), na.rm=T)
rmage18 <- svyby(~VD4020, ~idade, dados18, svymean, na.rm = T)
txdage18 <- svyby(~idade, ~VD4002, dados18, svymean, na.rm = T)
rm(dados18) #Limpando os dados de 2018 


txd19m <- svyratio(~VD4002 == "Pessoas desocupadas",~VD4001 == "Pessoas na forca de trabalho", subset(dados19, V2007=="Mulher" & UF=="Ceara"), na.rm = T)
txd19h <- svyratio(~VD4002 == "Pessoas desocupadas",~VD4001 == "Pessoas na forca de trabalho", subset(dados19, V2007=="Homem" & UF=="Ceara"), na.rm = T)
txd19brm <- svyratio(~VD4002 == "Pessoas desocupadas",~VD4001 == "Pessoas na forca de trabalho", subset(dados19, V2007=="Mulher"), na.rm = T)
txd19brh <- svyratio(~VD4002 == "Pessoas desocupadas",~VD4001 == "Pessoas na forca de trabalho", subset(dados19, V2007=="Homem"), na.rm = T)
rm19m <- svymean(~VD4020, subset(dados19, V2007=="Mulher" & UF=="Ceara"), na.rm=T)
rm19h <- svymean(~VD4020, subset(dados19, V2007=="Homem" & UF=="Ceara"), na.rm=T)
rm19brm <- svymean(~VD4020, subset(dados19, V2007=="Mulher"), na.rm=T)
rm19brh <- svymean(~VD4020, subset(dados19, V2007=="Homem"), na.rm=T)
rmage19 <- svyby(~VD4020, ~idade, dados19, svymean, na.rm = T)
txdage19 <- svyby(~idade, ~VD4002, dados19, svymean, na.rm = T)
rm(dados19) #Limpeza dos dados de 2019 para liberar espaço na memoria


txd20m <- svyratio(~VD4002 == "Pessoas desocupadas",~VD4001 == "Pessoas na forca de trabalho", subset(dados20, V2007=="Mulher" & UF=="Ceara"), na.rm = T)
txd20h <- svyratio(~VD4002 == "Pessoas desocupadas",~VD4001 == "Pessoas na forca de trabalho", subset(dados20, V2007=="Homem" & UF=="Ceara"), na.rm = T)
txd20brm <- svyratio(~VD4002 == "Pessoas desocupadas",~VD4001 == "Pessoas na forca de trabalho", subset(dados20, V2007=="Mulher"), na.rm = T)
txd20brh <- svyratio(~VD4002 == "Pessoas desocupadas",~VD4001 == "Pessoas na forca de trabalho", subset(dados20, V2007=="Homem"), na.rm = T)
rm20m <- svymean(~VD4020, subset(dados20, V2007=="Mulher" & UF=="Ceara"), na.rm=T)
rm20h <- svymean(~VD4020, subset(dados20, V2007=="Homem" & UF=="Ceara"), na.rm=T)
rm20brm <- svymean(~VD4020, subset(dados20, V2007=="Mulher"), na.rm=T)
rm20brh <- svymean(~VD4020, subset(dados20, V2007=="Homem"), na.rm=T)
rmage20 <- svyby(~VD4020, ~idade, dados20, svymean, na.rm = T)
txdage20 <- svyby(~idade, ~VD4002, dados20, svymean, na.rm = T)
rm(dados20) #Limpeza dos dados de 2020 para liberar espaço na memoria


txd21m <- svyratio(~VD4002 == "Pessoas desocupadas",~VD4001 == "Pessoas na forca de trabalho", subset(dados21, V2007=="Mulher" & UF=="Ceara"), na.rm = T)
txd21h <- svyratio(~VD4002 == "Pessoas desocupadas",~VD4001 == "Pessoas na forca de trabalho", subset(dados21, V2007=="Homem" & UF=="Ceara"), na.rm = T)
txd21brm <- svyratio(~VD4002 == "Pessoas desocupadas",~VD4001 == "Pessoas na forca de trabalho", subset(dados21, V2007=="Mulher"), na.rm = T)
txd21brh <- svyratio(~VD4002 == "Pessoas desocupadas",~VD4001 == "Pessoas na forca de trabalho", subset(dados21, V2007=="Homem"), na.rm = T)
rm21m <- svymean(~VD4020, subset(dados21, V2007=="Mulher" & UF=="Ceara"), na.rm=T)
rm21h <- svymean(~VD4020, subset(dados21, V2007=="Homem" & UF=="Ceara"), na.rm=T)
rm21brm <- svymean(~VD4020, subset(dados21, V2007=="Mulher"), na.rm=T)
rm21brh <- svymean(~VD4020, subset(dados21, V2007=="Homem"), na.rm=T)
rmage21 <- svyby(~VD4020, ~idade, dados21, svymean, na.rm = T)
txdage21 <- svyby(~idade, ~VD4002, dados21, svymean, na.rm = T )
rm(dados21) #Limpeza dos dados de 2021 para liberar espaço na memoria


### Criando tabelas
library(data.table)
dadosceara <- data.table(
  "Dados desagregados por sexo" = c("Taxa de Desocupacao Masculina Cearense","Erro padrao", 
            "Taxa de Desocupacao Feminina Cearense","Erro padrao", "Taxa de Desocupacao Masculina Brasileira",
            "Erro padrao","Taxa de Desocupacao Feminina Brasileira","Erro padrao", "Renda Media Masculina Cearense", 
            "Renda Media Feminina Cearense","Renda Media Masculina Brasileira", 
            "Renda Media Feminina Brasileira"),
  "2015" = (c(txd15h,txd15m,txd15brh,txd15brm,rm15h,rm15m,rm15brh,rm15brm)),
  "2016" = (c(txd16h,txd16m,txd16brh,txd16brm,rm16h,rm16m,rm16brm,rm16brh)),
  "2017" = (c(txd17h,txd17m,txd17brh,txd17brm,rm17h,rm17m,rm17brm,rm17brh)),
  "2018" = (c(txd18h,txd18m,txd18brh,txd18brm,rm18h,rm18m,rm18brm,rm18brh)),
  "2019" = (c(txd19h,txd19m,txd19brh,txd19brm,rm19h,rm19m,rm19brm,rm19brh)),
  "2020" = (c(txd20h,txd20m,txd20brh,txd20brm,rm20h,rm20m,rm20brm,rm20brh)),
  "2021" = (c(txd21h,txd21m,txd21brh,txd21brm,rm21h,rm21m,rm21brm,rm21brh))
)
dadosceara1 <- as.data.frame(dadosceara)
dadosceara2 <- dadosceara1[c(-2,-4,-6,-8),]
View(dadosceara2)


### Faixas etarias - Renda Media
dadoscearaidade <- data.table(
  "Faixa etaria" = c("14-17","18-24","25-39","40-59","60+"),
  "2015" = rmage15,
  "2016" = rmage16,
  "2017" = rmage17,
  "2018" = rmage18,
  "2019" = rmage19,
  "2020" = rmage20,
  "2021" = rmage21
)
dadoscearaidade <- as.data.frame(dadoscearaidade)
dadoscearaidade <- dadoscearaidade[,c(-2,-4,-5,-7,-8,-10,-11,-13,-14,-16,-17,-19,-20,-22,-23)]
View(dadoscearaidade)