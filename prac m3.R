data <- read.csv("C:/Users/vibro/Downloads/data_date.csv",
                 stringsAsFactors = FALSE)

names(data)

cross_tab <- table(data$Column1, data$Column2)
cross_tab

row_percent <- prop.table(cross_tab, 1) * 100
row_percent

col_percent <- prop.table(cross_tab, 2) * 100
col_percent

overall_percent <- prop.table(cross_tab) * 100
overall_percent

cross_tab_na <- table(data$Column1, data$Column2, useNA = "ifany")
cross_tab_na