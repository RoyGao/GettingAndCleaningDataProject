#Getting And Cleaning Project CodeBook
========================
Raw data set for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A full description is available: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The R script **run_analysis.R** works as below to clean up the data:

* Merge the training and test sets to create one data set, including train/X_train.txt, test/X_test.txt, train/subject_train.txt with test/subject_test.txt and train/y_train.txt with test/y_test.txt.

* Read features.txt and extracts only the measurements on the mean and standard deviation for each measurement. 

* Read activity_labels.txt and applies descriptive activity names to name the activities in the data set:
```
	sitting
	standing
	laying
	walking
	walkingupstairs
	walkingdownstairs
```
* The script also appropriately labels the data set with descriptive names,using names in **feature_txt** names (attributes) and all these names are converted to lower case, underscores and brackets () are removed.

* Finally, the script creates a 2nd, independent tidy data set with the average of each measurement for each activity and each subject named **final.txt** in repos