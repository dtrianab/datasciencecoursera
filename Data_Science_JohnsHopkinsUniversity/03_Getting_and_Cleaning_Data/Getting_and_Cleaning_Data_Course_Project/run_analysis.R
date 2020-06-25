# Read Files

library(data.table)
library(dplyr)

activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt", header = FALSE)
features <- read.table("./UCI HAR Dataset/features.txt", header = FALSE)

X_train <- fread("./UCI HAR Dataset/train/X_train.txt", header = FALSE)
Y_train <- fread("./UCI HAR Dataset/train/Y_train.txt", header = FALSE)
X_test <- fread("./UCI HAR Dataset/test/X_test.txt", header = FALSE)
Y_test <- fread("./UCI HAR Dataset/test/Y_test.txt", header = FALSE)

subject_train <- fread("./UCI HAR Dataset/train/subject_train.txt",header = FALSE)
subject_test <- fread("./UCI HAR Dataset/test/subject_test.txt",header = FALSE)

#1. Merge the training and the test sets to create one data set.

##Row binding 
subject_X <- rbind(subject_train,subject_test)
Y<-rbind(Y_train,Y_test)
X<-rbind(X_train,X_test)

#2. Extracts only the measurements on the mean and standard deviation for each measurement.

##Convert variable as character
features[,2]<-as.character(features[,2])

##filter by mean or std key words
col_vars<-grep("mean|std",features[,2])

##Select variables 
X_sel<-X %>% select(col_vars)

#3. Uses descriptive activity names to name the activities in the data set
Y_lab<-lapply(Y,function(x){as.character(activity_labels[x,2])})

#4 Appropriately labels the data set with descriptive variable names.

##Slice names and apply to X_sel
names(X_sel)<-features[col_vars,2]

##Assemble dataframe
x_tidy<-data.frame(Y_lab,subject_X,X_sel)

##Rename Variables activity and subject
names(x_tidy)[1]<-"activity"
names(x_tidy)[2]<-"subject"

head(x_tidy)

#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
x_tidy<-as.data.table(x_tidy)
data_step5<-x_tidy[,lapply(.SD, mean),by=.(activity, subject)]
head(data_step5)

write.table(data_step5, "data_clean_DT.txt", row.names = FALSE)
