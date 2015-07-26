# Code book of Coursera Getting and Cleaning Data Project

X_train: variable that loads "UCI HAR Dataset/train/X_train.txt" into R data frame
y_train: variable that loads "UCI HAR Dataset/train/y_train.txt" into R data frame
subject_train: variable that loads "UCI HAR Dataset/train/subject_train.txt" into R data frame
X_test: variable that loads "UCI HAR Dataset/test/X_test.txt" into R data frame
y_test: variable that loads "UCI HAR Dataset/test/y_test.txt" into R data frame
subject_test: variable that loads "UCI HAR Dataset/test/subject_test.txt" into R data frame
activity_labels: variable that loads "UCI HAR Dataset/activity_labels.txt" into R data frame
features: variable that loads "UCI HAR Dataset/features.txt" into R data frame

Using features data frame, X_train and X_test data frame columns are labeled with descriptive names

X_train_extract: variable that loads columns from X_train data frame only if the column name contains "std" or "mean" 
X_test_extract: variable that loads columns from X_test data frame only if the column name contains "std" or "mean" 

y_train_desc: variable that holds join result of y_train and activity_labels
y_test_desc: variable that holds join result of y_test and activity_labels

train_combined: variable that holds result of column binding of subject_train, y_train_desc "activity" column only, and X_train_extract
test_combined: variable that holds result of column binding of subject_test, y_test_desc "activity" column only, and X_test_extract
data_combined: variable that holds result of row binding of train_combined and test_combined, making all the data combined into one single data frame

data_melt: variable that holds result of data_combined melted by "subject_id" and "activity"
data_avg_aggregated: variable that holds result of average aggregation of all columns of data_combined grouped by "activity" and "subject_id"

In the final step, data_avg_aggregated is printed to a text file using write.table() with parameter row.name=FALSE 
