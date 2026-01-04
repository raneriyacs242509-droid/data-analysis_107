
  
data(iris)

iris_file <- read.csv("C:/Users/info/Downloads/Iris_ - Iris.csv")
flower_df <- read.csv("C:/Users/info/Downloads/flower_dataset__ - flower_dataset.csv")

iris_clean <- iris[, c("Species", "Sepal.Length")]
names(iris_clean) <- c("Species", "Height")

flower_clean <- flower_df[, c("species", "height_cm")]
names(flower_clean) <- c("Species", "Height")

iris_clean$Height <- as.numeric(iris_clean$Height)
flower_clean$Height <- as.numeric(flower_clean$Height)

combined_data <- rbind(iris_clean, flower_clean)

print(head(combined_data))
print(tail(combined_data))