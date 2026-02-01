# -----------------------------------------
# Clear workspace
# -----------------------------------------
rm(list = ls())

# -----------------------------------------
# Load ggplot2 (THIS IS MANDATORY)
# -----------------------------------------
library(ggplot2)

# -----------------------------------------
# Create sample dataset
# -----------------------------------------
data <- data.frame(
  PM25 = c(12, 18, 25, 30, 35, 40, 28, 22, 19, 45, 50, 55, 60, 33, 27)
)

# -----------------------------------------
# HISTOGRAM
# -----------------------------------------
ggplot(data, aes(x = PM25)) +
  geom_histogram(
    binwidth = 5,
    fill = "steelblue",
    color = "black"
  ) +
  labs(
    title = "Histogram of PM2.5 Levels",
    x = "PM2.5 Value",
    y = "Frequency"
  ) +
  theme_minimal()

# -----------------------------------------
# BOX PLOT
# -----------------------------------------
ggplot(data, aes(y = PM25)) +
  geom_boxplot(
    fill = "orange",
    color = "black"
  ) +
  labs(
    title = "Box Plot of PM2.5 Levels",
    y = "PM2.5 Value"
  ) +
  theme_minimal()
