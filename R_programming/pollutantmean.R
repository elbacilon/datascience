## R programming - Assignment1: Air Pollution

## Part 1
# Write a function named 'pollutantmean' that calculates the mean of a pollutant 
# (sulfate or nitrate) across a specified list of monitors. The function 'pollutantmean'
# takes three arguments: 'directory', 'pollutant', and 'id'. Given a vector 
# monitor ID numbers, 'pollutantmean' reads that monitors' particulate matter data 
# from the directory specified in the 'directory' argument and returns the mean 
# of the pollutant across all of the monitors, ignoring any missing values coded as NA.


## 'directory' is a character vector of length 1 indicating
## the location of the CSV files

## 'pollutant' is a character vector of length 1 indicating
## the name of the pollutant for which we will calculate the
## mean; either "sulfate" or "nitrate".

## 'id' is an integer vector indicating the monitor ID numbers
## to be used

## Return the mean of the pollutant across all monitors list
## in the 'id' vector (ignoring NA values)


setwd("C:/Users/Cedric/Documents/GitHub/datascience/R_programming/")
pollutantmean <- function(directory, pollutant, id = 1:332) {
        files_full <- list.files(directory, pattern="*.csv", full.names = TRUE)
        x <- data.frame()
        y <- data.frame()
                for (i in id) {
                        x <- rbind(x, read.csv(files_full[i]))
                }
        y <- x[which(x[,"ID"] %in% id),]
        mean(y[, pollutant], na.rm = TRUE)
        }

## Tests
# round(pollutantmean("specdata", "sulfate", 1:10), 3) ## [1] 4.064 => ok
# round(pollutantmean("specdata", "nitrate", 70:72), 3) ## [1] 1.706 => ok
# round(pollutantmean("specdata", "nitrate", 23), 3) ## [1] 1.281 => ok


# SUBMIT
# source("http://d396qusza40orc.cloudfront.net/rprog%2Fscripts%2Fsubmitscript1.R")
# submit()
