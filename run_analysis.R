setwd("/Users/roygao/WorkSpace/test/")

#read all data frames from dataset directory
training_X = read.csv("UCI HAR Dataset/train/X_train.txt", sep="", header=FALSE)
testing_X = read.csv("UCI HAR Dataset/test/X_test.txt", sep="", header=FALSE)

training_Y = read.csv("UCI HAR Dataset/train/Y_train.txt", sep="", header=FALSE)
testing_Y = read.csv("UCI HAR Dataset/test/Y_test.txt", sep="", header=FALSE)

training_sub = read.csv("UCI HAR Dataset/train/subject_train.txt", sep="", header=FALSE)
testing_sub = read.csv("UCI HAR Dataset/test/subject_test.txt", sep="", header=FALSE)

activity_labels = read.csv("UCI HAR Dataset/activity_labels.txt", sep="", header=FALSE)
features = read.csv("UCI HAR Dataset/features.txt", sep="", header=FALSE)

#merges the training and the test sets to create one data set
subject <- rbind(training_sub, testing_sub)
colnames(subject) <- c('subject')
Y <- rbind(training_Y, testing_Y)
colnames(Y) <- c('activity')
X <- rbind(training_X, testing_X)
subject <- cbind(subject, Y)
all <- cbind(X, subject)

#replace feature names for later substitution
features[,2] = gsub('-mean', 'Mean', features[,2])
features[,2] = gsub('-std', 'Std', features[,2])
features[,2] = gsub('[-()]', '', features[,2])

#filter the Mean and Std dev measurement
measurement <- grep(".*Mean.*|.*Std.*", features[,2])
features <- features[measurement,]
slices <- c(measurement, 562, 563)

#slice data frame of Mean and Std meansurement and give its descriptive names
all <- all[,slices]
colnames(all) <- c(features$V2, "subject", "activity")
colnames(all) <- tolower(colnames(all))
#map the activity label
activity_labels[, 2] = gsub("_", "", tolower(as.character(activity_labels[, 2])))
all[, 'activity'] <- activity_labels[all[, 'activity'], 2]

all$activity <- as.factor(all$activity)
all$subject <- as.factor(all$subject)
#generate the final dataset  with the average of each variable for each activity and each subject
final = aggregate(all, by=list(activity = all$activity, subject=all$subject), mean)
final <- final[, 1:88]

write.table(final, "final.txt", sep="\t")












