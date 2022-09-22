rm(list=ls()); gc()
library(lpSolve)
library(matlab)
obj <- sin(1:200)^2+cos(1:200)
constraints <-zeros(200)
for(i in 1:198) constraints[i,c(i:(i+2))] <- rep(1,3)
constraints <- constraints[1:198,]

prime.number <- 2
for(i in 3:200) 
  if(all(i %% prime.number != 0)) prime.number <- c(prime.number,i)
prime.number

second.const <- zeros(200)[1:length(prime.number),]
for(i in 1:length(prime.number))
  second.const[i,prime.number[i]] <- 1

constraints <- rbind(constraints,second.const)
rhs <- c(rep(2.758,198),rep(1.56,length(prime.number)))
dir <- rep("<=",length(rhs))

lp("max", obj, constraints, dir, rhs)    # 목적함수 값
lp("max", obj, constraints, dir, rhs)$solution    # 최적해