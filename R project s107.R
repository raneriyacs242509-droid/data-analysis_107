# ====================================================
# Intrusion Detection System using Random Forest in R
# ====================================================

# ----------------------------
# 1. Install Packages (Run Once)
# ----------------------------
install.packages("randomForest")
install.packages("caret")
install.packages("ggplot2")
install.packages("reshape2")

# ----------------------------
# 2. Load Libraries
# ----------------------------
library(randomForest)
library(caret)
library(ggplot2)
library(reshape2)

# ----------------------------
# 3. Load Dataset
# ----------------------------
data <- read.csv("C:/Users/vibro/Downloads/IDS_Dataset (1).csv")

# Convert categorical variables to factor
data$protocol_type <- as.factor(data$protocol_type)
data$attack_type <- as.factor(data$attack_type)

# ----------------------------
# 4. Show Class Distribution
# ----------------------------
ggplot(data, aes(x = attack_type)) +
  geom_bar(fill = "steelblue") +
  ggtitle("Attack Type Distribution") +
  xlab("Attack Type") +
  ylab("Count") +
  theme_minimal()

# ----------------------------
# 5. Train-Test Split (70-30)
# ----------------------------
set.seed(42)

trainIndex <- createDataPartition(data$attack_type,
                                  p = 0.7,
                                  list = FALSE)

trainData <- data[trainIndex, ]
testData  <- data[-trainIndex, ]

# ----------------------------
# 6. Train Random Forest Model
# ----------------------------
rf_model <- randomForest(attack_type ~ .,
                         data = trainData,
                         ntree = 100,
                         importance = TRUE)

print(rf_model)

# ----------------------------
# 7. Make Predictions
# ----------------------------
predictions <- predict(rf_model, testData)

# ----------------------------
# 8. Confusion Matrix
# ----------------------------
cm <- confusionMatrix(predictions, testData$attack_type)
print(cm)

# ----------------------------
# 9. Print Accuracy
# ----------------------------
accuracy <- cm$overall['Accuracy']
cat("\nModel Accuracy:", round(accuracy * 100, 2), "%\n")

# ----------------------------
# 10. Confusion Matrix Heatmap
# ----------------------------
cm_table <- table(Predicted = predictions,
                  Actual = testData$attack_type)

cm_df <- as.data.frame(cm_table)

ggplot(cm_df, aes(x = Actual, y = Predicted, fill = Freq)) +
  geom_tile(color = "black") +
  geom_text(aes(label = Freq), size = 6) +
  scale_fill_gradient(low = "lightblue", high = "red") +
  ggtitle("Confusion Matrix Heatmap") +
  theme_minimal()

# ----------------------------
# 11. Feature Importance Plot
# ----------------------------
importance_data <- importance(rf_model)

importance_df <- data.frame(
  Feature = rownames(importance_data),
  Importance = importance_data[,1]
)

ggplot(importance_df, aes(x = reorder(Feature, Importance),
                          y = Importance)) +
  geom_bar(stat="identity", fill="steelblue") +
  coord_flip() +
  ggtitle("Feature Importance (Simple Bar Graph)") +
  theme_minimal()