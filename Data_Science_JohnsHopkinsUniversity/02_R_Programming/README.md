# 2. R Programming

## Week 1


http://simplystatistics.org/ 

 [Not So Standard Deviations](https://soundcloud.com/nssd-podcast)

```r
#Set the working directory
setwd("C://Users//DTriana//Google Drive//E-Learning//Coursera")
```
List files on directory >> `dir()` 
Call file with function >> `source("mycode.R")`

S -> R Jhon Chambers and Others at Bell Labs

Drawbacks:
 - 40 year old technically
 - Little bulit in support for 3D graphics
 - Functionalaty based on consumer demand
 - Objects stored in physical memory

Some references:

Chambers >> data analysis and programming the data are both published by Springer
Bill Venables and Brian Ripley >> One is called Modern Applied Statistics with S, and another one's called S Programing.

Paul Murrell >> who designed the R graphic system has written a book called R Graphics and actually it's currently in its second edition right now. 

Springer, the publisher Springer has a series of books called Use R, which is, which is a, a lot of very, kind of relatively short books

Nice Post: 
Describe the Goal
Explicit question 
Minimum amount of information
Be Courteous
Follow up with solution

### Data Types 
Everything in R is an object.

Atomic classses of object: Character, numeric, integer, complex, logical.

Vector > Only of the same class.
List > Vector > Each element can be of different class. ( vector() function can create empty vectors. Also `c()` function ).

Inf > infinity can be used for calculations.
`attributes()` >set or modify attributes from an object.

Mixed Objects (``` y <- c(1.7,"a") ```)? > least type is used for all vector.

Forcing objects into particular class >

```r
as.numeric(x)
as.logical(x)
as.complex(x)
```

Nonsensical coercion results in NAs.
Lists contain elements of different class. 

Matrix
```r
 m<-1:10
 m <- matrix(1:6, nrow=2, ncol=3)
 dim(m) <- c(2,5)
```
Another way, colomn binding or row binding with `cbind()` and `rbind()`.

### Factors
Ordered | unordered

Factor level are ordered alphabetically. It can be explicitly set.

```r
> x <- factor(c("yes","yes","no","yes","no"))
> x
[1] yes yes no  yes no 
Levels: no yes
> table(x)
x
 no yes 
  2   3 
```

### Missing values

*NA* can be int NA, character NA, etc.

```r
#Used to test objects if they are NA
is.na() 

#Used to test objects if they are NaN
is.nan()

#Missing values
complete.cases(Var)

```
### Data Frames

Tabular data > Different classes of objects. All objects can have names. matrix > dimnames()

`colClasess` argument may increase the time for reading large files. if specified, it could speed up the reading process.

```r
#Reading Tabular data
row.names
read.table() #def separator  --space
read.csv()   #def separator  --comma

#Can be converted to a Matrix
data.matrix()

#Read lines of a text file
readLines

#Reading in R code files (Inverse of dump)
source

#Readin in R code files (Inverse of dput)
dget

#Reading in saved workspaces
load

#Reading objects in binary form
unserialize 

```

In dumping and dputingm, resulting textual format is edit-table. `dget` usedonly on a single R object. `dump` can be used on multiple objects.

Coonection interfaces: `file`, `gzfile` (zip), `bzfile`(bzip2), `url` webpage.

Subsets:
 - **[** > Returns an object of the same class as the original. It can be used to select more than one.

 - **[[** > Extracts elements of a list or a dtaframe (Single element).

 - **&** Extracts element by name, Only literal names, no variables can pass over the name.

`%*%` > True matrix multiplication


## Week 2

Tutorial:
https://github.com/rdpeng/practice_assignment/blob/master/practice_assignment.rmd

### Control structures

`repeat` execute infinite loop, `break` stops it
`next` skip an iteration of a loop

Sequence Generation > `seq_along(x)`

### Functions

* na.rm =TRUE/FALSE > Skip NA in calculations
* `...` Argument for *Variable number of arguments*. Often used when extending another function. Arguments can then be passed to methods.
* `Lexical Scoping` or `static scoping` How to use the search list to bind a value to a symbol
* Typically a function is defined in the global environment.
* `ls(environment(funct))` -> Whats in a function environment. `get()`

Optimization functions `optim` and `nlm`.

 - Text editor
 - Indenting (Space over to the right blocks). Indents of 4 Spaces; 8 Spaces ideal.
 - Limit the length of individual functions
 
 ## Dates and clasess

 `Datas` class represents dates.
 Time represented by `POSIXct` `POSIXlt` 

`as.Date("1970-01-01")`

`POSIXct` - Very large integer
`POSIXlt` - List, stores richer information

`weekdays`, `months`, `quarters` (Q1,Q2,Q3,Q4)

`Sys.time()` > Actual time in the system
`strptime` Formating dates <-> strings 


## Week 3

### Loop Functions and Debugging

* Loop functions: lapply, apply, tapply, split, mapply
* Debugger, Parts 1-3

Define an anonymous function and describe its use in loop functions [see lapply]
Describe how to start the R debugger for an arbitrary R function
Describe what the traceback() function does and what is the function call stack

`lapply` : Loop over a list and evaluate a function on each element
`sapply`: Simplified lapply
`apply`: Apply function over the margins
`tpply`: Apply function over subsets of a vector
`mapply`: Multivariete version of lapply
`split`: Aux function, in conjunction with lapply

col/row sums and means: `rowSums()`, `rowMeans()`, `colSums`,`colMeans()`.

`mapply` is usefule for functions that accepts single inputs and vectorize it.
`tpply` Over a Ragged Array (Simplfy = FALSE) -> list 
`split` Divide into Groups and Reassemble, `drop=TRUE` ->Empty levels can be dropped
`interaction()` Compute Factor Interactions

### Debugging Tools - Diagnosing the Problem

Indications something is not right > *message* | *warining* | *error* | *condition*
`invisible(x)` Change the Print Mode to Invisible

`traceback()` prints out the function call stack after an error occurs; does nothing if no error.

`debug()` flags a function for debug mode, allows to step through execution.

`browser()` suspends the execution of a function whenever it is called and puts the function in debug mode

`trace()` allows you to insert  debugging code into a function

`recover()` modify the error behavior so you can browser the function call stack
 
#### Further Reading

*The Split-Apply-Combine Strategy for Data Analysis* Hadley Wickham's Journal of Statistical Software


## Week 4

`str()` display internal structure.

### Simulation

`rnorm()` Random normal variates with a given mean and standard deviation.
`dnorm()` Evaluate the normal probability density (with a given mean/SD).
`pnorm()` Cumulative distribution function for normal distribution
`rpois()` random Poison variates

**d** for density 
**r** for random
**p** for cumulative distribution
**q** for quantile function

`lower.tail=TRUE`if false it evaluates the upper tail.

`set.seed()`
`rbinom()` Random Binary normal distribution

### Random Sampling
`sample()` Random samples from vector
* `replace=TRUE` Sample with replacement

## Tools for optimizing
Sytematic way of examinate how much time is spend in different part od a program.

* Design first
* Premature optimization is the root of all evil
* Measure (Collect data), dont guess

system.time() > Give the amount of time needed to execute an expression

Returns object `proc_time`
 - **user time**: time charged to the CPU for this expression
 - **elapsed time** "wall clock" time


### R Profiler

`Rprof()` keeps track of the funtion call stack at regularly sampled invervals and tabulates how much time is spend in each function
`summaryRprof()` 

* Default sampling interval is 0.02 Seconds
* If the code runs very qickly, the profiler is not useful.

**by.total**  Time spent in function and callees.
**by.self** How much time is spend in a function alone with all its sublevels

* sample.interval
* sampling.time

