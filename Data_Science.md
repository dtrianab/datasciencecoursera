# Data Science Coursera (Johns Hopkins University) 

This file contains notes documented from the set of 9 sections included in this course. 

Similary the document 

## 1. The Data Scientist’s Toolbox


What is data? > (Cambrige Dictionary) Information, especially facts or numbers, collected to be examined and considered and used to help decision-making.

(Wikipedia) A set of values of qualitative or quantitative variables.

Tools for help: stackverflow, Cross Validated

### The Data Science Process

A question to be answered with data.
Define the question(s) to be answered.

Example of a post: https://hilaryparker.com/
https://github.com/hilaryparker/names

Interesting project for taking out information from video and making PDFs:
http://syntaxi.net/2013/01/20/storyboard/
https://github.com/markolson/storyboard

###  R
(the Comprehensive R Archive Network, or CRAN)[https://cran.r-project.org/]
Insert Chunk >> Ctrl + Alt + I
**bolt** 
*italics*

### Types of analysis

- Descriptive: Describe and summarize a set of data.
- Exploratory: Examine the data and find relationships (Correlation does not imply causation).
- Inferential: Use a relatively small sample of data to say something about the population at large.
- Predictive: Use current and historical data to make predictions about  future data.
- Causal: What happends to one variable when we manipulate another.
- Mechanistic: Understand exact changed in variables that lead to exact cha in another variables.



### Experimental Design 

Formulate your question > Design your experiment
Identify problems and source of error
Collect the data
Ellaborate the hypothesis 
Sample size?

Confounder Variables: Extraneous variable that may effect the relationship between the dependent and independent variables.

When the stakes are this high, experimental design is paramount.

### Replication

p-value >> This is a value that tells you the probability that the results of your experiment were observed by chance.

https://www.youtube.com/watch?v=UsU-O2Z1rAs

https://projects.fivethirtyeight.com/p-hacking/

### Big Data

 - Volume, Velocity, Variety
 - Unstructured -> Format that cna be analyzided 
 - Right data for the question?

 The combination of some data and an aching desire for an answer does not ensure that a reasonable answer can be extracted from a given body of data


## 2. R Programming


http://simplystatistics.org/ 

Not So Standard Deviations >> https://soundcloud.com/nssd-podcast
Set the working directory >> setwd("C://Users//DTriana//Google Drive//E-Learning//Coursera")
List files on directory >> dir() 
Call file with function >> source("mycode.R")
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

## 3. Getting and Cleaning Data

## 4. Exploratory Data Analysis

## 5. Reproducible Research

## 6. Statistical Inference

## 7. Regression Models

## 8. Practical Machine Learning

## 9. Developing Data Products

## 10. Data Science Capstone