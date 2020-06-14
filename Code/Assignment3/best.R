# The function reads the outcome-of-care-measures.csv file and returns 
# a character vector with the name of the hospital that has the best 
# (i.e. lowest) 30-day mortality for the specified outcome in that state.

The hospital name is the name provided in the Hospital.Name variable

Hospitals that do not have data on a particularoutcome should be excluded
from the set of hospitals when deciding the rankings.

Inputs:
1. the 2-character abbreviated name of a state 
2. the 2-character abbreviated name of a state an outcome name
The outcomes canbe one of:
        “heart attack”, “heart failure”, or “pneumonia”

The outcomes can be one of “heart attack”, “heart failure”, or “pneumonia”.

Handling ties. If there is a tie for the best hospital for a given outcome,
then the hospital names should be sorted in alphabetical order and the first
hospital in that set should be chosen (i.e. if hospitals “b”, “c”, and 
“f” are tied for best, then hospital “b” should be returned).

The function should check the validity of its arguments. If an invalid state value is passed to best, the
function should throw an error via the stop function with the exact message “invalid state”. If an invalid
outcome value is passed to best, the function should throw an error via the stop function with the exact
message “invalid outcome”.

best <- function(state, outcome){
        ## Read outcome data
        outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        
        ## Check that state and outcome are valid
        ## Return hospital name in that state with lowest 30-day death
        ## rate
}