# QUESTION 01

A <- matrix(c(-4, 0.3, 54.3, -4), nrow = 2, ncol = 2, byrow = TRUE)
b <- c(12.3, 45)
question01 <- solve(A, b)
print(question01)


# QUESTION 02

# a
question02A = c(4, 8, 2)
print(question02A)

# b
question02B = seq(10, 20)
print(question02B)
print(c(question02B[1], question02B[3]))

# c
question02C = c(-3:3)
print(question02C)

# d
question02D = c(2.4:10.4)
print(question02D)

# e
question02E = seq(1,40,2)
print(question02E)

# f
question02F = rep(c(1, 2, 3), 3)
print(question02F)

# g
question02G = rep(1:4, each=3)
print(question02G)

# h
question02H = c("Parana", "Sao Paulo", "Minas Gerais")
print(question02H)


# QUESTION 03

# 03 a
question03A = c("Pedro", "João", "Maria")
print(question03A)

# 03 b
question03B = matrix(seq(2,18,2), nrow = 3, ncol = 3, byrow = TRUE)
print(question03B)

# 03 c
mylist = list(question03A, question03B)
question03C = mylist
print(question03C)

# 03 d
mylist[[1]][3] <- "Mariana"
question03D = mylist
print(question03D)

# 03 e
mylist[[2]][2,2] <- 100
question03E = mylist
print(question03E)


# QUESTION 04

matriz <- matrix(1:100, nrow = 10, ncol = 10, byrow = TRUE)
question04 <- matriz
print(question04)


# QUESTION 05

x <- 0:50
x2 <- x*x
question05 <- data.frame(x, x2, exp(x))
print(question05)

