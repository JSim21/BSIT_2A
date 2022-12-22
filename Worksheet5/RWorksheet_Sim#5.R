#1a
yr2019_2020 <- c(80, 75, 70, 60)
year <- barplot(yr2019_2020)
#1b
course <- c("1st", "2nd", "3rd", "4th")

year <- barplot(yr2019_2020, main = "Enrollment of BS Computer Science",
                 xlab = "Curriculum Year", names.arg = course)    

#2a
expense <- c(60, 10, 5, 25)
barplot(expense,names.arg = c("Food", "Electricity", "Savings", "Miscellaneous"))
#2b
pie(expense)
year1 <- pie(expense, col = rainbow(length(expense)), labels = c(60, 10, 5, 25))
pie(expense, main = "Expenses", col = rainbow(length(expense)), labels = year1, cex = 1)    
legend(1, c("Food", "Electricity", "Savings", "Miscellaneous"),
       cex = 1, fill = rainbow((length(expense))))

#3
data("mtcars")
num1 <- mtcars$mpg    
num1
#3a
num2 <- hist(num1, xlab = "Miles per Gallon", main = "Histogram of MPG")
#3b
num3 <- hist(num1, breaks = 12, col = "red", xlab = "Miles per Gallon", main = "Histogram of MPG")
#3c
num4 <- hist(num1, breaks = 12, col = "red", xlab = "Miles per Gallon",
             main = "Histogram with a Curve")
xfit <- seq(min(num1), max(num1), length = 40)
yfit <- dnorm(xfit, mean = mean(num1), sd = sd(num1))
yfit <- yfit*diff(num4$mids[1:2])*length(num1)
lines(xfit, yfit, col = "blue", lwd = 2)

#4a
data("iris")
set <- subset(iris, Species == "setosa")    
set <- subset(iris, Species == "versicolor")
set <- subset(iris, Species == "virginica")    
#4b
set <- subset(iris, Species == "setosa")
setosa <- colMeans(set[sapply(set,is.numeric)])
setosa
ver <- subset(iris, Species == "versicolor")
versicolor <- colMeans(ver[sapply(set,is.numeric)])
versicolor
vir <- subset(iris, Species == "virginica")
virginica <- colMeans(vir[sapply(set,is.numeric)])
virginica
#4c
bind <- rbind(setosa, versicolor, virginica)
bind    
#4d
barplot(bind, beside = TRUE,
        main = "Iris Data",
        xlab = "Characteristics",
        ylab = "Mean Scores",
        col = c("red", "green", "blue"))