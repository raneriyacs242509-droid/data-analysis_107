
wine <- read.csv("C:/Users/vibro/Downloads/wine_quality_merged.csv")

head(wine)


model <- lm(quality ~ alcohol, data = wine)


summary(model)


plot(wine$alcohol, wine$quality,
     main = "Linear Regression: Alcohol vs Wine Quality",
     xlab = "Alcohol",
     ylab = "Quality",
     pch = 16)

# Step 6: Add regression line
abline(model)



