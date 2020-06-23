rankall <- function(outcome, num = "best") {
        
        #browser()
        ## Read outcome data
        outcome_care <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        
        ## Check that state and outcome are valid
        if( (outcome!="heart attack") && (outcome!="heart failure") && (outcome != "pneumonia") ){
                print(paste("Error in best(",dQuote(state),",", dQuote(outcome),"): invalid outcome", sep = ""))
                return(invisible(NULL))
        }
        if(num!="best" && num!="worst" && !is.numeric(num)){
                print(paste("Error in best(",dQuote(state),",", dQuote(outcome),",",dQuote(num),"): invalid outcome", sep = ""))
                return(invisible(NULL))
        }
        
        #Outcome to slice dataset
        var<-11
        if(outcome=="heart failure"){var <- 17}
        if(outcome=="pneumonia"){ var <- 23}
        
        #Convert variable char into numeric
        outcome_care[, var] <- as.numeric(outcome_care[, var])
        
        # New dataframe with [rates, Hospital name, state]
        q<-data.frame(outcome_care[, var],outcome_care[,2], outcome_care[,7])
        names(q)=c("rates", "Hospital", "state")
        
        #Order by state, then by rates
        sorted_data<-q[with(q,order(q$rates, q$Hospital)),]
        
        #Best value, ranked as 1
        if(num=="best"){ num=1 }
        
        
        #Output dataset
        states_dt<-levels(factor(q$state))
        out_name<-rep(NA,length(states_dt))
        
        out_df<-data.frame(states_dt, out_name, states_dt )
        names(out_df)=c("state", "hospital", "state")
        
        ## For each state, find the hospital of the given rank
        for(st in states_dt){
                #Slice sorted data by state
                j<-sorted_data[sorted_data$state==st,]
                 #if rank requested does exist in sliced data 
                
                if(num=="worst"){
                        worst_rate_pos<-which(j$rates==max( j$rates, na.rm = TRUE))
                        out_df[out_df$state==st,"hospital"]<-as.character(j[worst_rate_pos[1],"Hospital"])        
                }
                
                if(num<=sum(!is.na(j$rates))){
                #Check if there is ties
                #Sort hospital names ties and pick up the fist alphabetically
                #Hospital name saved in output dataframe
                        out_df[out_df$state==st,"hospital"]<-as.character(j[num,"Hospital"])        
                }
        }

        ## Return a data frame with the hospital names and the
        ## (abbreviated) state name
        out_df[with(out_df,order(out_df$state)),]
}