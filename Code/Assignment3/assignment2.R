source("best.R")

# 1 Plot the 30-day mortality rates for heart attack
outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
head(outcome)
str(outcome)

outcome[, 11] <- as.numeric(outcome[, 11])
hist(outcome[, 11])

# 2  Finding the best hospital in a state

source("best.R")
best("TX","heart attack")
best("TX", "heart failure")
best("MD", "heart attack")
best("MD", "pneumonia")

best("BB", "heart attack")
best("NY", "hert attack")

# 3 Ranking hospitals by outcome in a state
source("rankhospital.R")
rankhospital("TX", "heart failure",10)
rankhospital("MD", "heart attack", "worst")
rankhospital("MN", "heart attack",5000)


# 4 Ranking hospitals in all states
source("rankall.R")
head(rankall("heart attack", 20), 10)
tail(rankall("pneumonia", "worst"), 3)
tail(rankall("heart failure"), 10)

