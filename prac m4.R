rm(list = ls())

data <- read.csv("C:/Users/vibro/Downloads/HR_Analytics.csv.csv")

str(data)
summary(data)

x <- data$MonthlyIncome
x <- na.omit(x)

t_test_result <- t.test(x, mu = 6500)
t_test_result