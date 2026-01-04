# Install package (run once)
install.packages("dplyr")

# Load library
library(dplyr)


student_data <- data.frame(
  Student_ID = c(101, 102, 103, 104, 105),
  Name = c("Aarav", "Meera", "Rohan", "Ananya", "Kabir"),
  Age = c(20, 21, 19, 22, 20),
  Course = c("BSc", "BCA", "BSc", "BCom", "BCA"),
  City = c("Mumbai", "Pune", "Delhi", "Bangalore", "Chennai"),
  Attendance = c(85, 90, 78, 88, 92),
  Final_Score = c(76, 82, 69, 88, 91)
)

# View dataset
View(student_data)
print(student_data)

# -----------------------------------------
# 1. Select specific columns
# -----------------------------------------
select_basic <- select(student_data, Name, Course, Final_Score)
print(select_basic)

# -----------------------------------------
# 2. Drop columns
# -----------------------------------------
drop_columns <- select(student_data, -City, -Attendance)
print(drop_columns)

# -----------------------------------------
# 3. Select columns by position
# -----------------------------------------
select_position <- select(student_data, 1:4)
print(select_position)

# -----------------------------------------
# 4. Select columns starting with a word
# -----------------------------------------
select_start <- select(student_data, starts_with("Final"))
print(select_start)

# -----------------------------------------
# 5. Select columns containing a word
# -----------------------------------------
select_contains <- select(student_data, contains("Score"))
print(select_contains)

# -----------------------------------------
# 6. Select all except one column
# -----------------------------------------
select_except <- select(student_data, everything(), -Student_ID)
print(select_except)
