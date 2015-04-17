# ----------------------R Programming - Assignment 3 ----------------------------
# Detaile instructions: https://d396qusza40orc.cloudfront.net/rprog%2Fdoc%2FProgAssignment3.pdf
# Data source: https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2FProgAssignment3-data.zip
# Data unzipped in working directory: C:\Users\Cedric\Documents\GitHub\datascience\R_programming\

# Set working directory to the directory where we  unzipped the data
        setwd("C:/Users/Cedric/Documents/GitHub/datascience/R_programming/rprog-data-ProgAssignment3-data")
        list.files()
# 3 files:
        # outcome-of-care-measures.csv: Contains information about 30-day mortality and readmission rates
                ## for heart attacks, heart failure, and pneumonia for over 4,000 hospitals.
        # hospital-data.csv: Contains information about each hospital.
        # Hospital_Revised_Flatfiles.pdf: Descriptions of the variables in each file (i.e the code book).

# -------------1 Plot the 30-day mortality rates for heart attack----------------------
        outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        head(outcome)
        ncol(outcome) [1] 46 variables
        names(outcome) 

# histogram of the 30-day death rates from heart attack (column 11 in the outcome dataset)
        class(outcome[, 11]) ## [1] "character" => we need to coerce the column to be numeric
        outcome[, 11] <- as.numeric(outcome[, 11])  
        ## You may get a warning about NAs being introduced; that is okay
        hist(outcome[, 11])

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
        y <- as.numeric(data[,2])
        best_hospitals <- sort(data[which(y %in% min(y)), 1])
        
        ## Rate
        best_hospitals[1]
}


# Tests
best("TX", "heart attack") # [1] "CYPRESS FAIRBANKS MEDICAL CENTER" => ok
best("TX", "heart failure") # [1] "FORT DUNCAN MEDICAL CENTER" => OK
best("MD", "heart attack") # [1] "JOHNS HOPKINS HOSPITAL, THE" => ok
best("MD", "pneumonia") # [1] "CALVERT MEMORIAL HOSPITAL" => ok
best("BB", "heart attack") # Error in best("BB", "heart attack") : invalid state => ok
best("NY", "hert attack") # Error in best("NY", "hert attack") : invalid outcome => ok

# -------------3 Ranking hospitals by outcome in a state -------------------------
# Write a function called rankhospital that takes three arguments: the 2-character abbreviated name of a
# state (state), an outcome (outcome), and the ranking of a hospital in that state for that outcome (num).
# The function reads the outcome-of-care-measures.csv file and returns a character vector with the name
# of the hospital that has the ranking specified by the num argument. For example, the call:
        # rankhospital("MD", "heart failure", 5)
# would return a character vector containing the name of the hospital with the 5th lowest 30-day death rate
# for heart failure. The num argument can take values "best", "worst", or an integer indicating the ranking
# (smaller numbers are better). If the number given by num is larger than the number of hospitals in that
# state, then the function should return NA. Hospitals that do not have data on a particular outcome should
# be excluded from the set of hospitals when deciding the rankings.

# Handling ties. It may occur that multiple hospitals have the same 30-day mortality rate for a given cause
# of death. In those cases ties should be broken by using the hospital name. For example, in Texas ("TX"),
# the hospitals with lowest 30-day mortality rate for heart failure are shown here.

# > head(texas)
#                       Hospital.Name Rate      Rank
# 3935 FORT DUNCAN MEDICAL CENTER       8.1     1
# 4085 TOMBALL REGIONAL MEDICAL CENTER  8.5     2
# 4103 CYPRESS FAIRBANKS MEDICAL CENTER 8.7     3
# 3954 DETAR HOSPITAL NAVARRO           8.7     4
# 4010 METHODIST HOSPITAL,THE           8.8     5
# 3962 MISSION REGIONAL MEDICAL CENTER  8.8     6

# The function should check the validity of its arguments. If an invalid state value is passed to best, the
# function should throw an error via the stop function with the exact message "invalid state". If an invalid
# outcome value is passed to best, the function should throw an error via the stop function with the exact
# message "invalid outcome".

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

        # Apply num
        data <- data[ order(data[,2], data[,1]), ]
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

# -------------4 Ranking hospitals in all states  -----------------------------
# Write a function called rankall that takes two arguments: an outcome name (outcome) and a hospital ranking
# (num). The function reads the outcome-of-care-measures.csv file and returns a 2-column data frame
# containing the hospital in each state that has the ranking specified in num. For example the function call
# rankall("heart attack", "best") would return a data frame containing the names of the hospitals that
# are the best in their respective states for 30-day heart attack death rates. The function should return a value
# for every state (some may be NA). The first column in the data frame is named hospital, which contains
# the hospital name, and the second column is named state, which contains the 2-character abbreviation for
# the state name. Hospitals that do not have data on a particular outcome should be excluded from the set of
# hospitals when deciding the rankings.
# Handling ties. The rankall function should handle ties in the 30-day mortality rates in the same way
# that the rankhospital function handles ties.

rankall <- function(outcome, num = "best") {
        ## Read outcome data
        x <- data.frame() # create empty data frame
        y <- data.frame() # create empty data frame
        x <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        
        ## Check that outcome is valid
        if(any(c("heart attack", "heart failure", "pneumonia") == outcome) == FALSE) stop("invalid outcome")
        
        ## Return hospital name in that state with the given rank 30-day death rate
        if (outcome == "heart attack") {
                z <- 11
        } else if (outcome == "heart failure") {
                z <- 17
        } else if (outcome == "pneumonia") {
                z <- 23
        }
        # keep Hospital Names, State and outcome columns, remove outcome with NA
        
        # data <- x[(x[, 23] != "Not Available"), c(2, 7, 23)]

        # data <- x[(x[, 23] != "Not Available" & x[,7] == p[1]), c(2, 23, 7)] 

        ## For each state, find the hospital of the given ran
        p <- unique(x$State)
        for (i in 1:length(p)) {
                data <- x[(x[, z] != "Not Available") & (x[, 7] == p[i]), c(2, z)] 
                data <- data[ order(data[,2], data[,1]), ]
                if (num == "best") {
                        new.row <- c(data[1, 1], p[i])
                } else if (num == "worst") {
                        new.row <- c(data[nrow(data), 1], p[i])
                } else if (num > nrow(data)) {
                        new.row <- c("NA", p[i])      
                } else { 
                        new.row <- c(data[num, 1], p[i])
                }
        ## Return a data frame with the hospital names and the (abbreviated) state name
                y <- rbind(y, new.row) # insert new row
                y
        }
}

# NOTE: For the purpose of this part of the assignment (and for efficiency), your function should NOT call
# the rankhospital function from the previous section.
# The function should check the validity of its arguments. If an invalid outcome value is passed to rankall,
# the function should throw an error via the stop function with the exact message "invalid outcome". The num
# variable can take values "best", "worst", or an integer indicating the ranking (smaller numbers are better).
# If the number given by num is larger than the number of hospitals in that state, then the function should
# return NA.

# Tests 
# head(rankall("heart attack", 20), 10)
# hospital                                              state
# AK <NA>                                               AK
# AL D W MCMILLAN MEMORIAL HOSPITAL                     AL
# AR ARKANSAS METHODIST MEDICAL CENTER                  AR
# AZ JOHN C LINCOLN DEER VALLEY HOSPITAL                AZ
# CA SHERMAN OAKS HOSPITAL                              CA
# CO SKY RIDGE MEDICAL CENTER                           CO
# CT MIDSTATE MEDICAL CENTER                            CT
# DC <NA>                                               DC
# DE <NA>                                               DE
# FL SOUTH FLORIDA BAPTIST HOSPITAL                     FL

## tail(rankall("pneumonia", "worst"), 3)
# hospital                                              state
# WI MAYO CLINIC HEALTH SYSTEM - NORTHLAND, INC         WI
# WV PLATEAU MEDICAL CENTER                             WV
# WY NORTH BIG HORN HOSPITAL DISTRICT                   WY

## tail(rankall("heart failure"), 10)
# hospital                                                              state
# TN WELLMONT HAWKINS COUNTY MEMORIAL HOSPITAL                          TN
# TX FORT DUNCAN MEDICAL CENTER                                         TX
# UT VA SALT LAKE CITY HEALTHCARE - GEORGE E. WAHLEN VA MEDICAL CENTER  UT
# VA SENTARA POTOMAC HOSPITAL                                           VA
# VI GOV JUAN F LUIS HOSPITAL & MEDICAL CTR                             VI
# VT SPRINGFIELD HOSPITAL                                               VT
# WA HARBORVIEW MEDICAL CENTER                                          WA
# WI AURORA ST LUKES MEDICAL CENTER                                     WI
# WV FAIRMONT GENERAL HOSPITAL                                          WV
# WY CHEYENNE VA MEDICAL CENTER                                         WY

