library(dplyr)
library(tidyr)

df <- read.csv("C:/Users/info/Downloads/Retail Product_ - Retail Product.csv",
               na.strings = c("", "NA")) %>%
  mutate(ProductID = row_number()) %>%
  select(ProductID, Category, Price, Discount)

print(head(df))

long_df <- df %>%
  pivot_longer(
    cols = c(Price, Discount),
    names_to = "Metric",
    values_to = "Value"
  )

print(head(long_df))

wide_df <- long_df %>%
  pivot_wider(
    names_from = Metric,
    values_from = Value
  )

print(head(wide_df))

df_clean <- df %>%
  mutate(Category = ifelse(is.na(Category), "Unknown", Category))

category_pivot <- df_clean %>%
  select(ProductID, Category, Price) %>%
  pivot_wider(
    names_from = Category,
    values_from = Price
  )

print(head(category_pivot))