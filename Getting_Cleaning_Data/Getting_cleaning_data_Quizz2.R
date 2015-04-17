# Question 1
# Register an application with the Github API here https://github.com/settings/applications
# Client ID 2bbc4cbda8b4800c783f
# Client Secret 84fc2b097c04cc6d440bad8e1f289cae558187a3
#  What time was created the datasharing repo of the instructor https://api.github.com/users/jtleek/repos
# tutorial: https://github.com/hadley/httr/blob/master/demo/oauth2-github.r
        # install.packages("httr")
        # library(httr)
        # install.packages("jsonlite")
        # library(jsonlite)
        myapp <- oauth_endpoints("github")
        myapp <- oauth_app("github", "84fc2b097c04cc6d440bad8e1f289cae558187a3")
        github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)
        
        # 1. Find OAuth settings for github:
        #    http://developer.github.com/v3/oauth/
        oauth_endpoints("github")
        
        # 2. Register an application at https://github.com/settings/applications;
        #    Use any URL you would like for the homepage URL (http://github.com is fine)
        #    and http://localhost:1410 as the callback url
        #    Insert your client ID and secret below - if secret is omitted, it will
        #    look it up in the GITHUB_CONSUMER_SECRET environmental variable.
        myapp <- oauth_app("github", 
                           key = "2bbc4cbda8b4800c783f",
                           secret = "84fc2b097c04cc6d440bad8e1f289cae558187a3")

        # 3. Get OAuth credentials
        github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)
 
        # 4. Use API
        gtoken <- config(token = github_token)
        # repoData <- GET("https://api.github.com/repos/jtleek/datasharing", gtoken)
        repoData <- GET("https://api.github.com/users/jtleek/repos", gtoken)
        json1 <- content(repoData)
        json2 <- jsonlite::fromJSON(toJSON(json1))
        json2[1,1:4]
        
# Question 2
# The sqldf package allows for execution of SQL commands on R data frames
# We will use the sqldf package to practice the queries we might send with the dbSendQuery command in RMySQL.
        install.packages("sqldf")
        library(gsubfn)
        library(proto)
        library(tcltk)
        library(DBI)
        library(RSQLite)
        library(sqldf)                
        ?sqldf
# Download the American Community Survey data and load it into an R object called acs
        fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
        download.file (fileUrl, destfile = "./americancommunitysurvey.csv") 
        dateDownloaded <- date() # set date of the download
        acs <- read.table("./americancommunitysurvey.csv", sep = ",", header = TRUE )
# What is the command that select only the data for the probability weights pwgtp1 with ages less than 50?
        sqldf("select pwgtp1 from acs where AGEP < 50")        
        
# Question 3
# what is the equivalent function to unique(acs$AGEP)
        dedupAGEP1 <- unique(acs$AGEP)
        length(dedupAGEP1)
        ?unique 
        # unique returns a vector, data frame or array like x but with duplicate elements/rows removed.
        dedupAGEP2 <- sqldf("select DISTINCT AGEP from acs")
        
# Question 4
# How many characters are in the 10th, 20th, 30th and 100th lines of HTML from this page: 
# http://biostat.jhsph.edu/~jleek/contact.html 
# Hint: nchar() function in R may be helpful
                # getting data off webpage - readLines()
        con <- url("http://biostat.jhsph.edu/~jleek/contact.html")
        htmlCode <- readLines(con)
        close(con)
        summary(htmlCode)
        ?nchar
        nchar(htmlCode)[c(10,20,30,100)] # [1] 45 31  7 25
        
# Question 5
# Read this data set into R and report the sum of the numbers in the fourth of the nine columns. 
# https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for 
# Original source of the data: http://www.cpc.ncep.noaa.gov/data/indices/wksst8110.for 
# Hint this is a fixed width file format
        ?read.fwf # Read a table of fixed width formatted data into a data.frame.
        fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for "
        download.file (fileUrl, destfile = "./testdata.csv") 
        dateDownload <- date() # set date of the download
        testData <- read.fwf("./testdata.csv", widths=c(12, 7,4, 9,4, 9,4, 9,4), skip = 4)
        head(testData)
        sum(testData[,4]) # [1] 32426.7