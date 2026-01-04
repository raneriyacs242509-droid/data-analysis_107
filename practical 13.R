library(dplyr)

orders_df <- data.frame(
  OrderID = c(101, 102, 102, 103, 104, 101, 104),
  Customer = c("NISHITA", "YUKTA", "SIYA", "NANDINI", "SIMRAN", "PURVI", "GAZALA"),
  Product = c("Laptop", "Phone", "Phone", "Tablet", "Monitor", "Laptop", "Mouse")
)

print(orders_df)

duplicates_report <- orders_df %>%
  group_by(OrderID, Customer, Product) %>%
  count() %>%
  filter(n > 1)

print(duplicates_report)

clean_exact <- orders_df %>%
  distinct()

print(clean_exact)

unique_customers <- orders_df %>%
  distinct(Customer, .keep_all = TRUE)

print(unique_customers)
