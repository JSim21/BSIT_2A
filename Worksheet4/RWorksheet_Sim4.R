library(dplyr)
library(readr)

#1a
shoesize <- c(6.5,9.0,8.5,8.5,10.5,7.0,9.5,9.0,13.0,
              7.5,10.5,8.5,12.0,10.5,
              13.0,11.5,8.5,5.0,10.0,
              6.5,7.5,8.5,10.5,8.5,10.5,11.0,9.0,13.0)

height <- c(66.0,68.0,64.5,65.0,70.0,
            64.0,70.0,71.0,72.0,64.0,
            74.5,67.0,71.0,71.0,77.0,72.0,
            59.0,62.0,72.0,66.0,64.0,67.0,73.0,
            69.0,72.0,70.0,69.0,70)    

gender <- c("F","F","F","F","M","F","M","F","M",
            "M","M","F","M","M","M","M","F","F",
            "M","F","M","M","M","F","M","M","M","M")    

data_display <- data.frame(shoesize, height, gender)     
data_display     

#1b
mean(shoesize)
#Answer: 9.410714
mean(height)
#Answer: 68.57143

#1c
#Answer: Yes. As shown in the data table, the taller a person is, the bigger their foot sizes.

#2
months <- c("March","April","January","November","January",
            "September","October","September","November","August",
            "January","November","November","February","May","August",
            "July","December","August","August","September","November","February","April")
factor_months <- factor(months)
factor_months

#3
summary(months)
summary(factor_months)

#4
factor_data <- data.frame(Direction = c("East", "West", "North"), Frequency = c(1, 4, 3))
factor_data

new_orderdata <- factor(factor_data, levels = c("East", "West", "North"))
print(new_orderdata)

#5a
setwd("C:/Users/Jeremiah/OneDrive/Desktop/School/CS101/Worksheet4")
getwd()
import <- read.table("import_march.csv", header = TRUE, sep=",")
import

#b
View(import)