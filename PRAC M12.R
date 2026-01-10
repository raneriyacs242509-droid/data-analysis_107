# -------------------------------------------------
# Clear Environment
# -------------------------------------------------
rm(list = ls())

# -------------------------------------------------
# Create a Sample Dataset
# -------------------------------------------------
data <- data.frame(
  Age = c(22, 25, 30, 28, 35, 40, 45, 50),
  Salary = c(25000, 30000, 40000, 38000, 50000, 60000, 65000, 70000),
  Experience = c(1, 2, 5, 4, 8, 12, 15, 20),
  Performance = c(60, 65, 70, 72, 80, 85, 88, 90)
)

# View dataset
print(data)

# -------------------------------------------------
# Select Only Numeric Columns
# -------------------------------------------------
numeric_data <- data[sapply(data, is.numeric)]

# -------------------------------------------------
# Generate Correlation Matrix
# -------------------------------------------------
correlation_matrix <- cor(numeric_data)

# Print Correlation Matrix
print(correlation_matrix)

# -------------------------------------------------
# Rounded Correlation Matrix (Better Readability)
# -------------------------------------------------
rounded_cor <- round(correlation_matrix, 2)
print(rounded_cor)

# -------------------------------------------------
# Correlation using Different Methods
# -------------------------------------------------

# Pearson Correlation (default)
cor_pearson <- cor(numeric_data, method = "pearson")
print(cor_pearson)

# Spearman Correlation
cor_spearman <- cor(numeric_data, method = "spearman")
print(cor_spearman)

# Kendall Correlation
cor_kendall <- cor(numeric_data, method = "kendall")
print(cor_kendall)

# -------------------------------------------------
# Handle Missing Values (Example)
# -------------------------------------------------
cor_with_na <- cor(numeric_data, use = "complete.obs")
print(cor_with_na)

# -------------------------------------------------
# Visualize Correlation Matrix
# -------------------------------------------------
heatmap(correlation_matrix,
        col = colorRampPalette(c("red", "white", "blue"))(20),
        symm = TRUE)
