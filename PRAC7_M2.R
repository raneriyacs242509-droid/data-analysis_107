

# Create dataset
group <- c("A", "A", "A", "B", "B", "B", "C", "C", "C")
score <- c(85, 88, 90, 78, 75, 80, 92, 95, 94)

data <- data.frame(group, score)

# Display dataset
print(data)

# Perform one-way ANOVA
result <- aov(score ~ group, data = data)

# Show ANOVA table
summary(result)
