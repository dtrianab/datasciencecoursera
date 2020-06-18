# The function reads the outcome-of-care-measures.csv file and returns 
# a character vector with the name of the hospital that has the best 
# (i.e. lowest) 30-day mortality for the specified outcome in that state.

# The hospital name is the name provided in the Hospital.Name variable
# 
# Hospitals that do not have data on a particular outcome should be excluded
# from the set of hospitals when deciding the rankings.
# 
# Inputs:
# 1. the 2-character abbreviated name of a state 
# 2. the 2-character abbreviated name of a state an outcome name
# 
# The outcomes can be one of:
#         “heart attack”, “heart failure”, or “pneumonia”
# 
# The outcomes can be one of “heart attack”, “heart failure”, or “pneumonia”.
# 
# Handling ties. If there is a tie for the best hospital for a given outcome,
# then the hospital names should be sorted in alphabetical order and the first
# hospital in that set should be chosen (i.e. if hospitals “b”, “c”, and 
# “f” are tied for best, then hospital “b” should be returned).
# 
# The function should check the validity of its arguments. If an invalid state value is passed to best, the
# function should throw an error via the stop function with the exact message “invalid state”. If an invalid
# outcome value is passed to best, the function should throw an error via the stop function with the exact
# message “invalid outcome”.

best <- function(state, outcome){
        
        output<-""
        
        ## Read outcome data
        outcome_care <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        
        ## Check that state and outcome are valid
        if(!state %in% state.abb){
                print(paste("Error in best(",dQuote(state),",",dQuote(outcome),"): invalid state", sep = ""), quote = FALSE)
                return(invisible(NULL))
        }
        if( (outcome!="heart attack") && (outcome!="heart failure") && (outcome != "pneumonia") ){
                print(paste("Error in best(",dQuote(state),",", dQuote(outcome),"): invalid outcome", sep = ""))
                return(invisible(NULL))
        }
        
        #Outcome to slice dataset
        var<-11
        if(outcome=="heart failure"){var <- 17}
        if(outcome=="pneumonia"){ var <- 23}
        
        #Convert variable char into numeric
        outcome_care[, var] <- as.numeric(outcome_care[, var])
        
        #Hospital Names for the given state
        names_hospital_st<-outcome_care[outcome_care[7]==state,2]
        
        #Ranks for mortality rate in the given outcome, ties kept
        rk<-rank(outcome_care[outcome_care[7]==state,var], ties.method = "min")
        
        #All values at first rank
        val<-which(rk==1)
        
        if(length(val)>1){
                #ties
                print("ties=")
                print(length(val))
                output<-sort(names_hospital_st[val])[1]
                
        } else {
                #no ties
                output<-names_hospital_st[val]
        }
        output
}