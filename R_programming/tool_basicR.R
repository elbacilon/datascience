
-------------------------------------------------------------------------------
----------------------R Programming -------------------------------------------

SWIRPL training----play()-nxt()-------------------------------------------------
        install.packages("swirl")
        library("swirl")
#       install_from_swirl("Getting_and_Cleaning_Data")
        swirl()


---------------------- clean up environment--------------------------------------
        rm(list = ls())

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
#  Check out the help page for a 
        ?list.files
# see what arguments a function can take.
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

----------------------Vectors and Lists ---------------------------------------------------
# The c() function can be used to create vectors of objects.
        x <- c(0.5, 0.6) ## numeric
        x <- c(TRUE, FALSE) ## logical
        x <- c(T, F) ## logical
        x <- c("a", "b", "c") ## character
        x <- 9:29 ## integer
        x <- c(1+0i, 2+4i) ## complex
# Using the vector() function
        x <- vector("numeric", length = 10)
        x # [1] 0 0 0 0 0 0 0 0 0 0
# Mixing objects
# When different objects are mixed in a vector, coercion occurs so that every element in the vector is of the same class.
        y <- c(1.7, "a") ## character
        y <- c(TRUE, 2) ## numeric
        y <- c("a", TRUE) ## character
# Expliciti coercion
# Objects can be explicitly coerced from one class to another using the as.* functions, if available.
        x <- 0:6 
        class(x) # [1] "integer"
        as.numeric(x) # [1] 0 1 2 3 4 5 6
        as.logical(x) # [1] FALSE TRUE TRUE TRUE TRUE TRUE TRUE
        as.character(x) # [1] "0" "1" "2" "3" "4" "5" "6"

# Lists are a special type of vector that can contain elements of different classes. 
        x <- list(1, "a", TRUE, 1 + 4i)
        x
        #[[1]]
        #[1] 1
        #[[2]]
        #[1] "a"
        #[[3]]
        #[1] TRUE
        #[[4]]
        #[1] 1+4i

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

---------------------- Factors ---------------------------------------------------
        x <- factor(c("yes", "yes", "no", "yes", "no"))
        x
        # [1] yes yes no yes no
        # Levels: no yes
        table(x)
        x
        # no yes
        # 2 3
        unclass(x)
        # [1] 2 2 1 2 1
        #attr(,"levels")
        #[1] "no" "yes"

----------------------Missing Values---------------------------------------------------
        x <- c(1, 2, NA, 10, 3)
        is.na(x) # [1] FALSE FALSE TRUE FALSE FALSE
        is.nan(x) # [1] FALSE FALSE FALSE FALSE FALSE
        x <- c(1, 2, NaN, NA, 4)
        is.na(x) # [1] FALSE FALSE TRUE TRUE FALSE
        is.nan(x) # [1] FALSE FALSE TRUE FALSE FALSE
        
# Removing NA Values 
        x <- c(1, 2, NA, 4, NA, 5)
        bad <- is.na(x)
        x[!bad] # [1] 1 2 4 5

# What if there are multiple things and you want to take the subset with no missing values?
        x <- c(1, 2, NA, 4, NA, 5)
        y <- c("a", "b", NA, "d", NA, "f")
        good <- complete.cases(x, y) # cross check index with no NA in x and y
        good # [1] TRUE TRUE FALSE TRUE FALSE TRUE
        x[good] # [1] 1 2 4 5
        y[good] # [1] "a" "b" "d" "f"

# example1
        airquality[1:6, ] # there are NA in some rows and columns
        good <- complete.cases(airquality) 
        airquality[good, ][1:6, ] # return first 6 rows without NA

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

----------------------Subsetting ---------------------------------------------------
# [ always returns an object of the same class as the original;
# [[ is used to extract elements of a list or a data frame; 
# it can only be used to extract a single element and the class of the returned object will not necessarily be a list or data frame
# $ is used to extract elements of a list or data frame by name; semantics are similar to that of [[.
 
## SUBSETTING VECTORS
# assuming x contains a random ordering of 20 numbers (from a standard normal distribution) and 20 NAs.
# view the first ten elements of x
        x[1:10] # first element of a vector is considered element 1- R uses 'one-based indexing'
# consider index vectors -- logical, positive integer, and negative integer
# extract all elements of a vector that are not NA
        y <- x[x[is.na(x)]] # x[is.na(x)] can be read as 'is not NA'
# extract all the positive elements of y
        y[y > 0] # we do on y and not x because since NA is not a value but rather a placeholder for an unknown quantity, the expression NA > 0 evaluates to NA
# extract values of x that are both non-missing AND greater than zero
        x[!is.na(x) & x > 0]
# set all elements of a vector that are greater than 10 to be equal to 4. 
        x <- c(17, 14, 4, 5, 13, 12, 10)
        x[x < 10] <- 4
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
# Subset with a logic variable
        x <- c("a","b","c","c","d","a")
        u <- x > "a "
        u # [1] FALSE TRUE TRUE TRUE TRUE FALSE
        x[u] # return [1] "b" "c" "c" "d"

## SUBSETTING LIST
# example 1
        x <- list(foo = 1:4, bar = 0.6)
        x[1] # return a list $foo [1] 1 2 3 4 
        x[[1]] # return the sequence without the calss [1] 1 2 3 4 
        x$bar # [1] 0.6
        x[["bar"]] # [1] 0.6
        x["bar"] # $bar [1] 0.6
# example 2
        x <- list(foo = 1:4, bar = 0.6, baz = "hello")
        x[c(1, 3)] # $foo [1] 1 2 3 4; $baz [1] "hello"
# ecample 3
# The [[ operator can be used with computed indices; $ can only be used with literal names.
        x <- list(foo = 1:4, bar = 0.6, baz = "hello")
        name <- "foo"
        x[[name]] ## computed index for 'foo' [1] 1 2 3 4
        x$name ## element 'name' doesn't exist! NULL
        x$foo # [1] 1 2 3 4 ## element 'foo' does exist

# Subsetting Nested Elements of a List Subsetting Nested Elements of a List
# The [[ can take an integer sequence.
        x <- list(a = list(10, 12, 14), b = c(3.14, 2.81))
        x[[c(1, 3)]] # [1] 14
        x[[1]][[3]] # [1] 14
        x[[c(2, 1)]] # [1] 3.14

## Subsetting a Matrix 
# Matrices can be subsetted in the usual way with (i,j) type indices.
        x <- matrix(1:6, 2, 3)
        x[1, 2] # [1] 3
        x[2, 1] # [1] 2
# Indices can also be missing.
        x[1, ] # [1] 1 3 5
        x[, 2] # [1] 3 4
# By default, when a single element of a matrix is retrieved, it is returned as a vector of length 1 rather
# than a 1 × 1 matrix. This behavior can be turned off by setting drop = FALSE.
        x <- matrix(1:6, 2, 3)
        x[1, 2] # [1] 3
        x[1, 2, drop = FALSE] # [,1] [1,] 3
# Similarly, subsetting a single column or a single row will give you a vector, not a matrix (by default).
        x <- matrix(1:6, 2, 3)
        x[1, ] # [1] 1 3 5
        x[1, , drop = FALSE] 
        #       [,1] [,2] [,3]
        # [1,]    1    3    5
# Partial Matching 
# Partial matching of names is allowed with [[ and $.
        x <- list(aardvark = 1:5)
        x$a # [1] 1 2 3 4 5
        x[["a"]] # NULL
        x[["a", exact = FALSE]] # [1] 1 2 3 4 5

----------------------Matrices and Data Frames --------------------------------------------
# Matrices are vectors with a dimension attribute. The dimension attribute is itself an integer vector of length 2 (nrow, ncol)
        m <- matrix(nrow = 2, ncol = 3)
        m 
        # [,1] [,2] [,3]
        # [1,] NA NA NA
        # [2,] NA NA NA
        dim(m) # [1] 2 3
        attributes(m) # $dim [1] 2 3
# Matrices are constructed column-wise, so entries can be thought of starting in the "upper left" corner and running down the columns.
        m <- matrix(1:6, nrow = 2, ncol = 3)
        m
        # [,1] [,2] [,3]
        # [1,] 1 3 5
        # [2,] 2 4 6
# Matrices can be created by column-binding or row-binding with cbind() and rbind().
        x <- 1:3
        y <- 10:12
        cbind(x, y)
        #x y
        #[1,] 1 10
        #[2,] 2 11
        #[3,] 3 12
        rbind(x, y)
        #[,1] [,2] [,3]
        #x 1 2 3
        #y 10 11 12

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


## Data Frame
# Data frames are used to store tabular data
# They are represented as a special type of list where every element of the list has to have the same length
# Each element of the list can be thought of as a column and the length of each element of the list is the number of rows
# Unlike matrices, data frames can store different classes of objects in each column (just like lists); matrices must have every element be the same class
# Data frames also have a special attribute called row.names
# Data frames are usually created by calling read.table() or read.csv()
# Can be converted to a matrix by calling data.matrix()
        x <- data.frame(foo = 1:4, bar = c(T, T, F, F))
        x
        #foo bar
        #1 1 TRUE
        #2 2 TRUE
        #3 3 FALSE
        #4 4 FALSE
        nrow(x) # [1] 4
        ncol(x) # [1] 2


# create data frame to not destroy the integrity of numeric data
        my_data <- data.frame(patients, my_matrix) # data frame store our character vector of names right alongside our matrix of numbers
        class(my_data) # return data.frame
# assign name to column in a vector orn a list
        x <- 1:3
        names(x) <- c("foo","bar","norf")
        names(x) # [1] "foo" "bar" "norf"
# assign name to a data.frame
        m <- matrix(1:4, nrow = 2, ncol = 2)
        dimnames(m) <- list(c("a","b"), c("c","d"))
# Extract the subset of rows of the data frame where Ozone values are above 31 and Temp values are above 90.
        x[which(x$Ozone > 31 & x$Temp > 90), ]
        # OR
        subset(x, x$Ozone > 31 & x$Temp > 90)
# Mean of a column solar in the subset
        colMeans(subset(x, x$Ozone > 31 & x$Temp > 90), na.rm= TRUE)
        # OR
        apply(subset(x, x$Ozone > 31 & x$Temp > 90), 2, mean, na.rm= TRUE)

# What is the mean of "Temp" when "Month" is equal to 6?
        tapply(x$Temp, x$Month, mean)
        # OR
        colMeans(subset(x, x$Month == 6))

# What was the maximum ozone value in the month of May (i.e. Month = 5)?
        tapply(x$Ozone, x$Month, summary)

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

---------------------- Vectorized operation-----------------------------------------------------
# Many operations in R are vectorized making code more efficient, concise, and easier to read.
        x <- 1:4; y <- 6:9
        x + y # [1] 7 9 11 13
        x > 2 # [1] FALSE FALSE TRUE TRUE
        x >= 2 # [1] FALSE TRUE TRUE TRUE
        y == 8 # [1] FALSE FALSE TRUE FALSE
        x * y # [1] 6 14 24 36
        x / y # [1] 0.1666667 0.2857143 0.3750000 0.4444444   
# Vectorized Matrix Operations Vectorized Matrix Operations
        x <- matrix(1:4, 2, 2); y <- matrix(rep(10, 4), 2, 2)
        x * y ## element-wise multiplication
        #   [,1] [,2]
        #[1,] 10 30
        #[2,] 20 40
        x / y  ## element-wise division
        #   [,1] [,2]
        #[1,] 0.1 0.3
        #[2,] 0.2 0.4
        x %*% y ## true matrix multiplication
        #   [,1] [,2]
        #[1,] 40 40
        #[2,] 60 60

---------------------- Control structures-----------------------------------------------------
# Control structures in R allow you to control the flow of execution of the program, depending on runtime conditions. Common structures are
# Most control structures are not used in interactive sessions, but rather when writing functions or longer expressions.
# if, else: testing a condition
# for: execute a loop a fixed number of times
# while: execute a loop while a condition is true
# repeat: execute an infinite loop
# break: break the execution of a loop
# next: skip an interation of a loop
# return: exit a function
       
# Control Structures: if
        y <- if(x > 3) {
               10
        } else {        # else condition not necessary
                0
}

# Control Structures: for
# for loops take an interator variable and assign it successive values from a sequence or vector. 
# For loops are most commonly used for iterating over the elements of an object (list, vector, etc.)
# This loop takes the i variable and in each iteration of the loop gives it values 1, 2, 3, ..., 10, and then exits.
        for(i in 1:10) {
              print(i)
        }

# These three loops have the same behavior.
        x <- c("a", "b", "c", "d")
        for(i in 1:4) {
                print(x[i])
        }
        for(i in seq_along(x)) {
             print(x[i])
        }
        for(letter in x) {
                print(letter)
        }
        for(i in 1:4) print(x[i])
# Nested for loops 
# Be careful with nesting though. Nesting beyond 2-3 levels is often very difficult to read/understand.
        x <- matrix(1:6, 2, 3)
        for(i in seq_len(nrow(x))) {
           for(j in seq_len(ncol(x))) {
                     print(x[i, j])
             }
        }

# while
# While loops begin by testing a condition. 
# If it is true, then they execute the loop body. 
# Once the loop body is executed, the condition is tested again, and so forth.
        count <- 0
        while(count < 10) {
            print(count)
              count <- count + 1
        }
# While loops can potentially result in infinite loops if not written properly. Use with care!
# Sometimes there will be more than one condition in the test.
        z <- 5
        while(z >= 3 && z <= 10) {
          print(z)
          coin <- rbinom(1, 1, 0.5)
           if(coin == 1) { ## random walk
                   z <- z + 1
            } else {
                    z <- z - 1
            }
        }
# Conditions are always evaluated from left to right.

# repeat
# Repeat initiates an infinite loop; these are not commonly used in statistical applications 
# but they do have their uses. The only way to exit a repeat loop is to call break.
        x0 <- 1
        tol <- 1e-8
        repeat {
              x1 <- computeEstimate()
              if(abs(x1 - x0) < tol) {
                      break
               } else {
                       x0 <- x1
               }
        }
# This loop is a bit dangerous because there's no guarantee it will stop. 
# Better to set a hard limit on the number of iterations (e.g. using a for loop) 
# and then report whether convergence was achieved or not.

# next, return
# next is used to skip an iteration of a loop
        for(i in 1:100) {
            if(i <= 20) {
                    ## Skip the first 20 iterations
                     next
             }
             ## Do something here
        }
# return signals that a function should exit and return a given value

---------------------- Functions-----------------------------------------------------
# Functions are created using the function() directive and are stored as R objects just like anythin else. In particular, they are R objects of class "function".
        f <- function(<arguments>) {
                ## Do something interesting
        }
# Functions in R are "first class objects", which means that they can be treated much like any other R object. Importantly,
        # Functions can be passed as arguments to other functions
        # Functions can be nested, so that you can define a function inside of another function
        # The return value of a function is the last expression in the function body to be evaluated.
# Functions arguments
# Functions have named arguments which potentially have default values.
        # The formal arguments are the arguments included in the function definition
        # The formals function returns a list of all the formal arguments of a function
        # Not every function call in R makes use of all the formal arguments
        # Function arguments can be missing or might have default values

# Argument Matching Argument Matching
# R functions arguments can be matched positionally or by name. 
# Following calls to sd are all equivalent
        mydata <- rnorm(100)
        sd(mydata)
        sd(x = mydata)
        sd(x = mydata, na.rm = FALSE)
        sd(na.rm = FALSE, x = mydata)
        sd(na.rm = FALSE, mydata)
# Even though it's legal, I don't recommend messing around with the order of the arguments too much, since it can lead to some confusion.        

# Argument Matching
# You can mix positional matching with matching by name. 
# When an argument is matched by name, it is "taken out" of the argument list 
# and the remaining unnamed arguments are matched in the order that they are listed in the function definition.
        args(lm)
        #function (formula, data, subset, weights, na.action,
        #  method = "qr", model = TRUE, x = FALSE,
        #  y = FALSE, qr = TRUE, singular.ok = TRUE,
        #  contrasts = NULL, offset, ...)
# The following two calls are equivalent.
        lm(data = mydata, y ~ x, model = FALSE, 1:100)
        lm(y ~ x, mydata, 1:100, model = FALSE)
# Function arguments can also be partially matched, which is useful for interactive work. 
# The order of operations when given an argument is
        # 1. Check for exact match for a named argument
        # 2. Check for a partial match
        # 3. Check for a positional match

# Defining a Function
# Lazy Evaluation Lazy Evaluation
# Arguments to functions are evaluated lazily, so they are evaluated only as needed.
        f <- function(a, b) {
                a^2
        }
        f(2) [1] 4
# This function never actually uses the argument b, so calling f(2) will not produce an error because the 2 gets positionally matched to a.

# The "..." Argument
# The ... argument is also necessary when the number of arguments passed to the function cannot be known in advance.
        args(paste)
        # function (..., sep = " ", collapse = NULL)
        args(cat)
        #function (..., file = "", sep = " ", fill = FALSE,
        # labels = NULL, append = FALSE)
# Arguments Coming After the "..." Argument Arguments Coming After the "..." Argument
# One catch with ... is that any arguments that appear after ... on the argument list must be named explicitly and cannot be partially matched.
        args(paste)
        # function (..., sep = " ", collapse = NULL)
        paste("a", "b", sep = ":") # [1] "a:b"
        paste("a", "b", se = ":") # [1] "a b :"

# A Diversion on Binding Values to Symbol A Diversion on Binding Values to Symbol
# When R tries to bind a value to a symbol, it searches through a series of environments to find the appropriate value. 
# When you are working on the command line and need to retrieve the value of an R object, the order is roughly
# The search list can be found by using the search function.
        # 1. Search the global environment for a symbol name matching the one requested.
        # 2. Search the namespaces of each of the packages on the search list

# Binding Values to Symbol Binding Values to Symbol
# The global environment or the user's workspace is always the first element of the search list and the base package is always the last.
# The order of the packages on the search list matters!
# User's can configure which packages get loaded on startup so you cannot assume that there will be a set list of packages available.
# When a user loads a package with library the namespace of that package gets put in position 2 of the search list (by default) and everything else gets shifted down the list.
# Note that R has separate namespaces for functions and non-functions so it's possible to have an object named c and a function named c.

# Scoping Rules Scoping Rules
# The scoping rules for R are the main feature that make it different from the original S language.
        # The scoping rules determine how a value is associated with a free variable in a function
        # R uses lexical scoping or static scoping. A common alternative is dynamic scoping.
        # Related to the scoping rules is how R uses the search list to bind a value to a symbol
        # Lexical scoping turns out to be particularly useful for simplifying statistical computations


        # Consider the following function.
        f <- function(x, y) {
                x^2 + y / z
        }
# This function has 2 formal arguments x and y. In the body of the function there is another symbol z.
# In this case z is called a free variable. The scoping rules of a language determine how values are
# assigned to free variables. Free variables are not formal arguments and are not local variables (assigned insided the function body).

# Lexical scoping in R means that the values of free variables are searched for in the environment in which the function was defined.
# What is an environment?
        # An environment is a collection of (symbol, value) pairs, i.e. x is a symbol and 3.14 might be its value.
        # Every environment has a parent environment; it is possible for an environment to have multiple "children"
        # the only environment without a parent is the empty environment
        # A function + an environment = a closure or function closure.

# Searching for the value for a free variable:
        # If the value of a symbol is not found in the environment in which a function was defined, then the search is continued in the parent environment.
        # The search continues down the sequence of parent environments until we hit the top-level environment; this usually the global environment (workspace) or the namespace of a package.
        # After the top-level environment, the search continues down the search list until we hit the empty environment. If a value for a given symbol cannot be found once the empty environment is arrived at, then an error is thrown.

        make.power <- function(n) {
             pow <- function(x) {
                      x^n
              }
              pow
        }
        # This function returns another function as its value
        cube <- make.power(3)
        square <- make.power(2)
        cube(3) # [1] 27
        square(3) # [1] 9

#Exploring a Function Closure
# What's in a function's environment?
        ls(environment(cube)) # [1] "n" "pow"
        get("n", environment(cube)) # [1] 3
        ls(environment(square)) # [1] "n" "pow"
        get("n", environment(square)) # [1] 2

# Lexical vs. Dynamic Scoping
        y <- 10
        f <- function(x) {
                y <- 2
               y^2 + g(x) # 2*2+30 =34
        }
        g <- function(x) {
                x*y # 3*10=30
        }
# What is the value of
        f(3) # [1] 34
# With lexical scoping the value of y in the function g is looked up in the environment in which the
# function was defined, in this case the global environment, so the value of y is 10.
# With dynamic scoping, the value of y is looked up in the environment from which the function was
# called (sometimes referred to as the calling environment). 
# - In R the calling environment is known as the parent frame. So the value of y would be 2.

# When a function is defined in the global environment and is subsequently called from the global
# environment, then the defining environment and the calling environment are the same. This can
# sometimes give the appearance of dynamic scoping.
        rm(y)
        g <- function(x) {
              a <- 3
              x+a+y
            }
        g(2) # Error in g(2) : object "y" not found
        y <- 3
        g(2) # [1] 8

# Consequences of Lexical Scoping
        # In R, all objects must be stored in memory
        # All functions must carry a pointer to their respective defining environments, which could be anywhere
        # In S-PLUS, free variables are always looked up in the global workspace, so everything can be stored on the disk because the "defining environment" of all functions is the same.

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
"%mult_add_one%" <- function(left, right){ # Notice the quotation marks!
        left * right + 1
}
"I" %p% "love" %p% "R!" # retunr "I love R!"

# Free variables are not formal arguments and are not local variables (assigned inside the function body)."

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
# create a function that returns the second column of a matrix
        x <- list(a = matrix(1:6, 2, 3), b = matrix(1:6, 3, 3))
        lapply(x, function(elem) elem[,2]) 

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
        tapply(flags$population, flags$landmass, summary)# we cazn retrieve the the maximum population (in millions) for the fourth landmass group (Africa) which is 56 millions

---------------------- apply & mapply & tapply------------------------------------------
# apply is used to a evaluate a function (often an anonymous one) over the margins of an array.
# It is most often used to apply a function to the rows or columns of a matrix
# It can be used with general arrays, e.g. taking the average of an array of matrices
# It is not really faster than writing a loop, but it works in one line!
        x <- matrix(rnorm(200), 20, 10)
# Mean of each column of a matrix
        apply(x, 2, mean) # get 10 mean
        colMeans = apply(x, 2, mean)
# Mean of each row of a matrix
        apply(x, 1, mean) # get 20 mean
# Shortcuts
# rowSums = apply(x, 1, sum)
# rowMeans = apply(x, 1, mean)
# colSums = apply(x, 2, sum)
# cols = apply(x, 2, mean)

# quantile of the row of a matrix
        apply(x, 1, quantile, probs = c(0.25, 0.75)) # pass arguments to quantile function
# Average matrix in an array
        a <- array(rnorm(2 * 2 * 10), c(2, 2, 10))
        apply(a, c(1, 2), mean) # same as rowMeans(a, dims = 2)

## mapply  is a multivariate apply of sorts which applies a function in parallel over a set of arguments
        mapply(rep, 1:4, 4:1) # same as list(rep(1, 4), rep(2, 3), rep(3, 2), rep(4, 1))
# Vectorizing a Function with mapply
        noise <- function(n, mean, sd) {
                rnorm(n, mean, sd)
        }
        noise(5, 1, 2) # does not work if pass a vector of argument like  noise(1:5, 1:5, 2) to get 5 random variable with diff mean
        mapply(noise, 1:5, 1:5, 2) # vectorize a function does not allow a vector as argument
        # same as
        list(noise(1, 1, 2), noise(2, 2, 2),
             noise(3, 3, 2), noise(4, 4, 2),
             noise(5, 5, 2))

## tapply  is used to apply a function over subsets of a vector
# Take group means.
        x <- c(rnorm(10), runif(10), rnorm(10, 1))
        f <- gl(3, 10) # gl Generate factors by specifying the pattern of their levels => 3 levels of 10 replications
        # here f define which groups observations x are in
        tapply(x, f, mean) # apply mean on x groups define by f and return a matrix 
# Take group means without simplification.
        tapply(x, f, mean, simplify = FALSE)
# Find group ranges.
        tapply(x, f, range) # range returns a vector containing the minimum and maximum of all the given arguments

---------------------- Split ------------------------------------------
#split takes a vector or other objects and splits it into groups determined by a factor or list of factors.
# split is not a loop function
        x <- c(rnorm(10), runif(10), rnorm(10, 1)) # vector of 30 obs.
        f <- gl(3, 10) # define groups 
        split(x, f) # get list back of 3 elements of 10 normals
# A common idiom is split followed by an lapply.
        lapply(split(x, f), mean) # same as tapply(x, f, mean)

# Splitting a Data Frame Splitting a Data Frame
        library(datasets)
        head(airquality) # zone Solar.R Wind Temp Month Day per monthr/day
# calculate mean of variables in each month => split datafame per month
        s <- split(airquality, airquality$Month)
        lapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")])) # apply colmean to each mont, exclude Month and Day variable
# Simplify the result in more compact format
        sapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")])) 
# remove NA
        sapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")], na.rm = TRUE))

## Splitting on More than One Level Splitting on More than One Level
        x <- rnorm(10)
        f1 <- gl(2, 5) # for example gender
        f2 <- gl(5, 2) # for example race
# combine the levels of factors
        interaction(f1, f2) # 10 levels because f1 has 2 levels and f2 has 5 levels
# split vector x with the 2 factors
        str(split(x, list(f1, f2))) # but interactions can create empty levels.
# drop empty levels
        str(split(x, list(f1, f2), drop = TRUE))

---------------------- Looking at Data------------------------------------------
# Whenever you're working with a new dataset, the first thing you should do is look at it!
# What is the format of the data? 
# What are the dimensions?
# What are the variable names? 
# How are the variables stored?
# Are there missing data? 
# Are there any flaws in the data?
        
# list variables in workspace
                ls()
# we work with variable plants which is a data.frame

## shape and size of the dataset
# get dimansion of data.frame
        dim(plants) # 5166 obss of 10 variables
# get number of row of a data.frame
        nrow(plants) # 5266 rows
# get number of column of a data.frame
        ncol(plants) # 10 columns
# get space memory of the data.frame
        object.size(plants) #  644232 bytes


## Analyze deeper the dataset
# get variables names of the dataset
        names(plants)
# preview the top of the dataset
        head(plants) # return top 6 rows by default
        head(plants, 10) # return top 10 rows
# preview the end of the dataset
        tail(plants, 15) # return last 15 rows
# Value row 47
        x[47,]
# Value variable 1 row 47
        x[47, 1]
# missing values column 1 of this data frame
        sum(is.na(x))
# mean of column1 in this dataset
        y <- x[, 1]
        mean(y[!is.na(y)])
        # OR        
        ?mean
        mean(x[,1], na.rm= TRUE)
        OR
        colMeans(x, na.rm = TRUE)

# view data
        View(plants) 
# get a better feel for how each variable is distributed and how much of the dataset is missing
        summary(plants)
# For numeric data summary() displays the minimum, 1st quartile, median, mean, 3rd quartile, and maximum
# For categorical variables summary() displays the number of times each value (or 'level') occurs in the data. 
# For categorical variables R truncated the summary for Active_Growth_Period by including a catch-all category called 'Other'
# for categorial variables we can see how many times each value actually occurs in the data by:
        table(plants$Active_Growth_Period)
# get structure information on a dataframe
        str(plants) # combines many of the features all in a concise and readable format.
        # Provide class, obs., variables, name and class of each variable as well as preview
# get structure information on a function
        str(lm)
# get structure information on a variable
        f <- gl(40,10)  
        str(f)

---------------------- Simulation------------------------------------------
# Generating Random Numbers Generating Random Numbers with Functions for probability distributions in R
        # rnorm: generate random Normal variates with a given mean and standard deviation
        # dnorm: evaluate the Normal probability density (with a given mean/SD) at a point (or vector of points)
        # pnorm: evaluate the cumulative distribution function for a Normal distribution
        # rpois: generate random Poisson variates with a given rate
# Probability distribution functions usually have four functions associated with them. The functions are prefixed with a
        # d for density
        # r for random number generation
        # p for cumulative distribution
        # q for quantile function

# Setting the random number seed with set.seed ensures reproducibility
        set.seed(1) # Always set the random number seed when conducting a simulation!
        rnorm(5)

## Generate random number from linear model
set.seed(20)
x <- rnorm(100)
e <- rnorm(100, 0, 2) # epsilon
y <- 0.5 + 2*x + e
summary(y)
plot(x, y)

## what if x is binary random variable (represent gender for example) 
set.seed(20)
x <- rbinom(100, 1, 0.5)
e <- rnorm(100, 0, 2) # epsilon
y <- 0.5 + 2*x + e
summary(y)
plot(x, y) # x is binary while y still continuous normal -> linear trend when

## what if I want simulate count variable (instead of continuous) => error distribtuion won't be normal but poissin
# assume outcome y has poission distribution with mean mu and log of mu as normal distribution with intercept 0.5 and slope 1 so x is a predictor
set.seed(20)
x <- rnorm(100)
log.mu <- 0.5 + 0.3*x
y <- rpois(100, exp(log.mu))
summary(y)
plot(x, y) # linear relation bw x & y as x increase the count of y

# simulating random numbers.
## sample function: takes a sample of the specified size from the elements of x using either with or without replacement.
        sample(1:6, 4, replace = TRUE) # randomly select four numbers between 1 and 6, WITH replacement (means that each number is "replaced" after it is selected so that the same number can show up more than once.)
        sample(1:20, 10) # sample 10 numbers between 1 and 20, WITHOUT replacement

# LETTERS is a predefined variable in R containing a vector of all 26 letters of the English alphabet
        sample(LETTERS) # permute all 26 letters of the English alphabet
        # same as sample(LETTERS) R takes a sample equal in size to the vector
# simulate 100 flips of an unfair two-sided coin. This particular coin has a 0.3 probability of landing tails
        flips <- sample(c(0,1), 100, replace = TRUE, prob = c(0.3, 0.7))

## simulate a binomial random variable
# Each probability distribution in R has an:
# r*** function (for "random")
# d*** function (for "density")
# p*** (for "probability"), 
# q*** (for "quantile")
# A binomial random variable represents the number of 'successes' (heads) in a given number of independent 'trials' (coin flips)
        rbinom(1, size = 100, prob = 0.7) # equivlent to previous sample + sum
# see all of the 0s and 1s, we can request 100 observations, each of size 1, with success probability of 0.7
        flips2 <- rbinom(100, size = 1, prob = 0.7)
        sum(flips2) # return 65

## simulate a normal random variable
# standard normal distribution has mean 0 and standard deviation 1
        rnorm(10)
        rnorm(10, mean = 100, sd = 25)


## exercice: what if we want to simulate 100 *groups* of random numbers, each containing 5 values generated from a Poisson distribution with mean 10
# start with one group of 5 numbers
        rpois(5, lambda = 10)
# perform this operation 100 times
        my_pois <- replicate(100, rpois(5, 10)) # create a matrix which contains 5 random numbers generated from a Poisson distribution with mean 10
# find the mean of each column in my_pois
        cm <- colMeans(my_pois)
# plot distribution  of column
        hist(cm)

---------------------- Dates and Times------------------------------------------
# Dates are represented by the 'Date' class and times are represented by the 'POSIXct' and 'POSIXlt' classes
# dates are stored as the number of days since 1970-01-01
# times are stored as either the number of seconds since 1970-01-01 (for 'POSIXct') or a list of seconds, minutes, hours, etc. (for 'POSIXlt').

## understand date storage        
        d1 <- Sys.Date()
        class(d1) # return "Date
        unclass(d1) # return 16521 = exact number of days since 1970-01-01
        d1 # return "2015-03-27"
# What if we need to reference a date prior to 1970-01-01?
        d2 <- as.Date("1969-01-01")
        unclass(d2) # retunr - 365

## understand time storage
        t1 <- Sys.time() 
        t1  # return "2015-03-27 23:56:57 EDT"
        class(t1) # return "POSIXct" "POSIXlt"
        unclass(t1) # return 1427515017 = number of seconds since the beginning of 1970
        # Sys.time() returns an object of class POSIXct
# coerce the result to POSIXlt
        t2 <- as.POSIXlt(Sys.time()) # return "2015-03-27 23:59:41 EDT"
        unclass(t2) # list of values that make up the date and time
        str(unclass(t2)) # to get more comoact view
# get the minutes from the time stored in t2
        t2$min

## functions on Dates
        weekdays(d1) # the day of week from any date or time object
        months(t1) # the month from any date or time object
        quarters(t2) # the quarter from any date or time object

# Often, the dates and times in a dataset will be in a format that R does not recognize.
# converts character vectors to POSIXlt (similar to as.POSXlt() exfept that the input doesn't have to be in a particular format (YYYY-MM-DD))
        strptime("October 17, 1986 08:24", "%B %d, %Y %H:%M") # return "1986-10-17 08:24:00"


# arithmetic opeations on date
        Sys.time() > t1 # return  TRUE
        Sys.time() - t1 # return Time difference of 20.46041 mins
        difftime(Sys.time(), t1, units = 'days') # same as above but can spec the units parameter

---------------------- Base Graphics ----------------------------------------
# strengths of R relative to other programming languages is the ease  to create publication_quality graphics
# more advanced to check These include lattice, ggplot2 and ggvis.

# load data
        data(cars)
# could use help for data set
        ?cars # The data give the speed of cars and the distances taken to stop. Note that the data were recorded in the 1920s
# Dataset exploration
        head(cars)
        dim(cars)
        names(cars)
        tail(cars)
        summary(cars)
        str(cars)
# create a plot of the cars data frame
        plot(cars) # 'plot' is short for scatterplot
# set axis 
        plot(x = cars$speed, y = cars$dist) # with variable names
        # use formula interface for same result
        plot(dist ~ speed, cars)

        plot(x = cars$speed, y = cars$dist, xlab = "Speed", ylab = "Stopping Distance") # set labels
        plot(cars, main = "My Plot") # set title
        plot(cars, sub = "My Plot Subtitle") # set subtitle
        plot(cars, col = 2) # set color
        plot(cars, xlim = c(10, 15)) # limit axis to 10 to 15
        plot(cars, pch = 2) # change shape of symbols

# Boxplot function (Produce box-and-whisker plot(s) of the given (grouped) values.)
        data(mtcars)
# Dataset exploration
        head(mtcars)
        dim(mtcars)
        names(mtcars)
        tail(mtcars)
        summary(mtcars)
# plot the relationship between cyl (number of cylinders) on the x-axis and mpg (miles per gallon) on the y-axis
        boxplot(formula = mpg ~ cyl, data = mtcars) #  show mpg is much lower for cars with more cylinders

# histogram function
# best used by just passing in a single vector.
        hist(mtcars$mpg)
# More on of base graphics http://www.ling.upenn.edu/~joseff/rstudy/week4.html
# else check ggplot2 package


---------------------- Debugging------------------------------------------
# traceback: prints out the function call stack after an error occurs; does nothing if there's no error
        rm (x) # remove and rm can be used to remove objects. 
        # example 1
        mean(x) # return > Error in mean(x) : object 'x' not found
        traceback() # return > 1: mean(x) because only one step
        # call traceback right away  after the error        
        # example 2
        lm(y ~ x) # return > Error in eval(expr, envir, enclos) : object 'y' not found
        traceback() # return 7 steps

# debug: flags a function for "debug" mode which allows you to step through execution of a function one line at a time
# browser: suspends the execution of a function wherever it is called and puts the function in debug mode
        debug(lm) # move lm in debug mode
        lm(y ~ x) # call the function to start debug mode (get print of the functin first)
        Browse[2]> n #  Browser is the R workspace, n for NEXT > return each step of the function one by one

# trace: allows you to insert debugging code into a function a specific places
# recover: allows you to modify the error behavior so that you can browse the function call stack
        options(error = recover)
        read.csv("nosuchfile") # get back a menu of function call stack (same as traceback)
        # select function step to start "Browse" function as with debug but usefull with large function 
# print/cat: there's also the more blunt technique of inserting print/cat statements in the function.

# There are three main indications of a problem/condition: message, warning, error: only an error is fatal
        ·
---------------------- Profiler-------------------------------------------------
# Performance optimization
        system.time() # return time to execute an expression. 
        # Return an object of class proc_time: user time AND elapsed time (differ if waiting time OR // processing)

## elasped time > user time
        system.time(readLines("http://www.marmiton.org/recettes/recette_cuisse-de-poulet-a-la-sauce-de-soja-aux-champignons-et-a-la-coriandre-fraiche_222644.aspx"))
        # because of network time
## elapsed time < user time
        hilbert <- function(n) {
                i <- 1:n
                1 / outer (i - 1, i,  "+")
        }
        x <- hilbert(1000)
        system.time(svd(x)) # user time *2 elapsed time on Mac because of // processing with 2 core

# Timing Longer Expressions Timing Longer Expressions
        system.time({
          n <- 1000
          r <- numeric(n)
         for (i in 1:n) {
                 x <- rnorm(n)
                 r[i] <- mean(x)
                }
        })

# issue is that we can use this function where we know where the problem is which could be difficult with long program
# Rprof() keeps track the function call stack at regular sampled intervals and tabulates how much time is spent in each function
# default sample interval is 0.02 seconds => not usefull if function too quick
# summaryRprof() summarize Rprof which is not readable
# 2 methods to normalize the data:
        # by.total: divides time spent in each function by total run time
        # by.self: does same but subtract first out time spent in function above the call stack => more accurate


-------------------------------------------------------------------------------
------------------------------Getting and cleaning data ------------------------
# obtaining data from the web, from APIs, and from colleagues 
# in various formats including raw text files, binary files, and databases. JSON, XML, and flat files (.csv, .txt). 
# basics of data cleaning and how to make data tidy. 
# Tidy data dramatically speed downstream data analysis tasks.
# Components of a complete data set including raw data, processing instructions, codebooks, and processed data. 
# The course will cover the basics needed for collecting, cleaning, and sharing data.
# Raw data > Processing script > tidy data > data anlayisis > data communication       
# code book (meta data) describe each variable and its values in the tidy data set
        
------------------------------Downloading files --------------------------------
# get working diretory
        getwd()
# set working directory
# Relative Path
        setwd("./Documents")       
# Move relative
        setwd("../") # Move up 1 diredctory
# Abosulte path
        setwd("C:/Users/Cedric/Documents/GitHub/datascience")
# check for directories 
        file.exists("R_programming") # return true or false
# create directory
        dir.create("directory_name")
# example for create directory if no exist
        if(!file.exists("name") {
                dir.create("name"))    
        }
# download file from tne internet in R (improve reproducability)
        fileUrl <- "http://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
        download.file (fileUrl, destfile = "./cameras.csv") 
        dateDownloaded <- date() # set date of the download

------------------------------Reading local files --------------------------------
# Reading in Larger Datasets with read.table Reading in Larger Datasets with read.table
# Use the colClasses argument. Specifying this option instead of using the default can make
# 'read.table' run MUCH faster, often twice as fast. In order to use this option, you have to know the
# class of each column in your data frame. If all of the columns are "numeric", for example, then
# you can just set colClasses = "numeric". A quick an dirty way to figure out the classes of
# each column is the following:
        initial <- read.table("datatable.txt", nrows = 100)
        classes <- sapply(initial, class)
        tabAll <- read.table("datatable.txt",
                     colClasses = classes)
# Set nrows. This doesn't make R run faster but it helps with memory usage. A mild overestimate
# is okay. You can use the Unix tool wc to calculate the number of lines in a file
        

# Calculating Memory Requirements
# I have a data frame with 1,500,000 rows and 120 columns, all of which are numeric data. Roughly,
# how much memory is required to store this data frame?
# 1,500,000 × 120 × 8 bytes/numeric
# = 1440000000 bytes
# = 1440000000 / 2*20 bytes/MB
# = 1,373.29 MB
# = 1.34 GB

# Reading local file read.table(). read.csv(), read.csv2()
        cameraData <- read.table("./cameras.csv", sep = ",", header = TRUE )
        # quote="" means no quote
        # skip = number of lines to skip before starting to read
        # na.strings = character replacing missing value
        # nrows = number of rows to read in the file
        head(cameraData)

------------------------------Textual Format --------------------------------
# dumping and dputing are useful because the resulting textual format is edit-able, and in the case
# of corruption, potentially recoverable.
# Unlike writing out a table or csv file, dump and dput preserve the metadata (sacrificing some
# readability), so that another user doesn't have to specify it all over again.
# Textual formats can work much better with version control programs like subversion or git which
# can only track changes meaningfully in text files
# Textual formats can be longer-lived; if there is corruption somewhere in the file, it can be easier to fix the problem
# Textual formats adhere to the "Unix philosophy"
# Downside: The format is not very space-efficient

# dput-ting R Objects 
# Another way to pass data around is by deparsing the R object with dput 
# and reading it back in using dget.
        y <- data.frame(a = 1, b = "a")
        dput(y)
        # structure(list(a = 1, b = structure(1L, .Label = "a", class = "factor")),
        # .Names = c("a", "b"), row.names = c(NA, -1L),
        # class = "data.frame")
        dput(y, file = "y.R")
        new.y <- dget("y.R")
        new.y
        #  a b
        #1 1 a

# Dumping R Objects
# Multiple objects can be deparsed using the dump function and read back in using source.
        x <- "foo"
        y <- data.frame(a = 1, b = "a")
        dump(c("x", "y"), file = "data.R")
        rm(x, y)
        source("data.R")
        y
        #  a b
        #1 1 a
        x
        # [1] "foo"

# Interfaces to the Outside World Interfaces to the Outside World
# Data are read in using connection interfaces. 
# Connections can be made to files (most common) or to other more exotic things.

# File Connections
        str(file)
        function (description = "", open = "", blocking = TRUE,
                 encoding = getOption("encoding"))
        # description is the name of the file
        # open is a code indicating
        # "r" read only
        # "w" writing (and initializing a new file)
        # "a" appending
        # "rb", "wb", "ab" reading, writing, or appending in binary mode (Windows)
                
# Connections Connections
# In general, connections are powerful tools that let you navigate files or other external objects. In
# practice, we often don't need to deal with the connection interface directly.
        con <- file("foo.txt", "r")
        data <- read.csv(con)
        close(con)
# is the same as
        data <- read.csv("foo.txt")

# Reading Lines of a Text File Reading Lines of a Text File
        con <- gzfile("words.gz")
        x <- readLines(con, 10)
        x
        # [1] "1080" "10-point" "10th" "11-point"
        # [5] "12-point" "16-point" "18-point" "1st"
        # [9] "2" "20-point"
# writeLines takes a character vector and writes each element one line at a time to a text file.

# Reading Lines of a Text File
# readLines can be useful for reading in lines of webpages
## This might take time
        con <- url("http://www.jhsph.edu", "r")
        x <- readLines(con)
        head(x)
        #[1] "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\">"
        #[2] ""
        #[3] "<html>"
        #[4] "<head>"
        #[5] "\t<meta http-equiv=\"Content-Type\" content=\"text/html;charset=utf-8

------------------------------Reading Excel files --------------------------------
# Reading excel files
        fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.xlsx?accessType=DOWNLOAD"
        download.file (fileUrl, destfile = "./cameras.xlsx", mode='wb') 
        dateDownloaded <- date() # set date of the download
        # xlsx package + JAVA        
                # Need to install.packages rJava, xlsxjars, xlsx
                # install.packages("rJava")
                # install.packages("xlsxjars")
                # install.packages("xlsx")
                # Sys.setenv(JAVA_HOME='C:/Program Files/Java/jre1.8.0_40')
                # library(rJava)
                # library(xlsxjars)
                # library(xlsx)
                cameraData <- read.xlsx("./cameras.xlsx", sheetIndex = 1)
                head(cameraData)

------------------------------Reading XML files --------------------------------
# Reading XML files
        # markup = label that give the text structure
        # content = the actual test of the file
        # Tags = general label: start tag <section>, end tag </section>, emtpy tag <line-break/ >
        # Elements = specific tags: <Greeting> Hello world</Greeting>
        # Attributes = elements of a label: <img src ="jeff.jpg" alt="instructor">
        install.packages("XML")
        library(XML)
        fileUrl <- "http://www.w3schools.com/xml/simple.xml"
        doc <- xmlTreeParse(fileUrl, useInternal = TRUE)
        rootNode <- xmlRoot(doc) # wraper elements of the entire doc
        xmlName(rootNode) # return element of the XML file => Breakfast menu
        names(rootNode) # name of the root nodes
        rootNode[[1]] # return first food element
        rootNode[[1]][[1]] # return first elemetn of first element
        # programmatic extraction 
        xmlSApply(rootNode, xmlValue) # extract only text of the XML
        # get specific document in XML with XPATH (new language)
        xpathSApply(rootNode, "//name", xmlValue) # take out all node corresponding with element tag with "name"
        xpathSApply(rootNode, "//price", xmlValue) # extract menu prices
# Reading Web site page
        fileUrl <- "http://espn.go.com/nba/team/schedule/_/name/bos"
        doc <- htmlTreeParse(fileUrl, useInternal = TRUE)
        scores <- xpathSApply(doc, "//li[@class='score']", xmlValue) # if li=list & class=scrore return value
        teams <- xpathSApply(doc, "//li[@class='team-name']", xmlValue)
        scores
        teams

------------------------------Reading JSON files --------------------------------
# Reading JSON (common format for API, similar to XML but different syntax/format)
        # install.packages("jsonlite")
        # install.packages("curl")
        library(curl)
        library(jsonlite)
        jsonData <- fromJSON("https://api.github.com/users/jtleek/repos")
        names(jsonData)
        names(jsonData$owner)
        jsonData$owner$login
        # writing dataframe to JSON
                myjson <- toJSON(iris, pretty = TRUE)
                cat(myjson)
        # convert back to JSON
                iris2 <- fromJSON(myjson)
                head(iris2)

------------------------------data.table package --------------------------------
# using data.table
# inherets from data.frame, all functions working with data.frame work also with data.tabel
# much faster for subsetting, group and updating
        # install.packages("data.table")
        library (data.table)
        DF <- data.frame(x=rnorm(9),y=rep(c("a","b","c"), each = 3), z=rnorm(9))
        head(DF,3)
        DT <- data.table(x=rnorm(9),y=rep(c("a","b","c"), each = 3), z=rnorm(9))
        head(DT,3)
        tables() # list data tables in memory
        # subsetting row
        DT[2,] # same as DT[2]
        DT[DT$y=="a",] # same as DT[DT$y=="a"]
        DT[c(2,3)]
        # subsetting column
        # different than for data.frame, argument after coma is an expression = collection of statements enclosed in curley brackets
        DT[,list(mean(x), sum(z))] # return mean of x and sum of z
        DT[,table(y)]
        # adding column
        DT[,w:=z*z]
        DT2 <- DT
        DT[, y:=2]
        head(DT2) # same as head (DT) should use copy function
        # Multiple operations
        DT[,m := {tmp <- (x+z); log2(tmp+5)}]
        # plyr like operations
        DT[,a := x>0]
        DT[,b := mean(x+w), by=a] # mean when a = TRUE and replace in all row where a = TRUE
        # special variables
        set.seed(123)
        DT <- data.table(x=sample(letters[1:3], 1E5, TRUE))
        DT[, .N, by=x] # count number each letter appear
        # Keys
        DT <- data.table(x=rep(c("a","b","c"), each = 100), y = rnorm (300))
        setkey(DT, x)
        DT['a'] # subset base on x very simple
        # joins
        DT1 <- data.table(x=c("a","b","c", "dt1"), y=1:4)
        DT2 <- data.table(x=c("a","b","dt2"), z=5:7)
        setkey(DT1,x); setkey(DT2, x)
        merge(DT1, DT2)
        # fast reading
        big_df <- data.frame(x=rnorm(1E6), y=rnorm(1E6))
        file <- tempfile()
        write.table(big_df, file=file, row.names=FALSE, col.names=TRUE, sep="\t", quote=FALSE)
        system.time(fread(file)) # elapsed = 0.322
        system.time(read.table(file, header= TRUE, sep="\t")) # elapsed = 5.755

------------------------------Reading from mysql --------------------------------
        # install.packages("RMySQL")
        # install.packages("DBI")
        library(DBI)
        library(RMySQL)
# Reading data from from UCSC (http://genome.ucsc.edu/goldenPath/help/mysql.html)
        ucscDB <- dbConnect(MySQL(), user="genome", 
                            host="genome-mysql.cse.ucsc.edu")
        result <- dbGetQuery(ucscDB, "Show databases;"); dbDisconnect(ucscDB);
        result
# Connecting to a DB and listing tables
        hg19 <- dbConnect(MySQL(), user="genome", db= "hg19", 
                          host="genome-mysql.cse.ucsc.edu")
        allTables <- dbListTables(hg19)
        length(allTables) 
        allTables[1:5]
# Get dimensions of a specific table
        dbListFields(hg19, "affyU133Plus2")
        dbGetQuery(hg19, "Select count(*) from affyU133Plus2")
# Read from a Table
        affydata <- dbReadTable(hg19,"affyU133Plus2")
        head(affydata)
# Select a Subset of a table
        query <- dbSendQuery(hg19, "Select * from affyU133Plus2 where misMatches between 1 and 3")
        affyMis <- fetch(query); quantile(affyMis$misMatches);
        affyMisSmall <- fetch(query, n=10); dbClearResult(query);
        dim(affyMisSmall) # 10 rows 22 columns
# Disconnet
        dbDisconnect(hg19)

------------------------------Reading from HDF5 --------------------------------
# use to store large data set
# support storing a range of data types
# hierarchical data format
        # groupscontains 1tomany data sets and metadata (group header with group names and list attributes + group symbol table with a list of objects in group)
        # datasets multidimensional array of data elements with metadata ( header with name, dataype, dataspace and storage layout + data array with data)
# Install RHDF5 package
        source ("http://bioconductor.org/biocLite.R")
        biocLite ("rhdf5")      
        library(rhdf5)
# create h5 file
        created <- h5createFile("example.h5")
        created
# create groups
        created <- h5createGroup("example.h5", "AAA")
        created <- h5createGroup("example.h5", "baa")
        created <- h5createGroup("example.h5", "foo/foobaa")
        h5ls("example.h5")
# write to group
        A <- matrix(1:10, nr=5, nc=2)
        h5write(A, "example.h5", "foo/A")
        B <- array(seq(0.1, 2.0, by=0.1), dim=c(5,2,2))
        attr(B, "scale") <- "liter" # Get or set specific attributes of an object.
        h5write(B, "example.h5", "foo/foobaa/B")
        h5ls("example.h5")
# write a data set
        df <- data.frame(1L:5L, seq(0.1, length.out=5), c("ab", "cde", "fghi", "a", "s"), stringsAsFactors=FALSE)
        h5write(df, "example.h5", "df")
        h5ls("example.h5")
# Read data
        readA <- h5read("example.h5", "foo/A")
        readB <- h5read("example.h5", "foo/foobaa/B")
        readdf <- h5read("example.h5", "df")
        readA
# Writing and readin chunks
        C <- matrix(1:10, nr=5, nc=2)
        h5write(C, "example.h5", "foo/C")
        h5write(c(12,13,14), "example.h5", "foo/C", index=list(1:3,1))
        h5read("example.h5", "foo/C")

------------------------------Reading data from the Web ------------------------
# getting data off webpage - readLines()
        con <- url("https://scholar.google.com/citations?user=HI-I6C0AAAAJ")
        htmlCode <- readLines(con)
        close(con)
        htmlCode
# parsing with XML1
        install.packages("XML")
        library(XML)
        url <- "http://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en"
        html <- htmlTreeParse(url, useInternalNodes= TRUE)
        xpathSApply(html, "//title", xmlValue) # return title meta
        xpathSApply(html, "//td[@id='Citedby']", xmlValue)
# parsing with XML2
        fileUrl <- "http://espn.go.com/nfl/team/schedule/_/name/bal/year/2013"
        doc <- htmlTreeParse(fileUrl, useInternal=TRUE)
        xpathSApply(doc,"//li[@class='score']", xmlValue)
# GET from httr package
        install.packages("httr")
        library(httr)
        html2 <- GET(url)
        content2 <- content(html2, as="text")
        parsedHtml <- htmlParse(content2, asText= TRUE)
        xpathSApply(parsedHtml, "//title", xmlValue)
# accessing webpages with password
        pg1 <- GET("http://httpbin.org/basic-auth/user/passwd")
        pg1 # return Status 404
        pg2 <- GET("http://httpbin.org/basic-auth/user/passwd",
                   authenticate("user","passwd"))
        pg2 # return Status 200
        names(pg2)
# Using handles
        google <- handle("http://google.com")
        pg1 <- GET(handle=google, path="/")
        pg2 <- GET(handle=google, path="search")

------------------------------Reading data from APIs ---------------------------
# Twitter developer https://apps.twitter.com
# Application ELBACILON
# Consumer Key (API Key)        9VSeIOSQ7cYoM6PmxxiuuDeBo
# Consumer Secret (API Secret)	9fCjdoWjmD7PRLXuK26yLoJMSXK8IoCePH48lWi6VmlpDtjp3b
# Owner	Elbacilon
# Owner ID	28335171
# Callback URL	http://www.elbacilon.me
# Access token URL	https://api.twitter.com/oauth/access_token
# Access Token        28335171-QI3fg5X73fqS8yyxLWmHlX8dgQArKFmHdxkFbAk24
# Access Token Secret	jYUjFrhC7qTPl9Pq6iefYhjSQHidwonj51yEzPEDe4h57
        
# Accessing Twitter from R
        myapp <- oauth_app("twitter",
                           key="9VSeIOSQ7cYoM6PmxxiuuDeBo", secret="9fCjdoWjmD7PRLXuK26yLoJMSXK8IoCePH48lWi6VmlpDtjp3b")
        sig <- sign_oauth1.0(myapp,
                             token = "28335171-QI3fg5X73fqS8yyxLWmHlX8dgQArKFmHdxkFbAk24",
                             token_secret= "jYUjFrhC7qTPl9Pq6iefYhjSQHidwonj51yEzPEDe4h57")
        homeTL <- GET("https://api.twitter.com/1.1/statuses/home_timeline.json", sig)
# converting to JSON object
        # install.packages("httr")
        # library(httr)
        # install.packages("jsonlite")
        # library(jsonlite)
        json1 <- content(homeTL)
        json2 <- jsonlite::fromJSON(toJSON(json1))
        json2[1,1:4]
