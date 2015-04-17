rankhospital <- function(state, outcome, num = "best") {
        ## Read outcome data
        x <- data.frame() # create empty data frame
        x <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        
        ## Check that state and outcome are valid
        if(any(x$State == state) == FALSE) stop("invalid state")
        if(any(c("heart attack", "heart failure", "pneumonia") == outcome) == FALSE) stop("invalid outcome")
        
        ## Return hospital name in that state with the given rank 30-day death rate
        if (outcome == "heart attack") {
                z <- 11
                data <- x[x$State == state & (x[, z] != "Not Available"), c(2,z)]
        } else if (outcome == "heart failure") {
                z <- 17
                data <- x[x$State == state & (x[, z] != "Not Available"), c(2, z)]
        } else if (outcome == "pneumonia") {
                z <- 23
                data <- x[x$State == state & (x[, z] != "Not Available"), c(2, z)]
        }
        
        
        # data <- x[x$State == "TX" & (x[, 23] != "Not Available"), c(2, 23)]
        
        data <- data[ order(data[,2], data[,1]), ]
        
        # num <- "best"
        
        if (num == "best") {
                data[1, 1]
        } else if (num == "worst") {
                data[nrow(data), 1]
        } else if (num > nrow(data)) {
                print(NA)       
        } else { 
                data[num, 1]  
        }
}

# Tests 
# rankhospital("TX", "heart failure", 4) # [1] "DETAR HOSPITAL NAVARRO"
# rankhospital("MD", "heart attack", "worst") # [1] "HARFORD MEMORIAL HOSPITAL"
# rankhospital("MN", "heart attack", 5000) # [1] NA