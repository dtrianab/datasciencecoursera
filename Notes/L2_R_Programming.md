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

## Functions

na.rm =TRUE/FALSE 

