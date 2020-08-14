The run_analysis.R script performs the data preparation and then followed by the 5 steps required as described in the course project’s definition.

1. Download the dataset

2. Read Data from Files and assign to variables. This project uses 6 datafiles:  x_train.txt, x_test.txt, y_train.txt, y_test.txt, subject_train.txt and subject_test.txt

	Features.txt contains the variable name, which corresponds to each column of x_train.txt and x_test.txt. 

	The activity_labels.txt contains the desciptive names for each activity label, which corresponds to each number in the y_train.txt and y_test.txt.
	
	FeaturesDataNames <- features.txt : 561 rows, 2 columns
	
	activityLabels <- activity_labels.txt : 6 rows, 2 columns
	
	SubjectData_Test <- test/subject_test.txt : 2947 rows, 1 column
	
	FeaturesData_Test <- test/X_test.txt : 2947 rows, 561 columns
	
	ActivityData_Test <- test/y_test.txt : 2947 rows, 1 columns
	
	SubjectData_Train <- test/subject_train.txt : 7352 rows, 1 column
	
	FeaturesData_Train <- test/X_train.txt : 7352 rows, 561 columns
	
	ActivityData_Train <- test/y_train.txt : 7352 rows, 1 columns
		
3. Merge the training and the test sets to create one data set.  x_data.txt, y_data.txt, subject_data.txt are binded by row, and after that all three of them are binded by column.

	FeaturesData (10299 rows, 561 columns) is created by merging FeaturesData_Train and FeaturesData_Test using rbind() function
	
	ActivityData (10299 rows, 1 column) is created by merging ActivityData_Train and ActivityData_Test using rbind() function
	
	SubjectData (10299 rows, 1 column) is created by merging SubjectData_Train and SubjectData_Test using rbind() function
	
	Data (10299 rows, 563 column) is created by merging FeaturesData, ActivityData and SubjectData using cbind() function

4. Extract only the measurements on the mean and standard deviation for each measurement. Data (10299 rows, 88 columns) is manipulated by subsetting, selecting only columns: subject, code and the measurements on the mean and standard deviation (std) for each measurement

5. Use descriptive activity names to name the activities in the data set. Entire numbers in code column of the TidyData replaced with corresponding activity taken from second column of the activities variable

6. Appropriately label the data set with descriptive variable names. 
	
	All Acc in column’s name replaced by Accelerometer
	All Gyro in column’s name replaced by Gyroscope
	All BodyBody in column’s name replaced by Body
	All Mag in column’s name replaced by Magnitude
	All start with character f in column’s name replaced by Frequency
	All start with character t in column’s name replaced by Time

7. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject. TidyData (180 rows, 88 columns) is created by taking the means of each variable for each activity and each subject, after grouped by subject and activity.

tidydata.txt contains data where the first two columns are the subject id and activity being performed followed by measurements that contain mean or standard deviation.  There are 180 observations and 68 variables.
