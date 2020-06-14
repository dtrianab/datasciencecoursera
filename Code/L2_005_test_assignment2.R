#Programming Assignment 2: Lexical Scoping

#Functions file "cachematrix.R" must be on the same directory of this file:
source("cachematrix.R")
library(matlib)


#Test list of squared matrices with random values
list_mat<-rep(
        lapply(rep(2:6, each = 6, times = 6),
               new_mat<-function(k){q<-array(runif(k^2),c(k,k))}),
        each=6,times=6)
res_cache<-list() #Result of inverses by using cache

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

#Performance > Calculate Time reduced 
print(paste("Number of Inverses correctly calculated =",sum(inv_ok)))
print(paste("Inverse cal. time without cache = ",t))
print(paste("Inverse cal. time with Cache= ",t_cache))
print(paste("Time Reduced with Cache:",t-t_cache))
