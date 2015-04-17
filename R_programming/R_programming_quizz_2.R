## R programming - Quizz2
# Q1
cube <- function(x, n) {
        x^3
}
cube(3) # R returns 27

# Q2
x <- 1:10
if(x > 5) {
        x <- 0
}
# R returns WARNING: 'x' is a vector of length 10 and 'if' can only test a single logical statement.

# Q3
f <- function(x) {
        g <- function(y) {
                y + z # y + 4 
        }
        z <- 4
        x + g(x) # 3 + g(3) = 3 + 7 = 10
}
z <- 10
f(3) # = 10


# Q4
x <- 5
y <- if(x < 3) {
        NA
        } else {
        10
        }
y
# y =10

# Q5
h <- function(x, y = NULL, d = 3L) {
        z <- cbind(x, d)
        if(!is.null(y))
                z <- z + y
        else
                z <- z + f
        g <- x + y / z
        if(d == 3L)
                return(g)
        g <- g + 10
        g
}

# f is free variable
