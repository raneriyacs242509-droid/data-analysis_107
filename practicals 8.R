

# Load libraries
library(dplyr)
library(tidyr)


# Option 2: Create a dataset with missing values
data <- data.frame(
  Student_ID = c(101, 102, 103, 104, 105),
  Name = c("Aarav", "Meera", NA, "Ananya", "Kabir"),
  Age = c(20, 21, 19, NA, 20),
  Course = c("BSc", "BCA", "BSc", "BCom", NA),
  Attendance = c(85, NA, 78, 88, 92),
  Final_Score = c(76, 82, NA, 88, 91)
)

# View dataset
print("Original Dataset:")
print(data)
View(data)

# -----------------------------------------
# Step 2: Handle missing values using na.omit()
# -----------------------------------------
# This will remove all rows that contain any NA
cleaned_naomit <- na.omit(data)
print("After na.omit():")
print(cleaned_naomit)

# -----------------------------------------
# Step 3: Handle missing values using replace_na()
# -----------------------------------------
# Replace NA with specific values
# Replace numeric NAs with 0, character NAs with "Unknown"
cleaned_replace <- data %>%
  replace_na(list(
    Name = "Unknown",
    Age = 0,
    Course = "Unknown",
    Attendance = 0,
    Final_Score = 0
  ))

print("After replace_na():")
print(cleaned_replace)

# -----------------------------------------
# Step 4: Verify that missing values are handled
# -----------------------------------------
print("Check for remaining NAs:")
print(colSums(is.na(cleaned_replace)))
