library(ggplot2)
library(dplyr)

## This first line will likely take a few seconds. Be patient!
setwd("C:/Users/Diego/Documents/GitHub/datasciencecoursera/Data_Science_JohnsHopkinsUniversity/04_Exploratory_Data_Analysis/Project2")

#National Emissions Inventory 
NEI <- readRDS("summarySCC_PM25.rds")

#Source Classification Code Table (
SCC <- readRDS("Source_Classification_Code.rds")



# 3.
#Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
#which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? Which have seen increases in emissions from 1999-2008? 
#Use the ggplot2 plotting system to make a plot answer this question.

Balt_MA<-filter(NEI, NEI$fips=="24510")

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

