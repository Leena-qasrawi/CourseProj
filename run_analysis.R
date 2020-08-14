## run_analysis.R

## 0.0 load libraries
library(dplyr)

## 1.0 Getting the data from the web
DirRawData <- "./RawData"
DirRawDataURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
DataDir <- "./Data"  

if(!file.exists(DirRawData)) {
        dir.create((DirRawData))
        download.file(url = DirRawDataURL, destfile = "./RawData/RawData.zip", method = "curl")
}

if(!file.exists(DataDir)) {
        dir.create(DataDir)
        unzip(zipfile = "./RawData/RawData.zip", exdir = DataDir)
}

## 2.0 Read data from dataset
PathToFiles <- file.path("./data", "UCI HAR Dataset")

#### Read Features Data
FeaturesData_Test <- read.table(file.path(PathToFiles, "test", "X_test.txt"), header = FALSE)
FeaturesData_Train <- read.table(file.path(PathToFiles, "train", "X_train.txt"), header = FALSE)
#### Read Activity Data
ActivityData_Test <- read.table(file.path(PathToFiles, "test", "y_test.txt"), header = FALSE)
ActivityData_Train <- read.table(file.path(PathToFiles, "train", "y_train.txt"), header = FALSE)
#### Read Subject Data
SubjectData_Test <- read.table(file.path(PathToFiles, "test", "subject_test.txt"), header = FALSE)
SubjectData_Train <- read.table(file.path(PathToFiles, "train", "subject_train.txt"), header = FALSE)

## 3.0 Merge test and training data sets

####Combining Features, Activity and Subject data by rows
SubjectData <- rbind(SubjectData_Train, SubjectData_Test)
ActivityData <- rbind(ActivityData_Train, ActivityData_Test)
FeaturesData <- rbind(FeaturesData_Train, FeaturesData_Test)
#### Add names to variables
names(SubjectData) <- c("Subject")
names(ActivityData) <-c("Activity")
FeaturesDataNames <- read.table(file.path(PathToFiles, "features.txt"), header = FALSE)
names(FeaturesData) <- FeaturesDataNames$V2
#### Merge to get final combined data set in data frame called Data
DataMerge <- cbind(SubjectData, ActivityData)
Data <- cbind(FeaturesData, DataMerge)

##4.0 Extract measurements on the mean and standard deviation for each measurement

subsetdataFeaturesNames<-FeaturesDataNames$V2[grep("mean\\(\\)|std\\(\\)", FeaturesDataNames$V2)]
selectedNames<-c(as.character(subsetdataFeaturesNames), "Subject", "Activity" )
Data<-subset(Data,select=selectedNames)

## 5.0 Use descriptive activity names to name the activities in the data set

activityLabels <- read.table(file.path(PathToFiles, "activity_labels.txt"), col.names = c("code", "activity"), header = FALSE)
Data$Activity <- activityLabels[Data$Activity, 2]

##6.0 Label the dataset with descriptive names
names(Data)<-gsub("^t", "time", names(Data))
names(Data)<-gsub("^f", "frequency", names(Data))
names(Data)<-gsub("Acc", "Accelerometer", names(Data))
names(Data)<-gsub("Gyro", "Gyroscope", names(Data))
names(Data)<-gsub("Mag", "Magnitude", names(Data))
names(Data)<-gsub("BodyBody", "Body", names(Data))
names(Data)<-gsub("tBody", "TimeBody", names(Data))
names(Data)<-gsub("-mean()", "Mean", names(Data), ignore.case = TRUE)
names(Data)<-gsub("-std()", "STD", names(Data), ignore.case = TRUE)
names(Data)<-gsub("-freq()", "Frequency", names(Data), ignore.case = TRUE)
names(Data)<-gsub("angle", "Angle", names(Data))
names(Data)<-gsub("gravity", "Gravity", names(Data))

## 7.0 Create a second, independent tidy data set with the average of each variable for each activity and each subject
TidyData<-aggregate(. ~Subject + Activity, Data, mean)
TidyData<-TidyData[order(TidyData$Subject,TidyData$Activity),]
write.table(TidyData, file = "tidydata.txt",row.name=FALSE)
