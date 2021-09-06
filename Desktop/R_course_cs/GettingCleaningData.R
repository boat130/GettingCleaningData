rm(list=ls())
cat("\014")

setwd("/Users/panuponglertthanatham/Desktop")

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, "file.zip")
unzip("file.zip")
unlink("file.zip")

library(tidyverse)

features <- read.table("./UCI HAR Dataset/features.txt", header = FALSE, row.names = 1)
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt", header = FALSE, row.names = NULL)

X_test <- read.table("./UCI HAR Dataset/test/X_test.txt", header = FALSE)
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", header = FALSE)
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", header = FALSE)
#body_acc_x_test <- read.table("./UCI HAR Dataset/test/Inertial Signals/body_acc_x_test.txt", header = FALSE)
#body_acc_y_test <- read.table("./UCI HAR Dataset/test/Inertial Signals/body_acc_y_test.txt", header = FALSE)
#body_acc_z_test <- read.table("./UCI HAR Dataset/test/Inertial Signals/body_acc_z_test.txt", header = FALSE)
#body_gyro_x_test <- read.table("./UCI HAR Dataset/test/Inertial Signals/body_gyro_x_test.txt", header = FALSE)
#body_gyro_y_test <- read.table("./UCI HAR Dataset/test/Inertial Signals/body_gyro_y_test.txt", header = FALSE)
#body_gyro_z_test <- read.table("./UCI HAR Dataset/test/Inertial Signals/body_gyro_z_test.txt", header = FALSE)
#total_acc_x_test <- read.table("./UCI HAR Dataset/test/Inertial Signals/total_acc_x_test.txt", header = FALSE)
#total_acc_y_test <- read.table("./UCI HAR Dataset/test/Inertial Signals/total_acc_y_test.txt", header = FALSE)
#total_acc_z_test <- read.table("./UCI HAR Dataset/test/Inertial Signals/total_acc_z_test.txt", header = FALSE)

X_train <- read.table("./UCI HAR Dataset/train/X_train.txt", header = FALSE)
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", header = FALSE)
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", header = FALSE)
#body_acc_x_train <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt", header = FALSE)
#body_acc_y_train <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_acc_y_train.txt", header = FALSE)
#body_acc_z_train <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_acc_z_train.txt", header = FALSE)
#body_gyro_x_train <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_gyro_x_train.txt", header = FALSE)
#body_gyro_y_train <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_gyro_y_train.txt", header = FALSE)
#body_gyro_z_train <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_gyro_z_train.txt", header = FALSE)
#total_acc_x_train <- read.table("./UCI HAR Dataset/train/Inertial Signals/total_acc_x_train.txt", header = FALSE)
#total_acc_y_train <- read.table("./UCI HAR Dataset/train/Inertial Signals/total_acc_y_train.txt", header = FALSE)
#total_acc_z_train <- read.table("./UCI HAR Dataset/train/Inertial Signals/total_acc_z_train.txt", header = FALSE)

names(X_test) <- features[,1]
names(X_train) <- features[,1]
names(y_test) <- "Activity"
names(y_train) <- "Activity"
names(subject_test) <- "Subject"
names(subject_train) <- "Subject"

# Merges the training and the test sets ti create one dataset
dataset <- rbind(X_train, X_test)
activity <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)

# Extracts only the measurements on the mean and standard deviation for each measurement
MeanSD <- grep("mean|std", names(dataset))
dataset <- dataset %>% select(MeanSD)

# Uses descriptive activity names to name the activities in the data set
activity <- merge(activity, activity_labels, by.x = "Activity", by.y = "V1", all.x = TRUE) %>% mutate(V3 = paste0(Activity, ". ", V2)) %>% select(3) %>% rename("Activity" = V3)

dataset <- cbind(dataset,activity,subject)

# From the dataset in step 4, creates a second, independent tidy dataset with the average of each variable for each activity and each subject
tidy_mean_dataset <- dataset %>% group_by(Activity, Subject) %>% summarise_all("mean")













