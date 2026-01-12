# Load required package
install.packages("stringr")   # run once
library(stringr)

# Create simple dataframe
data <- data.frame(
  Name = c("Aarav Sharma", "Meera Singh", "Rohan Mehta"),
  Email = c("aarav@gmail.com", "meera@yahoo.com", "rohan@outlook.com"),
  stringsAsFactors = FALSE
)

# View dataset
print(data)


data$Name_First5 <- str_sub(data$Name, 1, 5)
print(data)

name_split <- str_split(data$Name, " ")
data$First_Name <- sapply(name_split, `[`, 1)
data$Last_Name <- sapply(name_split, `[`, 2)
print(data)

email_split <- str_split(data$Email, "@")
data$Email_User <- sapply(email_split, `[`, 1)
data$Email_Domain <- sapply(email_split, `[`, 2)
print(data)

