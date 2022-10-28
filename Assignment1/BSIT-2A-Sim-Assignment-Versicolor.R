#1. use data(iris)
data("iris")
iris

#2. Subset the iris into 3 files-per species 

#3rd file versicolor subset 

 subset(iris, Species == "versicolor")

#Get total mean for each Species "3rd file versicolor subset"
 
#Declaring each column of iris to calculate the total mean
a <- iris$Sepal.Length[51:100]
b <- iris$Sepal.Width[51:100]
c <- iris$Petal.Length[51:100]
d <- iris$Petal.Width[51:100]

a
b
c
d

#Calculating total mean
x <- c(a,b,c,d)
x

mean(x) #The total mean for versicolor is 3.573


#Get the mean for each species
mean(a)#Answer is 5.936
mean(b)#Answer is 2.77
mean(c)#Answer is 4.26
mean(d)#Answer is 1.326