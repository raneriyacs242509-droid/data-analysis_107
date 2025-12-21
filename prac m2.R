install.packages("dplyr")
library(dplyr)

car <- read.csv("C:/Users/vibro/Downloads/car_price_prediction_.csv")

names(car) <- make.names(names(car))
names(car)

table(car$Fuel_Type)
table(car$Transmission)
table(car$Owner)

count(car, Fuel_Type)
count(car, Transmission)
count(car, Owner)

count(car, Fuel_Type, sort = TRUE)
count(car, Transmission, sort = TRUE)
count(car, Owner, sort = TRUE)