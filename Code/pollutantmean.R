pollutantmean <- function(directory, pollutant, id=1:332){
  
  if(pollutant=="nitrate" | pollutant=="sulfate"){
  
    #Create list of zeros as long as id
  means<-rep(0, length(id))
  w<-rep(0, length(id))
  
  files<-rep("", length(id))
  
  for(i in 1:length(id)){
    
    #File names with 0/00 at the begining
    a <- ""
    if(id[i]<10){ a<-"00" }
    if(id[i]>=10 && id[i]<100){ a<-"0" }
    
    file_in=paste(directory,"/",a,id[i],".csv", sep = "")
    
    #Verify if file exists
    if(file.exists(file_in)){
      files[i]<-file_in
    #Read dataset
    dat=read.csv(file_in,header = TRUE)
    
    #Extrac variable into a list
    var=dat[[pollutant]]
    
    
    #Find NAs in Variable
    NA_var<-c(is.na(dat[[pollutant]]))
      
      #if(sum(NA_var)==0){
      # means[i]<-0
       # else {
        means[i]<-mean(var, na.rm = TRUE)
        w[i]<-sum(!NA_var)
      #}
    
    } else{
      print(paste("Directory not found:",file_in, sep = " "))
    }
    
  }
  weighted.mean(means, w)
  #files
  
  }else{
    print("Variable not present, use either 'nitrate' or 'sulfate' as input for pollutant paremeter")
  }
}