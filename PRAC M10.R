# -----------------------------------------
# Clear Environment
# -----------------------------------------
rm(list = ls())

# -----------------------------------------
# Install & Load Required Packages
# -----------------------------------------
install.packages("ggplot2")   # Run once if not installed
install.packages("dplyr")     # Run once if not installed

library(ggplot2)
library(dplyr)

# -----------------------------------------
# Import Dataset
# -----------------------------------------
# Example dataset: mtcars (built-in)
data <- mtcars

# View dataset
head(data)
str(data)

# -----------------------------------------
# 1. Bar Chart (Count of Cars by Cylinders)
# -----------------------------------------
ggplot(data, aes(x = factor(cyl))) +
  geom_bar(fill = "steelblue") +
  labs(
    title = "Count of Cars by Number of Cylinders",
    x = "Cylinders",
    y = "Count"
  ) +
  theme_minimal()

# -----------------------------------------
# 2. Histogram (Distribution of Mileage)
# -----------------------------------------
ggplot(data, aes(x = mpg)) +
  geom_histogram(binwidth = 3, fill = "orange", color = "black") +
  labs(
    title = "Distribution of Mileage (mpg)",
    x = "Miles per Gallon",
    y = "Frequency"
  ) +
  theme_minimal()

# -----------------------------------------
# 3. Scatter Plot (Mileage vs Horsepower)
# -----------------------------------------
ggplot(data, aes(x = hp, y = mpg)) +
  geom_point(color = "red", size = 3) +
  labs(
    title = "Mileage vs Horsepower",
    x = "Horsepower",
    y = "Miles per Gallon"
  ) +
  theme_minimal()

# -----------------------------------------
# 4. Scatter Plot with Regression Line
# -----------------------------------------
ggplot(data, aes(x = wt, y = mpg)) +
  geom_point(color = "darkgreen", size = 3) +
  geom_smooth(method = "lm", se = FALSE, color = "blue") +
  labs(
    title = "Mileage vs Weight with Regression Line",
    x = "Weight",
    y = "Miles per Gallon"
  ) +
  theme_minimal()

# -----------------------------------------
# 5. Box Plot (Mileage by Cylinders)
# -----------------------------------------
ggplot(data, aes(x = factor(cyl), y = mpg)) +
  geom_boxplot(fill = "purple") +
  labs(
    title = "Mileage by Number of Cylinders",
    x = "Cylinders",
    y = "Miles per Gallon"
  ) +
  theme_minimal()

# -----------------------------------------
# 6. Line Chart (Average Mileage by Cylinders)
# -----------------------------------------
avg_mpg <- data %>%
  group_by(cyl) %>%
  summarise(mean_mpg = mean(mpg))

ggplot(avg_mpg, aes(x = cyl, y = mean_mpg)) +
  geom_line(color = "brown", linewidth = 1) +
  geom_point(size = 3) +
  labs(
    title = "Average Mileage by Cylinders",
    x = "Cylinders",
    y = "Average MPG"
  ) +
  theme_minimal()


