# soma
5+2

# sub
5-2

# mult
5*2

# div
5/2

# mod
5%%2

# div inteira
5%/%2

# raiz
sqrt(3)

# exp
exp(2)

# log
log(10)

# data frame model
mtcars

# ajuda
help("plot")

# printar
print("Hello")

plot(sin, 0, pi*2)

# derivadas
f = expression(x^2 + 5*x + 1)
print(D(f, 'x'))

# integrais definidas
my_f <- function(x) { out <- (x^2 + 5*x + 1) }
integrate(my_f,          # Apply integrate in R
          lower = 0,
          upper = 10)