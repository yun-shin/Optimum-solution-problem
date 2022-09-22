
#install.packages("lpSolve")

obj <- c(1.5, 1)

const <- matrix(c(1, 0,
                  0, 1,
                  1, 1,
                  1, 0,
                  0, 1), byrow = T, ncol = 2)

direction <- c("<=", "<=", "<=", ">=", ">=")

rhs <- c(4, 6, 5, 0, 0)

library(lpSolve)

lp ("max", obj, const, direction, rhs)
lp ("max", obj, const, direction, rhs)$solution
