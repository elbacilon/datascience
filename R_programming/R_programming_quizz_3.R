# Q1
library(datasets)
data(iris)
str(iris)
?iris
# What is the mean of 'Sepal.Length' for the species virginica?
sum(is.na(iris))
tapply(iris$Sepal.Length, iris$Species, mean) # 6.588 for virginica

# Q2
#  what R code returns a vector of the means of the variables 'Sepal.Length', 'Sepal.Width', 'Petal.Length', and 'Petal.Width'?
sapply(iris[,c('Sepal.Length', 'Sepal.Width', 'Petal.Length', 'Petal.Width')], mean)
apply(iris[, 1:4], 2, mean)

# Q3
library(datasets)
data(mtcars)
?mtcars
str(mtcars)
unique(mtcars$cyl) # 3 types of cyl 6, 4 or 8
# How can one calculate the average miles per gallon (mpg) by number of cylinders in the car (cyl)?
tapply(mtcars$mpg, mtcars$cyl, mean)
# OR with(mtcars, tapply(mpg, cyl, mean))

# Q4
# what is the absolute difference between the average horsepower of 4-cylinder cars and the average horsepower of 8-cylinder cars?
abs(mean(mtcars[which(mtcars$cyl == 4), "hp"])-mean(mtcars[which(mtcars$cyl == 8), "hp"])) # 126.5779

# Q5
debug(ls)
ls(2)
# stop ls and in Browser 
