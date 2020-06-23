# Notes for Exercises Part 1 in Swirl

This notes were written while doing the Swirl practice in R Studio. 

## 1: Basic Building Blocks 
 - `C()` Function stands for Concatenate or combine.
 - Scalar Operations with vectors modify all elements.
 - R simply performs the specified arithmetic operation (`+`, `-`, `*`, etc. element-by-element between two vertors. If the vectors are of different lengths, R 'recycles' the shorter vector until it is the same length as the longer vector.
 - 


## 2. Workspace and Files

R provides a common API (a common set of commands) for interacting with files.

Functions `list.files()` or `dir()` List all the files in your working directory

Argument list > `args(list.files)` 
```r
dir.create("testdir")
setwd("testdir")
file.create("mytest.R")
list.files()
> file.exists("mytest.R")
[1] TRUE

file.info("mytest.R")
         size isdir mode               mtime
mytest.R    0 FALSE  666 2020-06-08 11:45:23
                       ctime               atime
mytest.R 2020-06-08 11:45:23 2020-06-08 11:45:23
         exe
mytest.R  no

# You can use the $ operator --- e.g.,
# file.info("mytest.R")$mode --- to grab specific
# items.

# file.rename(from, to)
file.rename("mytest.R","mytest2.R")
file.copy("mytest2.R","mytest3.R")

#file.path to make a platform-independent pathname
file.path("mytest3.R")

dir.create(file.path('testdir2','testdir3'), recursive = TRUE)
```

## 3. Basic Building Blocks

?`:` Operator help in R
`:` <-> `seq()`

```R
seq(along.with = my_seq)
rep(0, times = 40)
rep(c(0,1,2), times=10)
rep(c(0,1,2), each=10)

```


## Pending
```r


## 4. Sequences of Numbers
## 5. Vectors
## 6. Missing Values
## 7. Subsetting Vectors
## 8. Matrices and Data Frames
```