# data set https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2Fquiz1_data.zip
# unzip in working directory

# Question 12
# Extract the first 2 rows of the data frame and print them to the console. 
# What does the output look like?
        getwd()
        setwd("./rprog-data-quiz1_data")
        data <- read.csv("hw1_data.csv")
        head(data, 2)

# Question 13
# How many observations (i.e. rows) are in this data frame?
        str(data) # 153 observations

# Quetion 14
# Extract the last 2 rows of the data frame and print them to the console. 
# What does the output look like?
        tail(data, 2) 
        # Ozone Solar.R Wind Temp Month Day
        # 152    18     131  8.0   76     9  29
        # 153    20     223 11.5   68     9  30

# Question 15
# What is the value of Ozone in the 47th row?
        data[47, "Ozone"]
        
# Question 16
# How many missing values are in the Ozone column of this data frame?
        sum(is.na(data[,"Ozone"]))
        
# Question 17
# What is the mean of the Ozone column in this dataset? 
# Exclude missing values (coded as NA) from this calculation.
        mean(ozone[!is.na(data[,"Ozone"])])
        # OR
        mean(data[,"Ozone"], na.rm= TRUE)
        # OR
        colMeans(data, na.rm = TRUE)
              
# Question 18
# Extract the subset of rows of the data frame where Ozone values are above 31 and Temp values are above 90. 
        data[which(data$Ozone > 31 & data$Temp > 90), ]
        # OR
        subset(data, data$Ozone > 31 & x$Temp > 90)        
# What is the mean of Solar.R in this subset?
        subdata <- data[which (data$Ozone > 31 & data$Temp > 90),]
        # subdata <- subset(data, data$Ozone > 31 & data$Temp > 90)
        mean(subdata[,"Solar.R"], na.rm=TRUE) # [1] 212.8
        
        # OR
        colMeans(subset(data, data$Ozone > 31 & data$Temp > 90), na.rm= TRUE)
        # OR
        apply(subset(data, data$Ozone > 31 & data$Temp > 90), 2, mean, na.rm= TRUE)
        
# Question 19
# What is the mean of "Temp" when "Month" is equal to 6?
        subdata1 <- data[data$Month == 6,]         # OR subdata1 <- subset(data, data$Month == 6 )
        mean(subdata1[,"Temp"]) # [1] 79.1
        # OR 
        tapply(data$Temp, data$Month, mean)
        # OR
        colMeans(subset(data, data$Month == 6))
        
# Quesion 20
# What was the maximum ozone value in the month of May (i.e. Month = 5)?
        summary(data[data$Month == 5,]) # Max.   :115.00
        # OR
        tapply(data$Ozone, data$Month, summary)

        x <- 4
class(x)
