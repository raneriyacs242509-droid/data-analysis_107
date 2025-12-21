install.packages("psych")
install.packages("dplyr")

library(psych)
library(dplyr)

air <- read.csv("C:/Users/vibro/Downloads/globalAirQuality.csv")

str(air)
summary(air)

air_numeric <- air %>% select(where(is.numeric))
summary(air_numeric)

describe(air_numeric)