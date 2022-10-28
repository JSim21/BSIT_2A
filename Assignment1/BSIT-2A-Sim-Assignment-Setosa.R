#1. use data(iris)
data("iris")
iris

#2. Subset the iris into 3 files-per species 

#2nd file setosa subset  

subset(iris, Species == "setosa")

#Get total mean for each Species "2nd file setosa subset"

#Declaring each column of iris to calculate the total mean
a <- iris$Sepal.Length[1:50]
b <- iris$Sepal.Width[1:50]
c <- iris$Petal.Length[1:50]
d <- iris$Petal.Width[1:50]

a
b
c
d

#Calculating total mean
x <- c(a,b,c,d)
x

mean(x) #The total mean for setosa is 2.5355 


#Get the mean for each species
mean(a)#Answer is 5.006
mean(b)#Answer is 3.428
mean(c)#Answer is 1.462
mean(d)#Answer is 0.246