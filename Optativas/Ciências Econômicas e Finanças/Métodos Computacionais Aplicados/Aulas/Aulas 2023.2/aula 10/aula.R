x <- c(1,2,3)
y <- c(4,5,6)
z <- c(7,8,9)

matriz1 <- cbind(x,y,z)
matriz2 <- rbind(x,y,z)


# ---------------------------------- #

nesimotermo <- function(a1, n, r) {
  return( a1 + (n-1) * r )
}

soma_pa <- function(a1, an, n) {
  return( ((a1+an) * n) / 2 )
}


nesimotermo(2, 7, 2)
nesimotermo(107, 101, 6)
soma_pa(3, 15, 7)