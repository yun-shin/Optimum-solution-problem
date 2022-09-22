
library(lpSolve)

obj <- c(0.4, 0.6)

const <- matrix(c(5, 10,
                  1, 1,
                  0, 1,
                  1, 0,
                  0, 1), byrow = T, ncol = 2)

direction <- c("<=", "<=", ">=", ">=", ">=")

rhs <- c(38, 5, 1, 0, 0)


lp ("max", obj, const, direction, rhs)
lp ("max", obj, const, direction, rhs)$solution

lp ("max", obj, const, direction, rhs, int.vec = 1:2) #1 ~ 2번째 정수 모두 int
lp ("max", obj, const, direction, rhs, int.vec = 1:2)$solution


# [Lindo 예제]
# max 0.4x1 + 0.6x2
# st
# 
# 5x1 + 10x2 <= 38
# x1 + x2 <= 5
# x2 >= 1
# x1 >= 0
# 
# end
# 
# gin x1
# gin x2