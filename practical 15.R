retail_df <- data.frame(
  ID = 1:6,
  Category = c("Electronics", "Home", "Electronics", "Clothing", "Home", "Clothing"),
  Price = c(500.50, 45.00, 900.00, NA, 300.00, 25.00),
  In_Stock = c(TRUE, TRUE, FALSE, TRUE, FALSE, TRUE),
  Rating = c(4.5, 3.8, 4.9, 4.0, 3.5, 4.2)
)

print(retail_df)

str(retail_df)
summary(retail_df)

retail_df$Category <- as.factor(retail_df$Category)
summary(retail_df)

avg_rating <- mean(retail_df$Rating)
max_price <- max(retail_df$Price, na.rm = TRUE)

print(avg_rating)
print(max_price)