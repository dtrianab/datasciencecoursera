# L2_Getting and Cleaning Data

## Week 1

### Raw and Processed Data

* Values quantitative or qualitative.
* Processed data
  - Ready for analysis
  - All steps should be recorded
* Tidy data
  - A code book describing each variable
  - An explicit and exact recipe you used to go from valueA > valueB
  - Each variable by Colomn
  - Observation by Row
  - Row at the top with variable names
  - Make variable names human readable
  - Save One file per table 
  - Info about variable (Units!)
  - The instruction list script(raw data > processed tidy data)

* Downloading files 
  - `setwd("./data")` Relative
  - `setwd("/users/userdir")` Absolute

```r
if(!file.exists("data")){
    dir.create("data")
}
```

`download.file()`

Pen baltimore > https://data.baltimorecity.gov/

`https` links may require `method = "curl"` in `download.file()` method.
Important to keep track of the day the data was download `dateDownLoaded <- date()`

`read.csv()`
`quote=""`You can tell R whether there are any quoted values.
`na.strings` set the character that represents a missing value.
`nrows` how many rows to read.
`skip` number of lines to skip before starting to read.


### Reading Excel

xlsx package: `read.xlsx()` `read.xlsx2()` `write.xlsx`
XLConnect: Package has more options for writing and manipulating

### XML
Extensible markup language
```xml
<section> </section>
<line-break />
<greeting> Heloo </greeting>
```


```r
library(XML)
fileUrl<-"http://example.com/xml/simple.xml"
doc<-xmlTreeParse(fileUrl, useInternal= TRUE)
rootNode<-xmlRoot(doc)
xlmName(rootNode)

#Access part of the XML
rootNode[[1]]

#First subcomponent 
rootNode[[1]][[1]]

#Programatically extract parts of the file 
xmlSapply(rootNode,xmlValue)
```
**Xpath Language**
`/node` Top level
`//node` Node at any level
`node[@attr-name]` Node with an attribute name
`node[@attr-name='bob']` Node with att-name='bob'

```r
# Get the items on the menu 
xpathApply(rootNode, "//name", xmlValue)

# Get price of items  
xpathSapply(rootNode, "//price", xmlValue)

# Extract content by attribute
xpathSapply(doc, "//lic@class='score'", xmlValue)
xpathSapply(doc, "//lic@class='team-name'", xmlValue)
```

### JSON - JavaScript Object Notation

Common for APIs

```r
#Reading data from JSON
library(jsonlite)
jsonData <- fromJSON("https://api.github.com/...")
names(jsonData)

#Export Json 
myjson <- toJSON(iris, pretty=TRUE)
```

### data.table
* Inherets from data.fram
* Faster than data frame at subsetting and updating
* Written in C
* Can be created jusk like data frame
* Subsetting as with data frame
* Subsetting columns is different
* Keys can be used to facilitate joins of tables

```r
#See all the data table
tables()

#Calculating values for variables with expressions
DT[, list(mean(x),sum(z))]

#Add new columns := 
DT[,w:=z^2] 

#multiple step function
DT[,m:={tmp <- (x+z); log2(tmp+)}]
DT[, a:= x>0] 

# .N 
set.seed(123)
x=c("a","b","c")
DT[, .N, by=x] #Count the number of times each letter appear

setkey(DT,x)
DT['a']

```
It can be set same keys in two datasets and `merge()` them
Fast Reading from disk `fread()` 
`melt()` `dcast()` What can you do with data frame  


### Reading from MySQL

Each table > dataframe
install MySQL

http://biostat.mc.vanderbilt.edu/wiki/Main/RMySQL
http://www.ahschulz.de/2013/07/23/installing-rmysql-under-windows/

```r
ucscDb <-dbConnect(MySQL, user="genome", host=)
result <-dbGetQuery...
dbDisconnect(ucscDb) # Should return TRUE

dbListFields(connection, "tabletoPoint") #Should return all names field
dbGetQuery(connection, "select count(*) from tabletoPoint") # Count the number of elements in the table

query<-dbSendQuery(connection, "select * from tabletoPoint where misMatches between 1 and 3")

affyMis <- fetch(query)

quantile(affyMis$missMatches)

```
* Dont forget to close the connection: `dbDisconnect(connection)`
* Use only select
* r-bloggers/mysql-and-r

### Reading from HDF5
* Used for storing large datasets
* Supports storing a range of data types
* Hierarchical data format

http://www.hdfgroup.com

```R
library(rhdf5)
created <- h5createFile("myhdf5file.h5")
h5createGroup("example.h5","foo")
h5createGroup("example.h5","baa")
h5write(A,"file.h5", "foo/A")
h5write(c(12,13,14), "example.h5","foo/A", index = list(1:3,1)) # Writing and reading chunks 
```

### Reading from The Web

* Getting data off webpages - `readLines()`
* Parsing with XML unsing internal nodes 
* GET from httr package `html2<-GET(url)` 

`content(html2,as="text")`

* Accessing websites with passwords
  `GET( url,authenticate("user","passswd"))` 

  using handles google<-handle("http://google.com")


  ### Reading from API - Application Programming interfaces

```r
  myapp= oauth_app("twitter", keys="yourConsumerKeyhere", secret="")
  sign = sign_oauth1.0(myapp, token="mytoken", token_secret="my tokenSecret")
  homeTL=GET("https://api.twitter.com/1.1/statuses/hometimeline.json", sig)
  json1=content(homeTL)
  json2=jsonlite::fromJSON(toJSON(json1))
´´´ 

httr allows GET, POST, PUT, DELETE
Examples at > httr demos

### Reading from another sources

jpeg, readbitmap, png
GIS data
mp3

## Week 3

### Subsetting, Ordering 
`plyr > arrange(X, desc(var1))`

make table > `table(dt$var, useNA="ifany")`
Cros tabs > `xtabs(Freq ~ Gender + Admit, data=DF)`
`xtabs(breaks ~ ., data=warpbreaks)`
flatetable > ftable(xt)
`ifelse()` > Conditional Element Selection
`cut(var, breaks=quantile(var2))` Convert Numeric to Factor

> dacast() > wide reshaping tool

## dplyr package
* select
* filter
* arrange
* rename
* mutate
* summarise/summarize

Fixing character vectors > tolower(), toupper()


