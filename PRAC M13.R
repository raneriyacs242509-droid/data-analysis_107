
rm(list = ls())


student_df <- read.csv("C:/Users/yukta/Downloads/StudentPerformance (1).csv", header = TRUE)


head(student_df)
str(student_df)


numeric_df <- student_df[, sapply(student_df, is.numeric)]


head(numeric_df)


model <- lm(numeric_df[, 1] ~ numeric_df[, 2])


summary(model)


plot(
  numeric_df[, 2],
  numeric_df[, 1],
  main = "Linear Regression: Student Performance Dataset",
  xlab = colnames(numeric_df)[2],
  ylab = colnames(numeric_df)[1],
  pch = 19,
  col = "orange"
)

abline(model, col = "blue", lwd = 2)
