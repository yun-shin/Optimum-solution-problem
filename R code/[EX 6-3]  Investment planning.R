
library(lpSolve)

obj <- c(40, 30, 50, 45)

const <- matrix(c(10, 1, 5, 10,
                  10, 20, 30, 15,
                  10, 5, 20, 15
                  , byrow = T, ncol = 4))

direction <- c("<=", "<=", "<=")

rhs <- c(20, 60, 40)

# 이진정수계획문제
lp ("max", obj, const, direction, rhs, binary.vec = 1:4)
lp ("max", obj, const, direction, rhs, binary.vec = 1:4)$solution



# [lindo code]
# max 40X1 + 30X2 + 50X3 + 45X4
# st
# 10X1 + X2 + 5X3 + 10X4 <= 20
# 10X1 + 20X2 + 30X3 + 15X4 <= 60 
# 10X1 + 5X2 + 20X3 + 15X4 <= 40
# 
# end
# 
# int X1
# int X2
# int X3
# int X4
