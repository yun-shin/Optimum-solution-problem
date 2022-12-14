library(TSP)

data <- matrix(c(0,209,176,59,12,47,125,184,159,108,109,80,293,237,178,160,147,102,208,
                 0,0,84,160,199,214,137,34,60,150,118,147,78,30,44,82,116,114,0.469,
                 0,0,0,127,167,137,181,51,20,73,73,109,169,112,123,102,158,158,84,
                 0,0,0,0,47,99,76,134,110,117,90,70,244,188,128,111,98,50,160,
                 0,0,0,0,0,99,76,134,110,117,90,70,244,188,128,111,98,50,199,
                 0,0,0,0,0,0,165,187,158,63,94,52,298,241,216,198,186,142,214,
                 0,0,0,0,0,0,0,113,157,178,151,146,187,110,67,49,25,17,137,
                 0,0,0,0,0,0,0,0,31,124,86,120,123,65,64,54,110,90,35,
                 0,0,0,0,0,0,0,0,0,95,55,86,145,87,97,83,139,133,60,
                 0,0,0,0,0,0,0,0,0,0,29,57,236,179,189,192,199,155,150,
                 0,0,0,0,0,0,0,0,0,0,0,31,206,147,150,143,172,127,118,
                 0,0,0,0,0,0,0,0,0,0,0,0,237,178,197,142,166,121,148,
                 0,0,0,0,0,0,0,0,0,0,0,0,0,60,119,148,192,204,77,
                 0,0,0,0,0,0,0,0,0,0,0,0,0,0,43,71,116,143,29,
                 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,31,75,74,44,
                 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,57,55,82,
                 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,43,118,
                 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,114,
                 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0), byrow = T, ncol = 19)

# data <- read.csv("kangwon_center_km.csv", header = F)             # csv 파일 읽기

name <- c("삼척", "춘천", "원주", "강릉", "동해", "태백", "속초", "홍천", "횡성", "영월", "평창", "정선", "철원", "화천", "양구", "인제", "고성", "양양", "강원도청")
rownames(data) <- colnames(data) <- name

nw.tsp <- as.matrix(data)                   # 건물 이름 분리 후 숫자 data를 행렬로 바꿈
n <- matrix(name)                                  # 데이터에 포함된 건물 이름을 분리
n <- t(n)                                       # 해당 데이터가 세로로 되어 있으므로 가로로 바꿈

nw.tsp <- nw.tsp + t(nw.tsp)                    # 숫자 데이터와 숫자 데이터의 행렬을 바꾼 데이터를 더함
# | 0 1 1 |      | 0 1 1 |     | 0 0 0 |    
# | 1 0 1 |  <-  | 0 0 1 |  +  | 1 0 0 |   
# | 1 1 0 |      | 0 0 0 |     | 1 1 0 |   
tsp <- TSP(nw.tsp)                              # 탐욕 알고리즘 사용

n_of_cities(tsp)                                # 건물 갯수 출력
labels(tsp)                                     # 건물 이름 출력
tour <- solve_TSP(tsp)                          # 탐욕 알고리즘의 결과 저장
names(tour)                                     # 탐욕 알고리즘이 계산한 순찰 순서
tour                                            # 탐욕 알고리즘이 계산한 총 비용

result <- data.frame(tour = names(tour))        # 찾은 여행 순서 저장.
samchuk <- as.numeric(which(result == "삼척"))  # 삼척의 인덱스 번호 찾음

if (samchuk > 1) {                              # 삼척의 인덱스가 1 보다 크면 삼척부터 순서 재정렬
  tmp <- as.data.frame(result[samchuk:19,])  
  result <- result[1:samchuk,]
  result <- as.data.frame(result[-samchuk])
  colnames (tmp) <- colnames(result) <- "tour"
  result <- rbind(tmp, result)
  View(result)
}else {
  View(result)
}


