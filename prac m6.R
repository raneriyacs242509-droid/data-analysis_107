data <- data.frame(
  Subject = 1:10,
  Before = c(65,70,68,72,66,75,78,74,80,77),
  After  = c(70,75,72,78,71,80,82,79,85,83)
)

str(data)

mean(data$Before)
mean(data$After)

sd(data$Before)
sd(data$After)

difference <- data$After - data$Before
shapiro.test(difference)

paired_t_test <- t.test(
  data$Before,
  data$After,
  paired = TRUE
)
paired_t_test

long_data <- data.frame(
  Score = c(data$Before, data$After),
  Time = rep(c("Before","After"), each = nrow(data))
)

t.test(Score ~ Time, data = long_data, paired = TRUE)
