### AP1 - METODOS COMPUTACIONAIS APLICADOS 2023.2
# ALUNOS:
# Eduardo Santos de Castro – 514554
# Natanael Silveira de Melo – 500822
# Thiago Marques Sousa – 412645
###

# QUESTAO 04
tempo <- c(35, 42, 50, 45, 38, 36, 47, 48, 33, 39)
tempo

# Maximo, minimo e média
max(tempo)
min(tempo)
mean(tempo)

tempo[9] <- 37
tempo



# QUESTAO 05
# A
A <- matrix(c(1, 1, 1, -1), nrow = 2, ncol = 2, byrow = TRUE)
B <- c(27/9, 1)
solve(A, B)

# B
A <- matrix(c(3, 2, 2, 5), nrow = 2, ncol = 2, byrow = TRUE)
B <- c(2, 5)
solve(A, B)

# C
A <- matrix(c(1, 2, 1, 1, -3, 5, 2, -1, 3), nrow = 3, ncol = 3, byrow = TRUE)
B <- c(12, 1, 10)
solve(A, B)



# QUESTAO 06
temp <- c(9, 0, 10, 13, 15, 17, 18, 17, 22, 11, 15)

# Raiz quadrada de temp
sqrt(temp)
# Log natural de temp
log(temp)
# Log natural (x + 1) de x = temp
log(temp + 1)
# Valores de temp ao quadrado
temp**2
# 2 * temp + raiz quadrada
2*temp+sqrt(temp)
