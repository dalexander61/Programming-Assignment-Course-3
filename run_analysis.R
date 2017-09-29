
## load library
library(dplyr)
library(readr)

## Grab file
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
filename <- "getdata%2Fprojectfiles%2FUCI HAR Dataset.zip"
download.file(fileURL, filename)
unzip(filename)   ## unzip all the files



## load features
features <- read.table("UCI HAR Dataset/features.txt")

## load activities 
activities <- read.table("UCI HAR Dataset/activity_labels.txt")
activities$V2] <- as.character(activities$V2)   ## convert to character string


## load training data
tidy <- read.table("UCI HAR Dataset/train/X_train.txt")   ## training data
tidyAct <- read.table("UCI HAR Dataset/train/Y_train.txt")  ## Activities
tidySub <- read.table("UCI HAR Dataset/train/subject_train.txt")  ## subjects

## load test data
test <- read.table("UCI HAR Dataset/test/X_test.txt")
testAct <- read.table("UCI HAR Dataset/test/Y_test.txt")
testSub <- read.table("UCI HAR Dataset/test/subject_test.txt")

## combine the 3 training and testing data sets.  each has same # of rows.   subject, activity, data....
tidy <- cbind(tidySub, tidyAct, tidy)
test <- cbind(testSub, testAct, test)

## merge the 2 data sets.
tidy <- rbind(tidy, test)

## replace column names
names <- features[,2]
names <- as.character(names)
colnames(tidy) <- c("subject", "activities", names)

## substitute activity numbers for names
tidy$activities <- factor(tidy$activities, level = activities$V1, label = activities$V2)

## prune columns so only have mean and standard deviation.  And here is the tidy data set.
tidy <- tidy[,grepl("subject|activities|.*[Mm]ean*.|.*[Ss]td*.", colnames(tidy))]

## Fix column names so they are more readable
colnames(tidy) <- gsub("[-()]", "", colnames(tidy))
colnames(tidy) <- gsub("mean", "Mean", colnames(tidy))
colnames(tidy) <- gsub("std", "Std", colnames(tidy))


## create a new data set with the average of each variable for each activity and each subject and write to tidy.tx.
## group data and get mean.
## need to set factors ##
tidyMeans <- group_by(tidy, subject, activities)
tidyMeans <- summarise_each(tidyMeans, funs(mean))
tidyMeans <- tbl_df(tidyMeans)  ## better for printing.
write.table(tidyMeans, "tidy.txt", sep="\t", row.names=FALSE, quotname=FALSE)



