# Clear workspace
rm(list = ls())

# Load dataset
df <- read.csv("C:/Users/yukta/Downloads/StudentPerformance (1).csv")

# Check structure
str(df)

# Create binary outcome variable
df$High_Performance <- ifelse(df$Performance.Index > 75, 1, 0)

# Logistic Regression Model
model <- glm(High_Performance ~ Sleep.Hours,
             family = binomial,
             data = df)

# Model summary
summary(model)

# Take a subset for plotting (first 20 observations)
subset_df <- df[1:20, ]

# Scatter plot
plot(subset_df$Sleep.Hours,
     subset_df$High_Performance,
     main = "Logistic Regression: High Performance vs Sleep Hours",
     xlab = "Sleep Hours",
     ylab = "Probability of High Performance",
     col = rgb(0, 0, 0, 0.3),
     pch = 19)

# Sequence of Sleep Hours for prediction
x_values <- seq(min(df$Sleep.Hours),
                max(df$Sleep.Hours),
                length.out = 100)

# Predicted probabilities
predicted_probs <- predict(
  model,
  newdata = data.frame(Sleep.Hours = x_values),
  type = "response"
)

# Logistic regression curve
lines(x_values,
      predicted_probs,
      col = "green",
      lwd = 3)
