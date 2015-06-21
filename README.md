##Getting and Cleaning Data
In this repository is all the code written for the
Course Project

The code in run_analysis.R does the next:

Merges the training and the test sets to create one data set.
Extracts the measurements on the mean and standard deviation for each measurement. 
Uses descriptive activity names to name the activities in the data set
Labels the data set with descriptive variable names. 
At the end creates a tidy data set with the average of each variable for each activity and each subject.

(find all project-related materials in the UCI HAR Dataset directory, however, copies of the important files have been put into this main directory to fulfill the submission requirement)

Unzip the source (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) into a folder on your local drive, say C:\Users\yourname\Documents\R\

Put run_analysis.R into C:\Users\yourname\Documents\R\UCI HAR Dataset\

In RStudio: setwd("C:\\Users\\yourname\\Documents\\R\\UCI HAR Dataset\\"), followed by: source("run_analysis.R")