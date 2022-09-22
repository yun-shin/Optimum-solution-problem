library(TSP)

setwd ("~/최적화 및 기계학습/[Homework] 학교 순찰 경로")                           # 파일 위치
data <- read.csv("PathData.csv", header = F)    # csv 파일 읽기
nw.tsp <- as.matrix(data[-1])                   # 건물 이름 분리 후 숫자 data를 행렬로 바꿈
n <- data[1]                                    # 데이터에 포함된 건물 이름을 분리
n <- t(n)                                       # 해당 데이터가 세로로 되어 있으므로 가로로 바꿈

nw.tsp <- nw.tsp + t(nw.tsp)                    # 숫자 데이터와 숫자 데이터의 행렬을 바꾼 데이터를 더함
                                                # | 0 1 1 |      | 0 1 1 |     | 0 0 0 |    
                                                # | 1 0 1 |  <-  | 0 0 1 |  +  | 1 0 0 |   
                                                # | 1 1 0 |      | 0 0 0 |     | 1 1 0 |   
colnames(nw.tsp) <- rownames(nw.tsp) <- as.character(1:21)  # 각 행렬 이름을 1 ~ 21 까지의 숫자로 셋팅
tsp <- TSP(nw.tsp)                              # 탐욕 알고리즘 사용

n_of_cities(tsp)                                # 건물 갯수 출력
labels(tsp)                                     # 건물 이름 출력
tour <- solve_TSP(tsp)                          # 탐욕 알고리즘의 결과 저장
names(tour)                                     # 탐욕 알고리즘이 계산한 순찰 순서
tour                                            # 탐욕 알고리즘이 계산한 총 비용 (여기선 순찰 거리)

show <- as.numeric(names(tour))                 # names()는 반환 값이 character 임으로 숫자인 numeric 형태로 변경
for (i in show) {                               # 탐욕 알고리즘이 계산한 순찰 순서에 따른 건물 이름 출력
  print(n[i])
}  