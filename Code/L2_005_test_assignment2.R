#Programming Assignment 2: Lexical Scoping

#Functions must be on the same directory of this file:
source("makeCacheMatrix.R")
source("cacheSolve.R")
library(matlib)

#Test list of squared matrices with random values
list_mat<-rep(
        lapply(rep(2:6, each = 6, times = 6),
        new_mat<-function(k){q<-array(runif(k^2),c(k,k))}),
        each=6,times=6)

#Result of inverses by using cache
res_cache<-list()

#Block to measure calculations with cache >> 
#---------------------------------------------------
start_time_cache <- Sys.time()
x<-makeCacheMatrix(list_mat[[1]])

for(i in 1:length(list_mat)){
        #Check if stored 
        if(!identical(x$get(),list_mat[[i]])){
                        x<-makeCacheMatrix(list_mat[[i]])
                }
        res_cache[[i]]<-cacheSolve(x)
        #print(cacheSolve(x))
}
end_time_cache <- Sys.time()
t_cache<-end_time_cache-start_time_cache
print(paste("Roughly time execution of inverse calculatio = ",t_cache))
#---------------------------------------------------





#Usual calculation execution time without cache 
#---------------------------------------------------
res<-list()
start_time <- Sys.time()
for(i in 1:length(list_mat)){ res[[i]]<-inv(list_mat[[i]]) }
end_time <- Sys.time()
t<-end_time-start_time
#---------------------------------------------------

#Test if inverse calculated properly
inv_ok<-sum(round(list_mat[[i]]%*%res[[1]]))==ncol(list_mat[[1]])
for(i in 2:length(list_mat)){inv_ok<-c(inv_ok, sum(round(list_mat[[i]]%*%res[[i]]))==ncol(list_mat[[i]]))}
print(paste("Nuber of Inverse correctly calculated =",sum(inv_ok)))

#Calculate Time reduced 
print(paste("Time Reduced with Cache:",t-t_cache))
