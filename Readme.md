Peer graded Course Assignment: Getting and Cleaning Data

This repository is the course project submission which is a requirement for Coursera's Getting and Cleaning Data Course. The objective is to download sets of data from the internet, merge the data and make it tidy.

Dataset: Data collected from the accelerometers from the Samsung Galaxy S smartphone.

Files

1. CodeBook.md - a codebook that describes variables, data and any transformations done to the data

2. run_analysis.R is the R script that downloads the data, reads the files and executes the 5 needed steps that are required to make the data tidy as described in the course project's requirements which are as follows:

	  a. Merges the training and the test sets to create one data set.

	  b. Extracts only the measurements on the mean and standard deviation for each measurement.

	  c. Uses descriptive activity names to name the activities in the data set

	  d. Appropriately labels the data set with descriptive variable names.

	  e. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

3. TidyData.txt - is the file contained the data that has been tidied after completing steps above.
