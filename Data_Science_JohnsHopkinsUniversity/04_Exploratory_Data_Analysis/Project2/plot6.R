library(ggplot2)
library(dplyr)

## This first line will likely take a few seconds. Be patient!
setwd("C:/Users/Diego/Documents/GitHub/datasciencecoursera/Data_Science_JohnsHopkinsUniversity/04_Exploratory_Data_Analysis/Project2")

#National Emissions Inventory 
NEI <- readRDS("summarySCC_PM25.rds")

#Source Classification Code Table (
SCC <- readRDS("Source_Classification_Code.rds")


#6

#Compare emissions from motor vehicle sources in Baltimore City with emissions 
#from motor vehicle sources in Los Angeles County, California (fips == "06037"). 
#Which city has seen greater changes over time in motor vehicle emissions?

LA<-NEI[NEI$fips=="06037",]
LA$City="Baltimore"

Balt<-NEI[NEI$fips=="24510",]
Balt$City="Los Angeles"

Cities=rbind(LA, Balt)

LA_MA_ON_ROAD<-filter(Cities, Cities$type=="ON-ROAD")

EM_BA_LA<-aggregate(Emissions ~ year + City, LA_MA_ON_ROAD, sum)

ggplot(
  EM_BA_LA,
  aes(x=year, y=Emissions, color=City))+
  labs(x ="Year", y="PM2.5 Emissions", title = "Vehicle Emissions from 1999-2008")+
  geom_point()+
  geom_line()

