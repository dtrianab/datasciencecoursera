library(ggplot2)
library(dplyr)

## This first line will likely take a few seconds. Be patient!
setwd("C:/Users/Diego/Documents/GitHub/datasciencecoursera/Data_Science_JohnsHopkinsUniversity/04_Exploratory_Data_Analysis/Project2")

#National Emissions Inventory 
NEI <- readRDS("summarySCC_PM25.rds")
summary(NEI) 
str(NEI)
head(NEI)

#Source Classification Code Table (
SCC <- readRDS("Source_Classification_Code.rds")
summary(SCC) 
str(SCC)
head(SCC)



# 5.
# How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?
Balt_MA<-filter(NEI, NEI$fips=="24510")
Balt_MA_ON<-filter(Balt_MA, Balt_MA$type=="ON-ROAD")

EM_year_Balt<-tapply(Balt_MA_ON$Emissions,Balt_MA_ON$year, sum)
barplot(EM_year_Balt, main="Vehicle emissions PM2.5 in Baltimore from 1999 to 2008", xlab="Year")
