
obj <- c(15, 50)

const <- matrix(c(1.2, 4,
                  0.5, 1,
                  0, 1,
                  1, 0,
                  0, 1), byrow = T, ncol = 2)

direction <- c("<=", "<=", "<=", ">=", ">=")

rhs <- c(240, 81, 40, 0, 0)

library(lpSolve)

lp ("max", obj, const, direction, rhs)
lp ("max", obj, const, direction, rhs)$solution


# max v
# st
#   15x1 + 50x2 -v = 0
# 
#   1.2x1 + 4x2 <= 240
#   0.5x1 + x2 <= 81
#   x2 <= 40
# 
#   x1 >= 0
#   x2 >= 0
# end