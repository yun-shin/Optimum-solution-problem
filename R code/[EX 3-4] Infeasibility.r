
library(lpSolve)

obj <- c(1, 1)

const <- matrix(c(200, 400,
                  1, 0,
                  0, 1,
                  1, 0,
                  0, 1), byrow = T, ncol = 2)

direction <- c("<=", ">=", ">=", ">=", ">=")

rhs <- c(24000, 105, 30, 0, 0)



lp ("max", obj, const, direction, rhs)
lp ("max", obj, const, direction, rhs)$solution


# max v
# st
#   x1 + x2 - v = 0
#
#   200x1 + 400x2 <= 24000
#   x1 >= 105
#   x2 >= 30
#
#   x1 >= 0
#   x2 >= 0
# end