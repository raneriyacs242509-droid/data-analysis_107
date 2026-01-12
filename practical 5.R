

# Clear environment
rm(list = ls())

# Load required library
library(dplyr)

# Load dataset
data <- read.csv("C:/Users/vibro/Downloads/wine_quality_merged.csv")

# View dataset
View(data)

sorted_alcohol_asc <- arrange(data, alcohol)
print(sorted_alcohol_asc)


sorted_alcohol_desc <- arrange(data, desc(alcohol))
print(sorted_alcohol_desc)


sorted_quality_asc <- arrange(data, quality)
print(sorted_quality_asc)


sorted_quality_desc <- arrange(data, desc(quality))
print(sorted_quality_desc)


sorted_multi <- arrange(data, desc(quality), alcohol)
print(sorted_multi)


sorted_red <- data %>%
  filter(type == "red") %>%
  arrange(desc(alcohol))
print(sorted_red)



