# GettingCleaningData
This R Script: run_analysis.R gets the data from UCI Machine Learning Repository [http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones] and makes it tidy by following these steps.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

So at the end, we will have 2 datasets. One is a tidy dataset (from step 4) and the other is average of each variable (from step 5).
