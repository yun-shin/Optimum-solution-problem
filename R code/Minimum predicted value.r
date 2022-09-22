rm(list=ls()); gc()

X1 <- .01*c(522,976,213,138,780,259,380,384,363,697,
            680,609,643,244,107,580,593,785,597,427)
X2 <- .01*c(274,1988,616,1283,1160,379,1725,1681,1639,489,646,
            1619,378,1538,948,551,353,1376,1095,481)
Y <- .01*c(2543,5299,2600,3052,4176,2129,3891,3806,3872,3356,
           3288,4204,3006,3619,2697,3106,2766,4462,3722,2719)

library(lpSolve)
obj <- c(1,0,0,0) # 목적함수 계수
cons <- matrix(rep(0,80), ncol = 4) 
cons[,1:2] <- 1
cons[,3] <- X1
cons[,4] <- sqrt(X2)
cons <- rbind(cons,cons) 
cons[21:40,2:4] <- -cons[21:40,2:4] # 제약식 행렬
rhs <- c(Y,-Y) # 제약식 우변상수
dir <- rep(">=",40) # 제약식 부등호

lp("min", obj, cons, dir, rhs) 
lp("min", obj, cons, dir, rhs)$solution

w0 <- lp("min", obj, cons, dir, rhs)$solution[2]
w1 <- lp("min", obj, cons, dir, rhs)$solution[3]
w2 <- lp("min", obj, cons, dir, rhs)$solution[4]
cat("답 : w0 =",w0, ", w1 =",w1,", w2 =",w2,"\n")