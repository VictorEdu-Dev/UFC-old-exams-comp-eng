# ====== Questão 06 ======

set.seed(20)

notas <- data.frame(
  Matricula = sample(x = 011475:012990, size = 30, replace = FALSE),
  Prova1 = sample(x = 1:10, size = 30, replace = TRUE),
  Prova2 = sample(x = 1:10, size = 30, replace = TRUE),
  Trabalho_Final = sample(x = 1:10, size = 30, replace = TRUE)
)

notas$Media <- (notas$Prova1 * 0.4 + notas$Prova2 * 0.4 + notas$Trabalho_Final * 0.2)

notas$Resultado <- ifelse(notas$Media >= 6, "Aprovado", "Reprovado")

# ====== Questão 07 ======

alunos <- c("Pedro", "João", "Maria")
matriz <- matrix(data = seq(from = 2, to = 18, by = 2), nrow = 3, ncol = 3, byrow = TRUE)
lista <- list(alunos, matriz)
lista[[1]]
lista[[1]][3] <- "Mariana"
lista[[2]][2, 2] <- 100

# ====== Questão 08 ======

x1 <- seq(from = 1, to = 4, by = 1)
x2 <- seq(from = 2, to = 11, by = 3)
x3 <- LETTERS[1:4]
x4 <- letters[1:4]
x5 <- c("A", "C", "G", "E")
x6 <- seq(from = 10, to = 7, by = -1)
x7 <- seq(from = 10, to = 4, by = -2)
x8 <- rep(c(2, 5, 8), each = 4)
X9 <- c(x1, x2, x3, x4, x5, x6, x7, x8)

# ====== Questão 09 ======

COD <- c(57, 60, 49, 50, 51, 60, 49, 53, 49, 56, 64, 60, 49, 52, 69, 40, 44, 38, 53, 66)

#resumo estatístico
summary(COD)

COD_ordenado <- sort(COD)
COD_ordenado


#gráfico de ramos e folhas
stem(COD)

#gráfico de caixa
boxplot(COD)

t.test(COD, mu = 50)

# ou, especificando o nível de significância:
t.test(COD, mu = 50, conf.level = 0.99)
t.test(COD, mu = 50, conf.level = 0.95)
t.test(COD, mu = 50, conf.level = 0.90)

# ====== Questão 10 ======

# Dados
sapos <- c(6, 5, 10, 11, 26, 16, 17, 37, 18, 21, 22, 15, 24, 25, 29, 31, 32, 13, 39, 40)
umid <- c(62, 24, 21, 30, 34, 36, 41, 48, 56, 74, 57, 46, 58, 61, 68, 76, 79, 33, 85, 86)
temp <- c(31, 23, 28, 30, 15, 16, 24, 27, 18, 10, 17, 13, 25, 22, 34, 12, 29, 35, 26, 19)

# Gráficos de pontos
par(mfrow=c(1,2))
plot(sapos ~ temp, xlab="Temperatura", ylab="Número de sapos", main="Relação entre temperatura e número de sapos")
plot(sapos ~ umid, xlab="Umidade", ylab="Número de sapos", main="Relação entre umidade e número de sapos")

# install.packages("rgl")

library(rgl)

# Criação do gráfico 3D
plot3d(sapos, temp, umid, xlab="Numero de sapos", ylab="Temperatura", zlab="Umidade", type="s")
