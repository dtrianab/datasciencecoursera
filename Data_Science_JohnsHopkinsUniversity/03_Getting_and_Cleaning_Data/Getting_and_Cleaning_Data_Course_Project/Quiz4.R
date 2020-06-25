# Week 4 Quiz

# 1.Question 1 The American Community Survey distributes downloadable data about United States communities. Download the 2006 microdata survey about housing for the state of Idaho using download.file() from here:
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", "2006surey.csv")
data1<- read.csv("2006surey.csv")
#cols_wgtp<-grep(pattern = "[wgtp]", names(data))
q<-strsplit(names(data1), "wgtp")
q[[123]]


#2. Load the Gross Domestic Product data for the 190 ranked countries in this data set:

FGDP <- data.table::fread('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv'
                          , skip=4
                          , nrows = 190
                          , select = c(1, 2, 4, 5)
                          , col.names=c("CountryCode", "Rank", "Economy", "Total")
)

# Remove the commas from the GDP numbers 
# in millions of dollars and average them.
# What is the average?

library(readr)
u<-parse_number(FGDP$Total)
mean(u, na.rm = TRUE)

FEDSTATS <- data.table::fread('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv'
                          #, skip=0
                          #, nrows = 190
                          #, select = c(1, 2, 4, 5)
                          #, col.names=c("CountryCode", "Rank", "Economy", "Total")
)
mergedDT <- merge(FGDP, FEDSTATS, by = 'CountryCode')
notes<-mergedDT[,`Special Notes`]
june_notes<-grepl("[Jj]une",mergedDT[,`Special Notes`])
notes[june_notes]

sum(stringr::str_extract_all(notes, "Fiscal year end: June", simplify = TRUE)=="Fiscal year end: June")



library(quantmod)
library(lubridate)
install.packages("quantmod")
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)

p<-chron::years(sampleTimes)
sum(p==2012)

p2<-chron::years(sampleTimes[wday(sampleTimes, label = TRUE)=="Mon"])
sum(p2==2012)
