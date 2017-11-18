## Load libraries
library(plyr)
library(dplyr)
library(tidyr)


##Load metadata data
datafolder <- "./UCI HAR Dataset/"

features <- read.table(paste(datafolder, "features.txt", sep = ""))
activities <- read.table(paste(datafolder, "activity_labels.txt", sep = ""))

##Load training data
trainsub <- read.table(paste(datafolder, "train/subject_train.txt", sep = ""))
trainact <- read.table(paste(datafolder, "train/y_train.txt", sep = ""))
traindata <- read.table(paste(datafolder, "train/X_train.txt", sep = ""))

##Load test data
testsub <- read.table(paste(datafolder, "test/subject_test.txt", sep = ""))
testact <- read.table(paste(datafolder, "test/y_test.txt", sep = ""))
testdata <- read.table(paste(datafolder, "test/X_test.txt", sep = ""))

##Merge Data
mergedata <- rbind(cbind(trainsub, trainact, traindata[grep("mean|std", features$V2)]), 
                   cbind(testsub, testact, testdata[grep("mean|std", features$V2)]))


## Update the column names of merged data and activities data 
## to descriptive column names
names(mergedata) <- c("Subject", "ActivityId", 
                      as.character(grep("mean|std", features$V2, value = TRUE)))
names(activities) <- c("ActivityId","Activity")

## Update Activity Ids with labels by joining merged data with activities data
mergedata <- merge(activities,mergedata,by = "ActivityId", all.y = TRUE)
mergedata[1] = NULL

## Create a tidy dataset summarising merged data for each activity & subject
tidydata <- ddply(mergedata, .(Activity, Subject), numcolwise(mean))

## Write data sets to csv files
write.csv(tidydata, "tidydata.csv")
write.csv(mergedata, "mergedata.csv")

## --End of Script--
