# Download Data
        setwd("C:/Users/Cedric/Documents/GitHub/datascience/R_programming/")
        dataset_url <- "http://s3.amazonaws.com/practice_assignment/diet_data.zip"
        download.file(dataset_url, "diet_data.zip")

# Explore data
        unzip("diet_data.zip", exdir = "diet_data") # unzip in a new directory
        list.files("diet_data") # list files of the directory diet_data => 5 files
## explore 1 file
        andy <- read.csv("diet_data/Andy.csv")
        head(andy) # 4 columns
# how many rows 
        length(andy$Day) # 30 observations
        # OR
        # dim(andy)
        # str(andy)
        # summary(andy)
        # names(andy)
        # all of the other files match this format and length. 
        # 30 days worth of weight data for 5 subjects of an imaginary diet study.

# Andy's starting weight? 
# subset the data => first row of the 'Weight' column:
        andy[1, "Weight"] # [1] 140

#  create a subset of the 'Weight' column where the value of the 'Day' column is equal to 30
        andy[which(andy$Day == 30), "Weight"]
# OR: andy[which(andy[,"Day"] == 30), "Weight"]
# OR: subset(andy$Weight, andy$Day==30)

# assign Andy's starting and ending weight to vectors:
andy_start <- andy[1, "Weight"]
andy_end <- andy[30, "Weight"]
# find out how much weight he lost by subtracting the vectors:
andy_loss <- andy_start - andy_end
andy_loss # Andy lost 5 pounds over the 30 days

#  look at everybody at once
# list.files() command. It returns the contents of a directory in alphabetical order. 
# need full.names = TRUE to include "diet_data" else read funcrtion we'll look in working directory
files_full <- list.files("diet_data", full.names=TRUE)
dat <- data.frame()
for (i in 1:5) {
        dat <- rbind(dat, read.csv(files_full[i]))
}
str(dat)
# median(dat$Weight) # return NA
# sum(is.na(dat))      # there are 13 NA
median(dat$Weight, na.rm=TRUE)

# median weight of day 30 by taking the median of a subset of the data where Day=30.
median(dat[dat$Day == 30, "Weight"], na.rm = TRUE)

# build a function that will return the median weight of a given day.
# argument should be directory and day  for which they want to calculate the median.
weightmedian <- function(directory, day) {
        files_full <- list.files(directory, full.names=TRUE) # create list of files
        dat <- data.frame() # create empty data.frame
        for (i in 1:5) {
                #loops through the files, rbinding them together 
                dat <- rbind(dat, read.csv(files_full[i]))
        }
        dat_subset <- dat[which(dat[, "Day"] == day),]  #subsets the rows that match the 'day' argument
        median(dat_subset[, "Weight"], na.rm=TRUE)      #identifies the median weight while stripping out the NAs
}
weightmedian(directory = "diet_data", day = 20)
weightmedian("diet_data", 4)
weightmedian("diet_data", 17)       


##################################### ALTERNATIVE ##################################
# loop by copying and recopying it. It works, but it's slow and if you've got a lot of data,
# The better approach is to create an output object of an appropriate size and then fill it up.
# create an empty list that's the length of our expected output. 
# In this case, our input object is going to be files_full and our empty list is going to be tmp.
files_full <- list.files(directory, full.names=TRUE) # create list of files
tmp <- vector(mode = "list", length = length(files_full))
summary(tmp)
# read in those csv files and drop them into tmp.
for (i in seq_along(files_full)) {
        tmp[[i]] <- read.csv(files_full[[i]])
}
str(tmp)
# we have a list of 5 elements called tmp
# each element of the list is a data frame containing one of the csv files.
# It just so happens that what we just did is functionally identical to using lapply.
# str(lapply(files_full, read.csv))

# need to go from a list to a single data frame
# str(tmp[[1]])
# head(tmp[[1]][,"Day"])
# We can use a function called do.call() to combine tmp into a single data frame. 
# do.call lets you specify a function and then passes a list as if each element of the list were an argument to the function. 
output <- do.call(rbind, tmp)
str(output)
