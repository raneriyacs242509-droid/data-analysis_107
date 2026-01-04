

# Clear environment
rm(list = ls())

# Load required library
library(dplyr)

# Load dataset
data <- read.csv("C:/Users/vibro/Downloads/wine_quality_merged.csv")

# View dataset
View(data)

# -------------------------------
# 1. Sort by alcohol (Ascending)
# -------------------------------
sorted_alcohol_asc <- arrange(data, alcohol)
print(sorted_alcohol_asc)

# -------------------------------
# 2. Sort by alcohol (Descending)
# -------------------------------
sorted_alcohol_desc <- arrange(data, desc(alcohol))
print(sorted_alcohol_desc)

# -------------------------------
# 3. Sort by quality (Ascending)
# -------------------------------
sorted_quality_asc <- arrange(data, quality)
print(sorted_quality_asc)

# -------------------------------
# 4. Sort by quality (Descending)
# -------------------------------
sorted_quality_desc <- arrange(data, desc(quality))
print(sorted_quality_desc)

# -------------------------------
# 5. Sort by multiple columns
#    Quality (Desc) then Alcohol (Asc)
# -------------------------------
sorted_multi <- arrange(data, desc(quality), alcohol)
print(sorted_multi)

# -------------------------------
# 6. Sort within red wines only
# -------------------------------
sorted_red <- data %>%
  filter(type == "red") %>%
  arrange(desc(alcohol))
print(sorted_red)


