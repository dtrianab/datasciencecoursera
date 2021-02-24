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


# 2.
#Have total emissions from PM2.5 decreased in the Baltimore City, Maryland
#(fips == "24510") from 1999 to 2008?
#Use the base plotting system to make a plot answering this question.
Balt_MA<-filter(NEI, NEI$fips=="24510")
EM_year_Balt<-tapply(Balt_MA$Emissions,Balt_MA$year, sum)
barplot(EM_year_Balt, main="Total emissions PM2.5 in Baltimore City, Maryland from 1999 to 2008", xlab="Year")

