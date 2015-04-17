# Question 1
# data source https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv
# code book https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf 
# How many properties are worth $1,000,000 or more?
        fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
        download.file (fileUrl, destfile = "./idahoHousing.csv") 
        dateDownloaded <- date()
        idahoHousingData <- read.table("./idahoHousing.csv", sep = ",", header = TRUE )
        DT <- data.table(idahoHousingData)
        # head(DT)
        DT[,table(VAL)] # 53 properties are worth $1,000,000 or more
        #  DT[, .N, by=VAL]
        
# Question 2
# Check code book Which of the "tidy data" principles does the variable FES violate?
        summary(DT$FES)
        head(DT$FES, 10)
# Answer: Tidy data has one variable per column.
        
# Question 3
# data source Natural Gas Aquisition Program xls: https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx 
# Download the Excel spreadsheet:
        fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
        download.file (fileUrl, destfile = "./naturalgasacquisition.xlsx", mode='wb') 
        dateDownloaded <- date() # set date of the download
        # install.packages("rJava")
        # install.packages("xlsxjars")
        # install.packages("xlsx")
        # Sys.setenv(JAVA_HOME='C:/Program Files/Java/jre1.8.0_40')
        # library(rJava)
        # library(xlsxjars)
        # library(xlsx)
# Read rows 18-23 and columns 7-15 into R and assign the result to a variable called:
        # ?read.xlsx
        dat <- read.xlsx("./naturalgasacquisition.xlsx", sheetIndex = 1, rowIndex = 18:23, colIndex = 7:15)
        head(dat)
# What is the value of:
        sum(dat$Zip*dat$Ext,na.rm=T) 

# Question 4 
# Read the XML data on Baltimore restaurants from here:  https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml 
        install.packages("XML")
        library(XML)
        fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
        download.file (fileUrl, destfile = "./baltimorerestaurants.xml") 
        data <- xmlNativeTreeParse("./baltimorerestaurants.xml", useInternal = TRUE)
        rootNode <- xmlRoot(data) # wraper elements of the entire doc
        xmlName(rootNode) # return element of the XML file => "Breakfast menu"Response"
        names(rootNode) 
        rootNode[[1]][[1]]
        # How many restaurants have zipcode 21231?        
        zipcode <- xpathSApply(rootNode, "//zipcode", xmlValue)
        length(zipcode[zipcode == 21231]) # 127
        
# Question 5
# The American Community Survey distributes downloadable data about United States communities. 
# Download the 2006 microdata survey about housing for the state of Idaho using download.file() 
# Data source: https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv 
# using the fread() command load the data into an R object DT         
        fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
        download.file(fileUrl, destfile= "./idahohousing.csv")
        DT <- data.table(fread("./idahohousing.csv", sep = ",", header = TRUE ))
# WHat is the fastest way to calculate the average value of the variable pwgtp15 broken down by sex using the data.table package?
        head(DT,3)
        DT[, mean(pwgtp15), by=SEX]
