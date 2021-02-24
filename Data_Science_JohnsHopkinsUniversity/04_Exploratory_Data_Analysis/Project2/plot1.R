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

# 1.
# The data that you will use for this assignment are for 1999, 2002, 2005, and 2008.
# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008?
# Using the base plotting system, make a plot showing the total PM2.5 emission from
# all sources for each of the years 1999, 2002, 2005, and 2008

#Sum all emission by year
EM_year<-tapply(NEI$Emissions,NEI$year, sum)

#Plot in bars
barplot(EM_year, main="Total emissions from PM2.5 in the United States from 1999 to 2008", xlab="Year")
