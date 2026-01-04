# Load dataset
data <- read.csv("wine_quality_merged.csv")

# View full dataset in spreadsheet format
View(data)

# Print first few rows
print(head(data))

# Print last few rows
print(tail(data))

# Print structure of data
print(str(data))

# Print summary statistics
print(summary(data))
