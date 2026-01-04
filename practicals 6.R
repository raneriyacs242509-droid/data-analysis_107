

# Clear workspace
rm(list = ls())

# ----------------
# PART 1: MERGE() – Combine datasets by a key
# ----------------

# Create first dataset
data1 <- data.frame(
  ID = c(1, 2, 3, 4),
  Name = c("Aarya", "Riya", "Siya", "Neha"),
  stringsAsFactors = FALSE
)

# Create second dataset
data2 <- data.frame(
  ID = c(3, 4, 5, 6),
  Marks = c(85, 90, 88, 92)
)

# View datasets
print("Dataset 1:")
print(data1)

print("Dataset 2:")
print(data2)

# Inner Join
inner_join <- merge(data1, data2, by = "ID")
print("Inner Join:")
print(inner_join)

# Left Join
left_join <- merge(data1, data2, by = "ID", all.x = TRUE)
print("Left Join:")
print(left_join)

# Right Join
right_join <- merge(data1, data2, by = "ID", all.y = TRUE)
print("Right Join:")
print(right_join)

# Full Outer Join
full_join <- merge(data1, data2, by = "ID", all = TRUE)
print("Full Outer Join:")
print(full_join)

# ----------------
# PART 2: BIND_ROWS() – Append datasets row-wise
# ----------------

# Load dplyr
library(dplyr)

# Create first dataset
df1 <- data.frame(
  ID = c(1, 2, 3),
  Marks = c(70, 75, 80)
)

# Create second dataset
df2 <- data.frame(
  ID = c(4, 5),
  Marks = c(85, 90)
)

# Append rows
appended_data <- bind_rows(df1, df2)
print("Appended Data (Same Columns):")
print(appended_data)

# ----------------
# PART 3: bind_rows() with different columns
# ----------------

df3 <- data.frame(
  ID = c(6, 7),
  Marks = c(88, 92),
  Grade = c("A", "A+")
)

# Append with different columns
appended_data2 <- bind_rows(df1, df3)
print("Appended Data (Different Columns):")
print(appended_data2)


