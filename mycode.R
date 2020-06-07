myfunc <- function(){

  h=1.63
  m=64
  IMC=m/h^2 
  IMC
    
}

second <- function(x){
  x+rnorm(x)
}

setwd("C://Users//DTriana//Google Drive//E-Learning//Coursera")
#dir()
source("mycode.R")

file="hw1_data.csv"
dat <-read.csv(file, header = TRUE)

head(dat,2)
tail(dat,2)


q1<-dat$Ozone[complete.cases(dat$Ozone)==TRUE] > 31
q2<-dat$Temp[complete.cases(dat$Temp)==TRUE] < 90

d2<-dat[q1|q2,]
d2$Solar.R
mean(d2$Solar.R[complete.cases(d2$Solar.R)==TRUE] )


