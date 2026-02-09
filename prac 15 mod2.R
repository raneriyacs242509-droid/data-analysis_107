# ===== Libraries =====
library(readr)
library(writexl)

# ===== Load Dataset =====
sales_df <- read_csv("C:/Users/Omith/Downloads/sales_data_sample ............csv")

# ===== Create Summary Table =====
# Count of orders by PRODUCTLINE and DEALSIZE
counts <- table(sales_df$PRODUCTLINE, sales_df$DEALSIZE)

# ===== Bar Plot (On Screen) =====
barplot(counts,
        main = "Distribution of Product Line by Deal Size",
        xlab = "Deal Size",
        ylab = "Number of Orders",
        col = c("skyblue", "orange", "lightgreen"),
        legend = rownames(counts),
        beside = TRUE,
        las = 2)

# ===== Save Plot to PDF =====
pdf("sales_graphical_report.pdf", width = 9, height = 6)

barplot(counts,
        main = "Distribution of Product Line by Deal Size",
        xlab = "Deal Size",
        ylab = "Number of Orders",
        col = c("skyblue", "orange", "lightgreen"),
        legend = rownames(counts),
        beside = TRUE,
        las = 2)

dev.off()

# ===== Convert Table to Data Frame =====
results_df <- as.data.frame.matrix(counts)
results_df <- cbind(Product_Line = rownames(results_df), results_df)

# ===== Save Data =====
write.csv(results_df, "ProductLine_by_DealSize.csv", row.names = FALSE)
write_xlsx(results_df, "ProductLine_by_DealSize.xlsx")

# ===== Success Message =====
print("✅ Success! 
Graph displayed & saved as 'sales_graphical_report.pdf'.
Data saved to CSV and Excel.")
