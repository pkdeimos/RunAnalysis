## Data Cleaning
This repository has the following files - 

### run_analysis.R script
This R script reads the training and wearable datasets does the following actions on the data - 
* Read metadata - features and activities
* Read training and test data sets
* Merge training and test data sets with their respective activity and subject data
* Merge the 2 data sets to form a single dataset
* Join the merged dataset with Activities to update activity Ids with their labels
* Column names of the merged data are updated with descriptive names as available in features
* Create a tidy data set by summarising merged data for each Activity and Subject

### Datasets
mergedata - This is the merge of training and test data sets with column names 
updated to descriptive names and activity column values updated with their respective
activity labels

tidydata - This data set has means of all measurements in merge data for each 
Activity and Subject

The list of columns in these data sets is available in CodeBook.md

