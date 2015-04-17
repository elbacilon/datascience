## Data source: https://github.com/derekfranks/practice_assignment/blob/master/practice_assignment.rmd
# The zip file contains 332 comma-separated-value (CSV) files containing pollution 
# monitoring data for fine particulate matter (PM) air pollution at 332 locations 
# in the United States. Each file contains data from a single monitor and the ID 
# number for each monitor is contained in the file name. For example, data for 
# monitor 200 is contained in the file "200.csv". Each file contains three variables:
# Date: the date of the observation in YYYY-MM-DD format (year-month-day)
# sulfate: the level of sulfate PM in the air on that date (measured in micrograms per cubic meter)
# nitrate: the level of nitrate PM in the air on that date (measured in micrograms per cubic meter)
# For this programming assignment you will need to unzip this file and create the directory '
# specdata'. Once you have unzipped the zip file, do not make any modifications to the files 
# in the 'specdata' directory. In each file you'll notice that there are many days 
# where either sulfate or nitrate (or both) are missing (coded as NA). This is common with air pollution monitoring data in the United States.

# ----------------------Part 1 -------------------------------------------
# Write a function named 'pollutantmean' that calculates the mean of a pollutant 
# (sulfate or nitrate) across a specified list of monitors. The function 'pollutantmean' 
# takes three arguments: 'directory', 'pollutant', and 'id'. Given a vector monitor 
# ID numbers, 'pollutantmean' reads that monitors' particulate matter data from 
# the directory specified in the 'directory' argument and returns the mean of the 
# pollutant across all of the monitors, ignoring any missing values coded as NA.

# 1/ download data
        setwd("C:/Users/Cedric/Documents/GitHub/datascience/R_programming/")
        dataset_url <- "https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2Fspecdata.zip"
        download.file(dataset_url, "specdata.zip")
        

# 2/ Explore data
        unzip("specdata.zip", exdir = "specdata") # unzip in a new directory
        length(list.files("specdata")) # 333 files
        list.files("specdata") # list files of the directory specdata => 5 files
## explore 1 file
        monitor001 <- read.csv("specdata/001.csv")
        head(monitor001) # 4 columns
# how many rows 
        length(monitor001$Date) # 1461 observations

# 3/ build function
        setwd("C:/Users/Cedric/Documents/GitHub/datascience/R_programming/")
        pollutantmean <- function(directory, pollutant, id = 1:332) {
                files_full <- list.files(directory, pattern="*.csv", full.names = TRUE)
                x <- data.frame() # set empty data.frame
                y <- data.frame() # set empty data.frame
                for (i in id) { 
                        x <- rbind(x, read.csv(files_full[i])) # build a dataframe with all files
                }
                y <- x[which(x[,"ID"] %in% id),] # subset data frame for the argument id
                mean(y[, pollutant], na.rm = TRUE) # mean fpr the argument polluant without NA
        }

# Tests
## Tests
# round(pollutantmean("specdata", "sulfate", 1:10), 3) ## [1] 4.064 => ok
# round(pollutantmean("specdata", "nitrate", 70:72), 3) ## [1] 1.706 => ok
# round(pollutantmean("specdata", "nitrate", 23), 3) ## [1] 1.281 => ok

# ----------------------Part 2 -------------------------------------------------
# Write a function that reads a directory full of files and reports the number of 
# completely observed cases in each data file. The function should return a data 
# frame where the first column is the name of the file and the second column is 
# the number of complete cases. A prototype of this function follows


setwd("C:/Users/Cedric/Documents/GitHub/datascience/R_programming/")
complete <- function(directory, id = 1:332) {
        files_full <- list.files(directory, pattern="*.csv", full.names = TRUE)
        x <- data.frame() # set empty data.frame
        y <- data.frame() # set empty data.frame
        for (i in id) { 
                y <- read.csv(files_full[i]) # load the file in a data frame
                y <- y[complete.cases(y),]# cross check sulfate adn nitrate not NA
                nobs <- length(y$Date) # create obs value
                new.row <- data.frame(i, nobs) # create new row to insert
                x <- rbind(x, new.row) # insert new row
        }
        colnames(x) <- c("id", "nobs")
        print(x) # display result
}

## Tests
# https://d396qusza40orc.cloudfront.net/rprog%2Fdoc%2Fcomplete-demo.html 
# complete("specdata", 1) => ok 
# complete("specdata", c(2, 4, 8, 10, 12)) => ok
# complete("specdata", 30:25) => ok
# complete("specdata", 3) => ok

# SUBMIT
# source("http://d396qusza40orc.cloudfront.net/rprog%2Fscripts%2Fsubmitscript1.R")
# submit()


# ----------------------Part 3 -------------------------------------------------
# Write a function that takes a directory of data files and a threshold for complete cases 
# and calculates the correlation between sulfate and nitrate for monitor locations 
# where the number of completely observed cases (on all variables) is greater than the threshold. 
# The function should return a vector of correlations for the monitors that meet 
# the threshold requirement. If no monitors meet the threshold requirement, then 
# the function should return a numeric vector of length 0. 

?cor

corr <- function(directory, threshold = 0) {
        setwd("C:/Users/Cedric/Documents/GitHub/datascience/R_programming/")
        files_full <- list.files(directory, pattern="*.csv", full.names = TRUE)
        x <- vector()  # set empty vector
        y <- data.frame() # set empty data.frame
        for (i in 1:332) { 
                y <- read.csv(files_full[i]) # create a data.frame with all data from files
                if (sum(complete.cases(y)) > threshold) { # thresold condition on complete case
                        y <- y[complete.cases(y),] # keep monitor with complete case below thresold
                        z <- round(cor(y$sulfate, y$nitrate), 5)
                        x <- c(x, z)
                        }
                }
        if (is.null(x)) { 
                x <- 0 
                } 
        x
        }

# Tests
cr <- corr("specdata", 150)
head(cr)
summary (cr)

cr <- corr("specdata", 400)
head(cr)

cr <- corr("specdata", 5000)
summary(cr)

x <- 0
class(x)
is.vector(x)
summary(x)
