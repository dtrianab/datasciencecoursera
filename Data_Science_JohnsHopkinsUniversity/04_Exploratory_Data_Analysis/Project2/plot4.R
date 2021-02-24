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



# 4.
#Across the United States, how have emissions from coal combustion-related sources changed 
#from 1999-2008?

# Only Sector having Coal Combustion
Comb_lbl<-grep("Comb",SCC$EI.Sector, ignore.case=TRUE) 
Coal_lbl<-grep("Coal",SCC$EI.Sector, ignore.case=TRUE)

#labels complying 
levels(factor(SCC[intersect(Comb_lbl, Coal_lbl),"EI.Sector"]))

PM_US_Coal<-NEI[NEI$SCC==SCC[intersect(Comb_lbl, Coal_lbl),"SCC"],]

EM_year_Coal<-tapply(PM_US_Coal$Emissions,PM_US_Coal$year, sum)
#Plot in bars
barplot(EM_year_Coal, main="Emissions from coal combustion-related sources from 1999 to 2008", xlab="Year")

