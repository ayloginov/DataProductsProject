library(readxl)
library(dplyr)
library(caret)

t <- read_xls("titanic3.xls") 
t <- as.data.frame(t)
t$sex <- as.factor(t$sex)
t$survived <- as.factor(t$survived)
t$pclass <- as.factor(t$pclass)
t <- mutate(t, age2 = age^2, fare2 = fare^2)
t <- subset(t, select = c("age", "age2", "sibsp", "sex", "fare", "fare2", "parch", "pclass", "survived"))
t <- t[complete.cases(t), ]
