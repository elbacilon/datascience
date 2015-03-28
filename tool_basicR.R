SWIRPL training----play()-nxt()---------------------------------------------------
        install.packages("swirl")
        library("swirl")
        swirl()
----------------------Workspace and Files--------------------------------------
#Determine which directory your R session is using
        getwd()
# Set your working directory 
        setwd("C:/Users/Cedric/Documents/GitHub/datascience")
#List all the objects in your local workspace using 
        ls()
# List all the files in your working directory
        dir()
        list.files()
#  Check out the help page for a function
        ?list.files
#see what arguments a function can take.
        args(dir)
# create a directory in the current working directory
        dir.create()
# Create a file in your working directory 
        file.create("mytest.R")
# Check to see if a file exists in the working directory
        file.exists("mytest.R")
# Access information about the file "mytest.R" by using file.info().
        file.info("mytest.R")
# Change the name of a file
        file.rename("mytest.R", "mytest2.R")
# Make a copy of a file
        file.copy("mytest2.R", "mytest3.R")
# delete a file
        file.remove('mytest.R')
# Provide the relative path a file
        file.path('mytest.R')
# make a platform-independent pathname
        file.path("folder1", "folder2")
# Create a directory in the current working directory and a subdirectory in one command 
        dir.create(file.path('testdir2', 'testdir3'), recursive = TRUE)
# Delete directory
        unlink('testdir2', recursive = TRUE)

----------------------Sequences of Numbers--------------------------------------
#  create a sequence with operator ':'
        1:10
        15:1
        pi:10
#  create a sequence with seq() function
        seq(1, 20)
        seq(0, 10, by=0.5)
        seq(5, 10, length=30)
#  create a sequence with rep() function
        rep(0, times = 40) # repeat 10 times the 0
        rep(c(0, 1, 2), times = 10) # repeat 10 times the vector
        rep(c(0, 1, 2), each = 10) # repet 10 times each element of the vector
# help on operator
        ?':'
# get length of an objects
        my_seq <- seq(5, 10, length=30)
        length(my_seq)

----------------------Vectors---------------------------------------------------
# logical opeators `<` and `>=` ,`>`, `<=`, `==` for exact equality, and `!=` for inequality
# logical 'or' a.k.a. 'union'  => | 
# logical 'and' a.k.a. 'intersection' => &
# Double quotes are used to distinguish character objects => "My"
# join elements together into one continuous character string
        paste(c("My", "name", "is"), collapse = " ")   
# To add (or 'concatenate') charatcer to the end use c() function
        c(c("My", "name", "is"), "cedric")                             
# join the elements of multiple character vectors with paste ()
# the `sep` argument tells R that we want to separate the joined elements with a single space
        paste("Hello", "world!", sep = " ")

----------------------Missing Values---------------------------------------------------
# sampling a vector with NA
        y <- rnorm(1000) # vector containing 1000 draws from a standard normal distribution
        z <- rep(NA, 1000) # vector containing 1000 NAs
        my_data <- sample(c(y, z), 100) # random 100 values from y and z so unknown NA and position
# what are NAs ocated in data
        is.na(my_data) # my_data == NA does not return same because NA is not a value
#compute the total number of NAs in our data.
        sum(is.na(my_data))
#NaN, which stands for 'not a number'
        0/0 or Inf/Inf or Inf-Inf# generate NaN

----------------------Subsetting Vectors ---------------------------------------------------
# assuming x contains a random ordering of 20 numbers (from a standard normal distribution) and 20 NAs.
# view the first ten elements of x
        x[1:10] # first element of a vector is considered element 1- R uses 'one-based indexing'
# consider index vectors -- logical, positive integer, and negative integer
# extract all elements of a vector that are not NA
        y <- x[x[is.na(x)])] # x[is.na(x)] can be read as 'is not NA'
# extract all the positive elements of y
        y[y > 0] # we do on y and not x because since NA is not a value but rather a placeholder for an unknown quantity, the expression NA > 0 evaluates to NA
# extract values of x that are both non-missing AND greater than zero
        x[!is.na(x) & x > 0]
# subset the 3rd, 5th, and 7th elements of x
        x[c(3,5,7)]
# Warning -  asking for is within the bounds of the vector you're working with
        x[3000] # return NA
        x[0] # return numeric (0)
# construct a vector containing all numbers 1 through 40 EXCEPT 2 and 10
        x[c(-2, -10)] #  R accepts negative integer indexes
        x[-c(2, 10)] # shorthand way of specifying multiple negative numbers
## concept of 'named' elements
        vect <- c(foo = 11, bar = 2, norf = NA) # numeric vector with names
# names of a vector
        names(vect)
# add names attribute to a vector
        vect2 <- c(11, 2, NA)
        names(vect2) <- c("foo", "bar", "norf")
# check 2 vectors are the same
        identical(vect, vect2)
# get element of a vector using name
        vect["bar"]
        vect[c("foo", "bar")] # using vector of names

----------------------Matrices and Data Frames --------------------------------------------
#  represent 'rectangular' data types, meaning that they are used to store tabular data, with rows and columns
# Difference = matrices can only contain a single class of data, while data frames can consist of many different classes of data
# dimension of an object
        my_vector <- 1:20
        dim(my_vector) # NULL as vector as no 'dim' attribute
# length of an object      
        length(my_vector)
# add 'dim' attribute
        dim(my_vector) <- c(4,5)
        attributes(my_vector) # return $dim = 4 rows 5 columns 
        class(my_vector) # it's a matrix
        my_matrix <- my_vector
# create a matrix
        my_matrix2 <- matrix(1:20, 4, 5)
# Check identitical objects
        identical(my_matrix, my_matrix2)
# add column
        patients <- c("Bill", "Gina", "Kelly", "Sean")
        cbind(patients, my_matrix) # 'implicit coercion'= R coerce the number to characters
# name column
        colnames(my_data) <- cnames
# create data frame to not destroy the integrity of numeric data
        my_data <- data.frame(patients, my_matrix) # data frame store our character vector of names right alongside our matrix of numbers
        class(my_data) # return data.frame
# assign name to column

---------------------- Logic-----------------------------------------------------
# equality operator '=='
# negating an entire expression by placing '!' in first
        !5 == 7 # return [1] TRUE
# AND operators in R, `&` and `&&`but && only evaluates the first member of a vector
# An expression using the AND operator will evaluate to TRUE if the left operand AND the right operand is TRUE. 
# If both are FALSE, the expression will evaluate to FALSE, however if one is FALSE, then the expression will be FALSE.
        TRUE & TRUE # return TRUE 
        TRUE & FALSE # return FALSE
        FALSE & FALSE # return FALSE
        TRUE & c(TRUE, FALSE, FALSE) # return [1]  TRUE FALSE FALSE
        TRUE && c(TRUE, FALSE, FALSE) # return [1] TRUE
# OR operators in R, `|` and `||`but && only evaluates the first member of a vector
# An expression using the OR operator will evaluate to TRUE if the left operand or the right operand is TRUE. 
# If both are TRUE, the expression will evaluate to TRUE, however if neither are TRUE, then the expression will be FALSE.
        TRUE | TRUE # return TRUE 
        TRUE | FALSE # return TRUE
        FALSE | FALSE # return FALSE
        TRUE | c(TRUE, FALSE, FALSE) # return [1] TRUE TRUE TRUE
        TRUE || c(TRUE, FALSE, FALSE) # return [1] TRUE
# All AND operators are evaluated before OR operators.
        5 > 8 || 6 != 8 && 4 > 3.9 # FALSE || TRUE && TRUE => FALSE
# evaluate to TRUE
        isTRUE(6>4)
        !isTRUE(4 < 3) # return TRUE
        identical(5 > 4, 3 < 3.1)
# evalute object is TREU and the other is FALS with xor()
        xor(5 == 6, !FALSE) # xor(FALSE, TRUE) return TRUE
        xor(5 == 5, !FALSE) # xor(TRUE, TRUE) return FALSE
        xor(4 >= 9, 8 != 8.0) # xor(FALSE, FALSE) return FALSE
# create vector with random sampling of integers from 1 to 10 without replacement
        ints <- sample(10)
        ints > 5 # get logical vector corresponding to whether each element of ints is greater than 5
# get indices of a vector on condition
        which (ints>7) #  find the indices of ints that are greater than 7
        which(ints <= 2) #  indices of the elements in ints that are less than or equal to 2
# test if any element in a logical vector is TRUE
        any(ints<0) # see if any of the elements of ints are less than zero  => FALSE
# test if every elements in the logical vector is TRUE
        all(ints>0) # see if any of the elements of ints are less than zero => TRUE

---------------------- Functions-----------------------------------------------------
# today's date
        Sys.Date()
# average of all of the numbers in the input vector
        mean(c(2,4,5))
# script function takes the argument `x` as input, and returns the value of x without modifying it.
        boring_function <- function(x) {
                          x
        } #save function script
submit() # in comsole to source the script
# try it
        boring_function('My first function!') # [1] "My first function!"
## 1. Everything that exists is an object. 
## 2. Everything that happens is a function call.

#  see the source code for any function =>  type the function name without any arguments or parentheses
        boring_function 

## create mean function
# Hint #1: sum() returns the sum of a vector.
#         Ex: sum(c(1, 2, 3)) evaluates to 6
## Hint #2: length() returns the size of a vector.
# 	Ex: length(c(1, 2, 3)) evaluates to 3
## Hint #3: The mean of all the numbers in a vector is equal to the sum of all of
#		   the numbers in the vector divided by the size of the vector.
my_mean <- function(my_vector) {
        sum(my_vector)/length(my_vector)
}

## function with default argument
        increment <- function(number, by = 1){
             number + by
        }
        increment(5) # return 6
        increment(5, 2)# return 7

##
        reminder <- function(num, divisor = 2){
             num %% divisor
        }
        remainder(5) # return 1
        remainder (11,5) # return 1
        remainder(divisor = 11, num = 5) # return 5 
        remainder(4, div = 2) # return 0 => R partial matching arguments name
# see function arguments
        args(remainder) # retunr function (num, divisor = 2) 

## create function with funtion as argument
# example 1 
add_two_numbers <- function(num1, num2){
        num1 + num2
}
multiply_two_numbers <- function(num1, num2){
        num1 * num2
}
some_function <- function(func){
        func(2, 4)
}
some_function(add_two_numbers) # evaluate to 6
some_function(multiply_two_numbers)  # evaluate to 8.

# example 2
# function is passed a function and some data (like a vector) so the function will return the result of dat being passed as an argument to func.
evaluate <- function(func, dat){
        func(dat)
}
evaluate(sd,c(1.4, 3.6, 7.9, 8.8)) # return sstndard deviaton of the vector
evaluate(function(x){x+1}, 6) # return 7 - pass a function as an argument without first defining the passed function => anonymous functions
# return the first element of the vector c(8, 4, , 0)
evaluate(function(x){x[1]},c(8, 4, 0))
# return the last element of the vector c(8, 4, 0)
evaluate(function(x){x[length(x)]},c(8, 4, 0))

# ellipses - pass indefinite arguments
# first argument of paste() is `...` = ellipsis to pass an indefinite number of arguments into a function.
paste("Programming", "is", "fun!")
# all arguments after an ellipses must have default values
# example 1
simon_says <- function(...){
   paste("Simon says:", ...)
}
# example 2
telegram <- function(...){
        paste("START", ...,"STOP", sep = " ")
}

# example 3 - unpack arguments from ellipse
mad_libs <- function(...){
        # First we must capture the ellipsis inside of a list
        #  and then assign the list to a variable. Let's name this
        #  variable `args`.
        args <- list(...)
        #   We can extract named arguments from the args list by used the name of the argument and double brackets. 
        place <- args[["place"]]
        adjective <- args[["adjective"]]
        noun <- args[["noun"]]
        paste("News from", place, "today where", adjective, "students took to the streets in protest of the new", noun, "being installed on campus.")
}
mad_libs(place = "paris", adjective = "great", noun = "Sorbonne") 

## create binary operators
# binary operator that multiplied two numbers and then added one to the product. 
# example 1
"%mult_add_one%" <- function(left, right){ # Notice the quotation marks!
        left * right + 1
}
4 %mult_add_one% 5 # retuen 21

#example 2
%p% <- function(left, right){
        paste(left, right, sep = " ")
}
"I" %p% "love" %p% "R!" # retunr "I love R!"

---------------------- lapply and sapply-----------------------------------------------------
# *apply = loop functions
# SPLIT up some data into smaller pieces, APPLY a function to each piece, then COMBINE the results.
# lapply and sapply take list as input
# lapply return a list whereas sapply() attempt to simplify the result
# preview first 6 lines of a dataset
        head(flags)
# check out the dimensions of the dataset
        dim(flags) # 194 obs. of 30 variables
# check format of the variables have been stored = what is the 'class' of each variable
        class(flags) # return dataframe so we don't know format of each variable => we need for each column
        as.list(flags) # data frame is really just a list of vectors so return each column  as vector with value ($name...)
        cls_list <- lapply(flags, class) # apply class() to each column of the dataset and get a list of length 30 (=variables)
        class(cls_list) # [1] "list"
        as.character(cls_list) # to simplify (be more compact) to a character vector
        cls_vect <- sapply(flags, class) # return a character vector same as lapply + as.character 
        class(cls_vect) #  [1] "character"
# if the result is a list where every element is of length one, then sapply() returns a vector. 
# If the result is a list where every element is a vector of the same length (> 1), sapply() returns a matrix

## example 1
# number of country with orange in their flag
        sum(flags$orange)
# repeat for each color 
flag_colors <- flags[, 11:17] # extract the columns containing the color data
# To get a list containing the sum of each column of flag_colors
        lapply(flag_colors, sum)
# simplify  to get a vector
        sapply(flag_colors, sum)
# get proportion per color instead
        sapply(flag_colors, mean)

## example 2
# extract flag shapes data columns 19 to 23  represents the number of times a particular shape or design appears on a country's flag.
        flag_shapes <- flags[, 19:23]
# get min and max per shape
        lapply(flag_shapes, range) # return a list
        sapply(flag_shapes, range) # return a matrix

# example 3 (sapply do not simplify result of lapply)
# returns a vector of only the 'unique' elements
        unique(c(3, 4, 5, 5, 5, 6, 6)) # return [1] 3 4 5 6
        unique_vals <- lapply(flags, unique)
# determine the length of each element of unique_vals
        sapply(unique_vals, length) #  No matrix return. The fact that the elements of the unique_vals list are all vectors of *different* length poses a problem for sapply(), since there's no obvious way of simplifying the result.
# sapply return same as lapply in this case

# exercise: ceate function with *apply
# create a function that returns the second element of a vector
        lapply(unique_vals, function(elem) elem[2]) # elem is just a 'dummy variable' that takes on the value of each element of unique_vals, in turn.

---------------------- vapply and tapply  -----------------------------------------------------
# structure of an object
        str(flags) # return class, nb. of obs. and variables, arguments with class and summary
# summary of an object
        summary(flags) # return first 6 rows and 6 columns + for each variable nin., 1sr Qu., Median, Mean, 3rd Qu., Max.
# while sapply() trie to guess the correct format of the result, vapply() allow to specify it explicitely else error which simplify code
# expect each element of the result to be a numeric vector of length 1
        vapply(flags, unique, numeric(1)) # get an error 
        vapply(flags, class, character(1)) # same result as apply(flags, class) but vapply could perform faster than sapply

## tapply enable to split data up into groups based on the value of some variable, then apply a function to the members of each group
# $landmass represents 6 part of the world => see how many flags/countries fall into each group.
        table(flags$landmass) # count number of Obs. for each value of the variable
        table(flags$animate) # 2 value => value 1 if a country's flag contains an animate image
# Determine the proportion of flags containing an animate image WITHIN each landmass group.
        tapply(flags$animate, flags$landmass, mean) # apply the mean function (which give the proportion of 1s) to the 'animate' variable separately for each of the six landmass groups
# Determine the summary of population values (in round millions) for countries with and without the color red on their flag       
        tapply(flags$population, flags$red, summary) # 
# Determine summary of population values for each of the six landmasses
        tapply(flags$population, flags$landmass, summary) # we can retrieve the the maximum population (in millions) for the fourth landmass group (Africa) which is 56 millions

---------------------- Looking at Data------------------------------------------
# Whenever you're working with a new dataset, the first thing you should do is look at it!
# What is the format of the data? 
# What are the dimensions?
# What are the variable names? 
# How are the variables stored?
# Are there missing data? 
# Are there any flaws in the data?