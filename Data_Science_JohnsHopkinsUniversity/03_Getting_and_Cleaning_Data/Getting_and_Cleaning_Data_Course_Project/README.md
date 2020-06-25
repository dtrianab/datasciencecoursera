# Getting and Cleaning Data Course Project

The Github repo contains the required script and data for Getting and Cleaning Data Course Project.

The R script called [run_analysis.R](https://github.com/dtrianab/datasciencecoursera/blob/master/Data_Science_JohnsHopkinsUniversity/03_Getting_and_Cleaning_Data/Getting_and_Cleaning_Data_Course_Project/run_analysis.R) does the following:

## 0. Read Files
Read all necessary files from the current directory by using `fread()`function.

## 1. Merges the training and the test sets to create one data set.
Applying row binding `rbind()` to test and train variables as well to subjects data.


## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
Convert variable feature as character and the filter it by mean or std key words in order to find the variables.
The indices are stored into a variable, it is used with `select()` fucntion for slicing the columns.

## 3. Uses descriptive activity names to name the activities in the data set
The activity variable "Y" is passed onto a faction that returns the name of the activity. This funtion retrieves the name from "activity_labels" variable and outputs it as character, the numeric input points to each name.

## 4. Appropriately labels the data set with descriptive variable names.
The variable names are sliced using the filtered names on step 2. The names are applied to X_sel variable containing the selected variables.

X_tidy dataframe is assamed with Activities variables "Y", subject for each record and the selected variables.

First 2 columns from assembled dataframe X_tidy are renames as "activity" and "subject".

## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Data frame X_tidy is stored as table.

X_tidy table is passed onte lapply with mean funtion grouping by activity and subject.

Table is written out as ["data_clean_DT.txt"](https://github.com/dtrianab/datasciencecoursera/blob/master/Data_Science_JohnsHopkinsUniversity/03_Getting_and_Cleaning_Data/Getting_and_Cleaning_Data_Course_Project/data_clean_DT.txt) and row.names = FALSE using `write.table()`. 
