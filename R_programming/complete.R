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
