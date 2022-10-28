#1. use data(iris)
data("iris")
iris

#2. Subset the iris into 3 files-per species 

#1st file virginica subset 

 subset(iris, Species == "virginica")

#Get total mean for each Species "1st file virginica subset"
 
#Declaring each column of iris to calculate the total mean
a <- iris$Sepal.Length[101:150]
b <- iris$Sepal.Width[101:150]
c <- iris$Petal.Length[101:150]
d <- iris$Petal.Width[101:150]

a
b
c
d

#Calculating total mean
x <- c(a,b,c,d)
x

mean(x) #The Total mean for virginica is 4.285


#Get the mean for each species
mean(a)#Answer is 6.588
mean(b)#Answer is 2.974
mean(c)#Answer is 5.552
mean(d)#Answer is 2.026