library(lpSolve)

# min - > max로 바꾸면 -1 곱하면 댐

obj <- c(400, 200, 350)

const <- matrix(c(100, 150, 50,
                  100, 50, 200,
                  100, 50, 100,
                  
                  1, 0, 0,
                  0, 1, 0,
                  0, 0, 1,
                  
                  1, 0, 0,
                  0, 1, 0,
                  0, 0, 1), byrow = T, ncol = 3)

direction <- c("<=", "<=", "<=", ">=", ">=", ">=", "<=", "<=", "<=")

rhs <- c(250, 400, 200, 0, 0, 0, 1, 1, 1)


lp ("max", obj, const, direction, rhs)
lp ("max", obj, const, direction, rhs)$solution

lp ("max", obj, const, direction, rhs, int.vec = 1:3) #1 ~ 2번째 정수 모두 int
lp ("max", obj, const, direction, rhs, int.vec = 1:3)$solution

# max v
# st
# 450F + 200W + 350M - v = 0 
# 
# 100F + 150W + 50M <= 250
# 100F + 50W + 200M <= 400
# 100F + 50W + 100M <= 200
# 
# F >= 0
# W >= 0
# M >= 0
# 
# F <= 1
# W <= 1
# M <= 1
# 
# end
# 
# gin F
# gin W
# gin M




