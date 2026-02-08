
air <- read.csv("C:/Users/vibro/Downloads/globalAirQuality.csv", stringsAsFactors = FALSE)


str(air)


pm_col <- as.numeric(air[["PM2.5"]])


air$HighPollution <- factor(ifelse(pm_col > 35, 1, 0))

model <- glm(HighPollution ~ pm_col,
             data = air,
             family = binomial)


summary(model)


plot(pm_col, air$HighPollution,
     xlab = "PM2.5",
     ylab = "High Pollution (0/1)",
     main = "Logistic Regression using glm()",
     pch = 16)

curve(predict(model,
              data.frame(pm_col = x),
              type = "response"),
      add = TRUE)
