# The function reads the outcome-of-care-measures.csv le and returns a character vector with the name
# of the hospital that has the ranking specied by the num argument.

rankhospital <- function(state_in, outcome, num = "best") {
        #browser()
        
        output<-""
        ## Read outcome data
        outcome_care <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        
        ## Check that state and outcome are valid
        if(!state_in %in% state.abb){
                print(paste("Error in best(",dQuote(state_in),",",dQuote(outcome),"): invalid state", sep = ""), quote = FALSE)
                return(invisible(NULL))
        }
        if( (outcome!="heart attack") && (outcome!="heart failure") && (outcome != "pneumonia") ){
                print(paste("Error in best(",dQuote(state_in),",", dQuote(outcome),"): invalid outcome", sep = ""))
                return(invisible(NULL))
        }
        if(num!="best" && num!="worst" && !is.numeric(num)){
                print(paste("Error in best(",dQuote(state_in),",", dQuote(outcome),",",dQuote(num),"): invalid outcome", sep = ""))
                return(invisible(NULL))
        }

        #Outcome to slice dataset
        var<-11
        if(outcome=="heart failure"){var <- 17}
        if(outcome=="pneumonia"){ var <- 23}
        
        ## Return hospital name in that state with the given rank

        #Convert variable char into numeric
        outcome_care[, var] <- as.numeric(outcome_care[, var])
        
        #Hospital Names for the given state
        names_hospital_st<-outcome_care[outcome_care[7]==state_in,2]
        
        if( is.numeric(num) && (num >sum(sum(!is.na(outcome_care[outcome_care$State==state_in, var]))))){
                return(NA)
        }
                
        
        #Ranks for mortality rate in the given outcome, ties kept
        rk<-rank(outcome_care[outcome_care[7]==state_in,var], ties.method = "min")
        
        #Rates
        rt<-outcome_care[outcome_care[7]==state_in,var]
        
        # best by default
        val<-which(rk==1)
        
        if(num=="worst"){ val<-which(rt==max(rt, na.rm = TRUE)) }
        
        if(is.numeric(num)){ val<-which(rk<=num) }
        
        #multiple outcomes in the rate rank
        if(length(val)>1){
                #ties
                q<-data.frame(names_hospital_st[val],rk[val], rt[val])
                sorted_data<-q[with(q, order(q$rt.val., q$names_hospital_st.val.)),]
                
                if(is.numeric(num)){
                        output<-sorted_data$names_hospital_st.val.[num]
                        
                }
                
                if(num=="best" | num=="worst"){
                        output<-sorted_data$names_hospital_st.val.[1]
                }
                print(sorted_data)
                
                
        } else {
                #no ties, unique output
                output<-names_hospital_st[val]
        }
        ## 30-day death rate
        as.character(output[1])
}