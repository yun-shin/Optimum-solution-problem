
library(lpSolve)

obj <- c(20, 50)                                                  # 목적식

const <- matrix(c(1.2, 4,
                  0.5, 1,
                  0, 1,
                  1, 0,
                  0, 1), byrow = T, ncol = 2)                     # 제약식의 좌변

direction <- c("<=", "<=", "<=", ">=", ">=")                      # 제약식의 부등호

rhs <- c(240, 81, 40, 0, 0)                                       # 제약식의 우변

lp ("max", obj, const, direction, rhs, int.vec = 1:3)             #1 ~ 3번째 정수 모두 int
lp ("max", obj, const, direction, rhs, int.vec = 1:3)$solution