
library(lpSolve)

obj <- c(20, 10)

const <- matrix(c(1, 0,
                  0, 1,
                  -1, 1,
                  1, 0,
                  0, 1), byrow = T, ncol = 2)

direction <- c(">=", ">=", "<=", ">=", ">=")

rhs <- c(1000, 1000, 500, 0, 0)



lp ("max", obj, const, direction, rhs)
lp ("max", obj, const, direction, rhs)$solution


# max v
# st
#   20x1 + 10 x2 -v = 0
#
#   x1 >= 1000
#   x2 >= 1000
#   -x1 + x2 <= 500
#
#   x1 >= 0
#   x2 >= 0
# end