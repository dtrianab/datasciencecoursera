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

# 2.
#Have total emissions from PM2.5 decreased in the Baltimore City, Maryland
#(fips == "24510") from 1999 to 2008?
#Use the base plotting system to make a plot answering this question.
Balt_MA<-filter(NEI, NEI$fips=="24510")
EM_year_Balt<-tapply(Balt_MA$Emissions,Balt_MA$year, sum)
barplot(EM_year_Balt, main="Total emissions PM2.5 in Baltimore City, Maryland from 1999 to 2008", xlab="Year")


# 3.
#Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
#which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? Which have seen increases in emissions from 1999-2008? 
#Use the ggplot2 plotting system to make a plot answer this question.

#Type to Factor variable
Balt_MA$type<-(factor(Balt_MA$type))

#Sum function applied by year and type on emissions
Balt_MA_Year_Type<-aggregate(Emissions ~ year + type, Balt_MA, sum)

#Plot
ggplot(
  Balt_MA_Year_Type,
  aes(x=year, y=Emissions, color=type))+
  geom_point()+
  labs(x ="Year", y="PM2.5 Emissions", title = "Emissions in Baltimore by Type from 1999-2008")+
  geom_line()


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


# 5.
# How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?


#????????????
Vehicle_lbl<-SCC$EI.Sector[grep("vehicle",SCC$EI.Sector, ignore.case=TRUE)]

Vehicle_SCC<-SCC[SCC&EI.Sector==Vehicle_lbl,"SCC"]



NEI_BA<-NEI[NEI$fips=="24510",]
NEI_BA_Vehicle<-NEI_BA[NEI_BA$SCC==Vehicle_SCC,]



EM_year_Balt_Vehicle<-tapply(Balt_MA_Vehicle$Emissions,Balt_MA_Vehicle$year, sum)
barplot(EM_year_Balt_Vehicle, main="Total emissions PM2.5 in Baltimore City, Maryland from 1999 to 2008", xlab="Year")

