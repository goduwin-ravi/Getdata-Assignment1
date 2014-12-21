
Code Book

Purpose
=======
This code book includes information about the source data, the transformations performed after collecting the data and some information about the variables of the resulting data sets.

Study Design
============
The source data was collected from the [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) to complete an assignment for a Coursera course named Getting and Cleaning Data instructed by Jeff Leek. The assignment involved working with the [data set](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and producing tidy data representation of the source data. Below is a list of the operations done to achieve the outputs.

1. Download and unzip the data set
2. Loaded individual test and training data sets into data tables
3. Loaded activity labels and features list
4. Merged test and training data sets using rbind
5. Extracted subset of columns relevant to measurements variables (mean and standard deviation)
6. Replaced activity IDs with the activity labels for readability
7. Consolidated all information to produce one set of data combined_data containing the subjects, measurements and activities
8. Created "combined_data.txt" as the first expected output
9. Reorganized the combined_data by subject ID and activity ID averaging the mean and standard deviation calculations across the sub-groups
10. Created "tidy_data.txt" as the second expected output

Please refer to [run_analysis.R] (https://github.com/goduwin-ravi/Getdata-Assignment1) for implementation details.

List of Variables
=================
- subjectId: 1 to 30 each representing a participant in the study
- activity: the activity that the subject was doing at the time of the measurement
- tBodyAcc-mean-X        
- tBodyAcc-mean-Y
- tBodyAcc-mean-Z
- tBodyAcc-std-X
- tBodyAcc-std-Y
- tBodyAcc-std-Z
- tGravityAcc-mean-X
- tGravityAcc-mean-Y
- tGravityAcc-mean-Z
- tGravityAcc-std-X
- tGravityAcc-std-Y
- tGravityAcc-std-Z
- tBodyAccJerk-mean-X
- tBodyAccJerk-mean-Y
- tBodyAccJerk-mean-Z
- tBodyAccJerk-std-X
- tBodyAccJerk-std-Y
- tBodyAccJerk-std-Z
- tBodyGyro-mean-X
- tBodyGyro-mean-Y
- tBodyGyro-mean-Z
- tBodyGyro-std-X
- tBodyGyro-std-Y
- tBodyGyro-std-Z
- tBodyGyroJerk-mean-X
- tBodyGyroJerk-mean-Y
- tBodyGyroJerk-mean-Z
- tBodyGyroJerk-std-X
- tBodyGyroJerk-std-Y
- tBodyGyroJerk-std-Z
- tBodyAccMag-mean
- tBodyAccMag-std
- tGravityAccMag-mean
- tGravityAccMag-std
- tBodyAccJerkMag-mean
- tBodyAccJerkMag-std
- tBodyGyroMag-mean
- tBodyGyroMag-std
- tBodyGyroJerkMag-mean
- tBodyGyroJerkMag-std
- fBodyAcc-mean-X
- fBodyAcc-mean-Y
- fBodyAcc-mean-Z
- fBodyAcc-std-X
- fBodyAcc-std-Y
- fBodyAcc-std-Z
- fBodyAccJerk-mean-X
- fBodyAccJerk-mean-Y
- fBodyAccJerk-mean-Z
- fBodyAccJerk-std-X
- fBodyAccJerk-std-Y
- fBodyAccJerk-std-Z
- fBodyGyro-mean-X
- fBodyGyro-mean-Y
- fBodyGyro-mean-Z
- fBodyGyro-std-X
- fBodyGyro-std-Y
- fBodyGyro-std-Z
- fBodyAccMag-mean
- fBodyAccMag-std
- fBodyBodyAccJerkMag-mean
- fBodyBodyAccJerkMag-std
- fBodyBodyGyroMag-mean
- fBodyBodyGyroMag-std
- fBodyBodyGyroJerkMag-mean
- fBodyBodyGyroJerkMag-std

Feature Vector variables:
=========================
mean(): mean values of multiple measurements of the original variables.
			Type:    Real number
	
std(): Standard deviation of multiple measurements of the original variables.
			Type:    Real number

activity_id: Identifier, identifying the activity of each subject
			Type:    Integer
			Values:  1:6

activity_name: Descriptive name of each subject's activity
			Type: 	 Factor
			Values:  WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

subject_id: Identifier, identifying each subject
			Type:    Integer
			Values:  1:30

