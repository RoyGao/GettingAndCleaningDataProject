# Getting and Cleaning Data: Coursera Project
## Introduction
This is a repo of my work for the **Getting and Cleaning Data** Coursera course in Data Science Specialty Course through Johns Hopkins University.
## About the Project Raw Data
You must download and unzip the dataset from UCI website as below:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
## How the Script works
I wrote a script named run_analysis.R which transforms raw dataset as project required 
Prerequisites for this script:
* You have downloaded UCI dataset and unzipped it
* You should edit the directory info in **setwd** fun based on your environment
The script will create a tidy data set named **final.csv** containing the means of all the columns per subject and per activity.



