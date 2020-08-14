The run_analysis.R script performs the data preparation and then followed by the 5 steps required as described in the course project’s definition.

1. Download the dataset

2. Read Data from Files and assign to variables. This project uses 6 datafiles:  x_train.txt, x_test.txt, y_train.txt, y_test.txt, subject_train.txt and subject_test.txt

Features.txt contains the variable name, which corresponds to each column of x_train.txt and x_test.txt. 

The activity_labels.txt contains the desciptive names for each activity label, which corresponds to each number in the y_train.txt and y_test.txt.

3. Merge the training and the test sets to create one data set.  x_data.txt, y_data.txt, subject_data.txt are binded by row, and after that all three of them are binded by column.

4. Extract only the measurements on the mean and standard deviation for each measurement

5. Use descriptive activity names to name the activities in the data set. Match each number in the y_data column with activity_labels.txt

6. Appropriately label the data set with descriptive variable names. Rename the column of y_data and subject_data, instead of using the default name provided

7. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject. Write out the tidy dataset to tidydata.txt.

tidydata.txt contains data where the first two columns are the subject id and activity being performed followed by measurements that contain mean or standard deviation.  There are 180 observations and 68 variables.
