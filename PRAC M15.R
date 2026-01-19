
rm(list = ls())


library(ggplot2)
library(writexl)


df <- read.csv("C:/Users/yukta/Downloads/StudentPerformance (1).csv")

str(df)


df$High_Performance <- ifelse(df$Performance.Index >= 75, 1, 0)


logit_model <- glm(
  High_Performance ~ Sleep.Hours,
  data = df,
  family = binomial
)


summary(logit_model)


# Scatter plot
plot(
  df$Sleep.Hours,
  df$High_Performance,
  main = "Logistic Regression: High Performance vs Sleep Hours",
  xlab = "Sleep Hours",
  ylab = "Probability of High Performance",
  pch = 19,
  col = rgb(0, 0, 0, 0.25)
)

# Create smooth x values
x_vals <- seq(
  min(df$Sleep.Hours),
  max(df$Sleep.Hours),
  length.out = 100
)

# Predicted probabilities
y_vals <- predict(
  logit_model,
  newdata = data.frame(Sleep.Hours = x_vals),
  type = "response"
)

# Add logistic curve
lines(
  x_vals,
  y_vals,
  col = "blue",
  lwd = 3
)



# Save prediction data
output <- data.frame(
  Sleep.Hours = x_vals,
  Probability = y_vals
)

write.csv(output, "logistic_results.csv", row.names = FALSE)
write_xlsx(output, "logistic_results.xlsx")

# Save graph as PDF
pdf("logistic_graph.pdf", width = 8, height = 6)
plot(
  df$Sleep.Hours,
  df$High_Performance,
  main = "Logistic Regression: High Performance vs Sleep Hours",
  xlab = "Sleep Hours",
  ylab = "Probability of High Performance",
  pch = 19,
  col = rgb(0, 0, 0, 0.25)
)
lines(x_vals, y_vals, col = "blue", lwd = 3)
dev.off()
