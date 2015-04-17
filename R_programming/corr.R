# ----------------------Part 2 -------------------------------------------------
# Write a function that reads a directory full of files and reports the number of 
# completely observed cases in each data file. The function should return a data 
# frame where the first column is the name of the file and the second column is 
# the number of complete cases. A prototype of this function follows

corr <- function(directory, threshold = 0) {
        setwd("C:/Users/Cedric/Documents/GitHub/datascience/R_programming/")
        files_full <- list.files(directory, pattern="*.csv", full.names = TRUE)
        x <- vector()  # set empty vector
        y <- data.frame() # set empty data.frame
        for (i in 1:332) { 
                y <- read.csv(files_full[i]) # create a data.frame with all data from files
                if (sum(complete.cases(y)) > threshold) { # thresold condition on complete case
                        y <- y[complete.cases(y),] # keep monitor with complete case below thresold
                        z <- cor(y$sulfate, y$nitrate)
                        x <- c(x, z)
                }
        }
        if (is.null(x)) { 
                x <- 0 
        } 
        x
}

# Tests: https://d396qusza40orc.cloudfront.net/rprog%2Fdoc%2Fcorr-demo.html
# source("corr.R")
# source("complete.R")
# cr <- corr("specdata", 150)
# head(cr)
## [1] -0.01896 -0.14051 -0.04390 -0.06816 -0.12351 -0.07589

# summary(cr)
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## -0.2110 -0.0500  0.0946  0.1250  0.2680  0.7630

# cr <- corr("specdata", 400)
# head(cr)
## [1] -0.01896 -0.04390 -0.06816 -0.07589  0.76313 -0.15783

# summary(cr)
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## -0.1760 -0.0311  0.1000  0.1400  0.2680  0.7630

# cr <- corr("specdata", 5000)
# summary(cr)
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## 

# length(cr)
## [1] 0

# cr <- corr("specdata")
# summary(cr)
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## -1.0000 -0.0528  0.1070  0.1370  0.2780  1.0000

# length(cr)
## [1] 323