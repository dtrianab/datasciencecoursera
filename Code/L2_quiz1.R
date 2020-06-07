#Quiz #1 --R Programming 

setwd("C://Users//DTriana//Google Drive//E-Learning//Coursera//code")
file="hw1_data.csv"
dat <-read.csv(file, header = TRUE)
str(dat)
#First Two Elements 

#Fisrt 2 rows
head(dat,2)

#Last 2 rows
tail(dat,2)

#Value of 47th Row
dat$Ozone[47]

#All NA in Ozone
sum(is.na(dat$Ozone))

# Mean of Ozone
mean(dat$Ozone[!is.na(dat$Ozone)])

#Values of subset
dat$Ozone[!is.na(dat$Ozone) & dat$Ozone >31]
dat$Temp[!is.na(dat$Temp) & dat$Temp >90]

#mean of selected subset
mean(dat$Solar.R[!is.na(dat$Ozone) & dat$Ozone >31 & !is.na(dat$Temp) & dat$Temp >90])

#Mean of temp for Month 6
mean(dat$Temp[dat$Month==6])

#Max of Ozono in May
max(dat$Ozone[!is.na(dat$Ozone) & dat$Month==5])