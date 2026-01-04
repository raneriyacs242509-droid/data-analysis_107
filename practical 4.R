

# Clear environment
rm(list = ls())

# Set working directory (optional)
# setwd("C:/Your/Path/Here")

# Load dataset
data <- read.csv("C:/Users/vibro/Downloads/wine_quality_merged.csv")

# View dataset
View(data)

# -------------------------------
# USING subset()  (Base R)
# -------------------------------

# 1. Alcohol greater than 10
subset_alcohol <- subset(data, alcohol > 10)
print(subset_alcohol)

# 2. Quality >= 7 AND alcohol > 10
subset_quality <- subset(data, quality >= 7 & alcohol > 10)
print(subset_quality)

# 3. Red wine only
subset_red <- subset(data, type == "red")
print(subset_red)

# -------------------------------
# USING filter()  (dplyr)
# -------------------------------



# Load dplyr
library(dplyr)

# 4. Alcohol greater than 10
filter_alcohol <- filter(data, alcohol > 10)
print(filter_alcohol)

# 5. Quality >= 7 AND alcohol > 10
filter_quality <- filter(data, quality >= 7, alcohol > 10)
print(filter_quality)

# 6. White wine only
filter_white <- filter(data, type == "white")
print(filter_white)

# -------------------------------
# Handling NA values
# -------------------------------

# Remove rows with NA in alcohol
no_na_data <- filter(data, !is.na(alcohol))
print(no_na_data)

# -------------------------------
# End of Program
# -------------------------------
