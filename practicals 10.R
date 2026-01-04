# Load dplyr for data manipulation
install.packages("dplyr")   # run once
library(dplyr)

# -----------------------------------------
# Step 1: Create a simple dataset
# -----------------------------------------
data <- data.frame(
  Student_ID = c(101, 102, 103, 104),
  Name = c("Aarav", "Meera", "Rohan", "Ananya"),
  Math_Score = c(78, 85, 90, 88),
  Science_Score = c(72, 80, 95, 85),
  Attendance = c(85, 90, 78, 88)
)

print("Original Dataset:")
print(data)

# -----------------------------------------
# Step 2: Create new variable using calculation
# Example: Total Score = Math + Science
# -----------------------------------------
data <- data %>%
  mutate(Total_Score = Math_Score + Science_Score)
print("After adding Total_Score:")
print(data)

# -----------------------------------------
# Step 3: Create new variable using average
# Example: Average Score
# -----------------------------------------
data <- data %>%
  mutate(Average_Score = Total_Score / 2)
print("After adding Average_Score:")
print(data)

# -----------------------------------------
# Step 4: Create new variable using conditional transformation
-----
data <- data %>%
  mutate(Result = ifelse(Average_Score >= 80, "Pass", "Fail"))
print("After adding Result column:")
print(data)

# -----------------------------------------
# Step 5: Create a new variable using combination of columns

# -----------------------------------------
data <- data %>%
  mutate(ID_Name = paste0(Student_ID, "_", Name))
print("After adding ID_Name column:")
print(data)
