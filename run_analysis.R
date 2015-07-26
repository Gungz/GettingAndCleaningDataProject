require(plyr)
require(reshape2)
X_train <- read.table("UCI HAR Dataset/train/X_train.txt", quote="\"")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", quote="\"")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", quote="\"")
X_test <- read.table("UCI HAR Dataset/test/X_test.txt", quote="\"")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", quote="\"")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", quote="\"")
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", quote="\"")
features <- read.table("UCI HAR Dataset/features.txt", quote="\"")

names(X_train) <- features[,2]
names(X_test) <- features[,2]
colMeanOrStd <- grepl("mean", tolower(features$V2)) | grepl("std", tolower(features$V2))

X_train_extract <- X_train[,colMeanOrStd]
X_test_extract <- X_test[,colMeanOrStd]

names(activity_labels) <- c("id", "description")
names(y_train) <- c("id")
names(y_test) <- c("id")

y_train_desc <- as.data.frame(join(y_train, activity_labels)[,2])
y_test_desc <- as.data.frame(join(y_test, activity_labels)[,2])
names(y_train_desc)<-c("activity")
names(y_test_desc)<-c("activity")

names(subject_train) <- c("subject_id")
names(subject_test) <- c("subject_id")

train_combined <- cbind(subject_train, y_train_desc, X_train_extract)
test_combined <- cbind(subject_test, y_test_desc, X_test_extract)
data_combined <- rbind(train_combined, test_combined)

data_melt<-melt(data_combined, id=c("subject_id", "activity"))
data_avg_aggregated<-dcast(data_melt, activity+subject_id ~ variable, mean)

write.table(data_avg_aggregated, file = "output.txt", row.names = FALSE)