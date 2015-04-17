# -------------2 Finding the best hospital in a state --------------------------
# create function best that take 2 arguments: 
## 2-character abbreviated name of a state 
## an outcome name
# The function reads the outcome-of-care-measures.csv file and returns a character 
# vector with the name of the hospital that has the best (i.e. lowest) 30-day mortality 
# for the specified outcome in that state.

# The hospital name is the name provided in the Hospital.Name variable. 
# The outcomes can be one of "heart attack", "heart failure", or "pneumonia". 
# Hospitals that do not have data on a particular outcome should be excluded from 
# the set of hospitals when deciding the rankings.

# If there is a tie for the best hospital for a given outcome, then the hospital 
# names should be sorted in alphabetical order and the first hospital in that set 
# should be chosen (i.e. if hospitals "b", "c", and "f" are tied for best, then 
# hospital "b" should be returned).

# The function should check the validity of its arguments. If an invalid state value
# is passed to best, the function should throw an error via the stop function 
# with the exact message "invalid state". If an invalid outcome value is passed to
# best, the function should throw an error via the stop function with the exact
# message "invalid outcome".

best <- function(state, outcome) {
        ## Read outcome data
        x <- data.frame() # create empty data frame
        x <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        
        ## Check that state and outcome are valid
        if(any(x$State == state) == FALSE) stop("invalid state")
        if(any(c("heart attack", "heart failure", "pneumonia") == outcome) == FALSE) stop("invalid outcome")
        
        ## Return hospital name in that state with lowest 30-day death
        ### subset dataset with hospital name and the lowest 30-day mortality 
        ### without NA for the specified outcome adn for the state
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
        
        ## Return hospital name in alphabetical order
        y <- as.numeric(data[,2])
        best_hospitals <- sort(data[which(y %in% min(y)), 1])
        best_hospitals[1]
}




# Tests
# best("TX", "heart attack") # [1] "CYPRESS FAIRBANKS MEDICAL CENTER" => ok
# best("TX", "heart failure") # [1] "HARRIS COUNTY HOSPITAL DISTRICT" => NOK
# best("MD", "heart attack") # [1] "JOHNS HOPKINS HOSPITAL, THE" => ok
# best("MD", "pneumonia") # [1] "CALVERT MEMORIAL HOSPITAL" => ok
# best("BB", "heart attack") # Error in best("BB", "heart attack") : invalid state => ok
# best("NY", "hert attack") # Error in best("NY", "hert attack") : invalid outcome => ok