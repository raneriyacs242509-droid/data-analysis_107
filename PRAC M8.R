# ==============================
# Step 1: Clear workspace
# ==============================
rm(list = ls())

# ==============================
# Step 2: Load dataset
# ==============================
data <- read.csv("C:/Users/vibro/Downloads/globalAirQuality.csv")

# ==============================
# Step 3: View data
# Clear workspace
rm(list = ls())

# Load dataset (fixed path)
data <- read.csv("C:/Users/vibro/Downloads/globalAirQuality.csv")

# View structure
str(data)

# Convert categorical variables to factors
data$country <- as.factor(data$country)
data$city <- as.factor(data$city)

# Two-way ANOVA with interaction
anova_model <- aov(aqi ~ country * city, data = data)

# Summary
summary(anova_model)

# Post-hoc test
TukeyHSD(anova_model)

# Interaction plot
interaction.plot(
  x.factor = data$country,
  trace.factor = data$city,
  response = data$aqi,
  xlab = "Country",
  ylab = "AQI",
  trace.label = "City"
)
