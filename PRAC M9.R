# Clear environment
rm(list = ls())

# Load dataset
data <- read.csv("C:/Users/vibro/Downloads/employee_salary_dataset.csv",
                 stringsAsFactors = FALSE)

# Check structure and column names
str(data)
colnames(data)

# -------------------------------
# AUTO-DETECT SALARY COLUMN
# -------------------------------
salary_col <- names(data)[sapply(data, function(x)
  is.numeric(x) || all(grepl("^[0-9,]+$", x))
)][1]

# Convert Salary column safely to numeric
data[[salary_col]] <- as.numeric(gsub(",", "", data[[salary_col]]))

# Remove rows with NA salary
data <- data[!is.na(data[[salary_col]]), ]

# -------------------------------
# CREATE SALARY CATEGORY
# -------------------------------
data$Salary_Level <- cut(
  data[[salary_col]],
  breaks = c(0, 30000, 50000, Inf),
  labels = c("Low", "Medium", "High"),
  include.lowest = TRUE
)

# -------------------------------
# AUTO-DETECT DEPARTMENT COLUMN
# -------------------------------
dept_col <- names(data)[sapply(data, is.character)][1]

# -------------------------------
# CONTINGENCY TABLE
# -------------------------------
chi_table <- table(data[[dept_col]], data$Salary_Level)

print(chi_table)

# -------------------------------
# CHI-SQUARE TEST
# -------------------------------
chi_result <- chisq.test(chi_table)

print(chi_result)

# Expected frequencies
chi_result$expected
