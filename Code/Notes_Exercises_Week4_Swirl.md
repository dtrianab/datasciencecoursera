Whenever you're working with a new dataset, the first thing you should do is look at it!

* What is the format of the data?
* What are the dimensions? 
* What are the variable names? 
* How are the variables stored? 
* Are there missing data? 
* Are there any flaws in the data?


`object.size(plants)` how much space the dataset is occupying in memory

`table(plants$Active_Growth_Period)`

 Let the value 0 represent tails and the value 1 represent heads. Use sample() to draw a sample of size 100 from the vector c(0,1), with replacement. Since the coin is unfair, we must attach specific probabilities to the values 0 (tails) and 1 (heads) with a fourth argument, prob = c(0.3, 0.7). Assign the result to a new variable called flips.
 
`sample(c(0,1), 100, replace = TRUE, prob = c(0.3, 0.7))` 



