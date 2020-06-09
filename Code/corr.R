corr <- function(directory, threshold=0){
  id=1:332
  com<-rep(0, length(id))
  for(i in 1:length(id)){
    #File names with 0/00 at the begining
    a <- ""
    if(id[i]<10){ a<-"00" }
    if(id[i]>=10 && id[i]<100){ a<-"0" }
    
    file_in=paste(directory,"/",a,id[i],".csv", sep = "")
    
    #Verify if file exists
    if(file.exists(file_in)){
      #Read dataset
      dat=read.csv(file_in,header = TRUE)
      #Extrac NA from variables into lists
      var1<-is.na(dat$sulfate)
      var2<-is.na(dat$nitrate)
      var3<-(!var1)&(!var2)
      com[i]<-sum(var3)
      
      if(com[i]>threshold){
        print("eee")

      }
    }
  }
  out<-data.frame("id"=id, "nobs"=com)
  out
  
}