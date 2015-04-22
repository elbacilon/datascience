# -----------------------  Getting and Cleaning Data - Quizz 3 ----------------
# Question 1
# The American Community Survey distributes downloadable data about United States
# communities. Download the 2006 microdata survey about housing for the state of 
# Idaho using download.file() from here: 
        #    https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv 
# and load the data into R. The code book, describing the variable names is here:      
        # https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf 
# Create a logical vector that identifies the households on greater than 10 acres 
# who sold more than $10,000 worth of agriculture products. Assign that logical 
# vector to the variable agricultureLogical. Apply the which() function like this 
# to identify the rows of the data frame where the logical vector is TRUE. 
# which(agricultureLogical) What are the first 3 values that result?

        fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
        setwd("C:/Users/Cedric/Documents/GitHub/datascience/Getting_Cleaning_Data")
        download.file(fileUrl, "housingSurveyIdaho2006.csv")
        data <- read.csv("housingSurveyIdaho2006.csv")
        dim(data)
        head(data)
        summary(data)
        str(data)

# greater than 10 acres => ACR = 3
# more than $10,000 worth of agriculture products => AGS = 6
        agricultureLogical <- which(data$AGS == 6 & data$ACR == 3)
        head(agricultureLogical, 3) # [1] 125 238 262

# Question 2
# Using the jpeg package read in the following picture of your instructor into R 
# https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg 
# Use the parameter native=TRUE. What are the 30th and 80th quantiles of the 
# resulting data? (some Linux systems may produce an answer 638 different for the 30th quantile)
        library(jpeg)
        fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
        download.file(fileUrl,"instructor.jpg", mode = 'wb')
        pic <- readJPEG("getdata-jeff.jpg", native = TRUE)
        quantile(pic, probs=c(0.3, 0.80))
        #       30%       80% 
        # -15259150 -10575416 

# Question 3
# Load the Gross Domestic Product data for the 190 ranked countries in this data set: 
        ## https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv 
# Load the educational data from this data set: 
        ## https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv 
# Match the data based on the country shortcode. How many of the IDs match? Sort 
# the data frame in descending order by GDP rank (so United States is last). 
# What is the 13th country in the resulting data frame? 

        fileUrl1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
        fileUrl2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
        download.file(fileUrl1, "countryGrossDomesticProduct.csv")
        download.file(fileUrl2, "educational.csv")
        countryData <- read.csv("countryGrossDomesticProduct.csv")
        educatinalData <- read.csv("educational.csv")
        names(countryData)
        head(countryData)
        tail(countryData)
        summary(countryData)

        countryData <- countryData[countryData$X %in% educatinalData$CountryCode & countryData$Gross.domestic.product.2012 %in% (1:190), ]
        countryData[13,]  # Spain      

        names(countryData)
        head(educatinalData)
        names(educatinalData)

        length(intersect(countryData$X, educatinalData$CountryCode)) # [1] 189
        table(countryData$X %in% educatinalData$CountryCode) # TRUE 189 

# Question 4
# What is the average GDP ranking for the "High income: OECD" and "High income: nonOECD" group?
        mergedData <- merge(countryData, educatinalData, by.x="X", by.y="CountryCode", type = "left", all = TRUE)
        mergedData <- mergedData[!is.na(mergedData$Gross.domestic.product.2012),]
        names(mergedData)
        tapply(as.numeric(mergedData$Gross.domestic.product.2012), mergedData$Income.Group, mean)
        # High income: OECD => 110.06667
        # High income: nonOECD => 93.73913

# Question 5
# Cut the GDP ranking into 5 separate quantile groups. Make a table versus Income.
# Group. How many countries are Lower middle income but among the 38 nations with 
# highest GDP?

        gdp <- as.numeric(mergedData$Gross.domestic.product.2012)
        mergedData$gdpGroups <- cut(gdp, breaks = quantile(gdp))
        table(mergedData$gdpGroups)

data <- mergedData[mergedData$Income.Group == "Lower middle income" & mergedData$gdpGroups == "(144,191]",]

restData$zipGroups <- cut(restData$zipCode, breaks = quantile(restData$zipCode))
table(restData$zipGroups)
table(restData$zipGroups, restData$zipCode)
