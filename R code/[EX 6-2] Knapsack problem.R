
library(lpSolve)

obj <- c(75, 20, 40, 50, 30, 25, 15)

const <- matrix(c(5, 2, 1.2, 4, 2.5, 4.5, 0.5
                  , byrow = T, ncol = 7))

direction <- c("<=")

rhs <- c(12)

# 이진정수계획문제
lp ("max", obj, const, direction, rhs, binary.vec = 1:7)
lp ("max", obj, const, direction, rhs, binary.vec = 1:7)$solution



# [lindo code]
# max 75X1+ 20X2+ 40X3 + 50X4 + 30X5 + 25X6 + 15X7
# st
# 5X1 + 2X2 + 1.2X3 + 4X4 + 2.5X5 + 4.5X6 + 0.5X7 <= 12
# 
# end
# 
# int X1
# int X2
# int X3
# int X4
# int X5
# int X6
# int X7