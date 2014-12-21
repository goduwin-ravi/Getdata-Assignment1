###
### Install required packages
# install.packages( "reshape2" )    #run only if necessary
# install.packages( "data.table" )  #run only if necessary

###
### Load required libraries
require( reshape2 ); library( reshape2 )
require( data.table ); library( data.table )


### =======================================================================
### Housekeeping Activities: Download data and unzip into ./data folder
### =======================================================================
### Download the data file using https:// protocol
    setInternet2(use=TRUE) # Use only on Windows Platform
    urlHome  <- "https://d396qusza40orc.cloudfront.net/"
       zipFile <- "getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(paste0(urlHome, zipFile), destfile=paste0("./", zipFile))

### Unzip the data file
    unzip(zipFile)

### Move unzipped files to ./data folder & cleanup workspace
    unlink( "./data", recursive=TRUE, force=TRUE )
    if( !isTRUE(file.info("./data")$isdir)) dir.create("./data", recursive=FALSE )
    file.copy( "./UCI HAR Dataset/.", "./data", recursive=TRUE )
    unlink( "./UCI HAR Dataset", recursive=TRUE, force=TRUE )
     

### =======================================================================
### STEP-1: Merges the training and the test sets to create one "data" set.
###         Hint: Merge x_test & x_train 
### =======================================================================
### Read files from Test folder
    x_test  <- read.table("./data/test/X_test.txt") # Data
    y_test  <- read.table("./data/test/y_test.txt") # Activities
    s_test  <- read.table("./data/test/subject_test.txt") # Subject

### Read files from Train folder
    x_train <- read.table("./data/train/X_train.txt") # Data
    y_train <- read.table("./data/train/y_train.txt") # Activities
    s_train <- read.table("./data/train/subject_train.txt") # Subject

### Join the Test & Train "data" data sets. 
    joinData <- rbind(x_test, x_train)


### =================================================================================================
### STEP-2: Extracts only the measurements on the mean and standard deviation for each measurement.
###         Hint: Extract only columns that contain "mean() and std()" in the name. 
### =================================================================================================
### Process features file and cleanup column names. Keep only the measurement columns.
    featuresList <- read.table("./data/features.txt")
    selectedCols <- grep("-mean\\(\\)|-std\\(\\)", featuresList[, 2]) # Select columns for mean() and std() only

### Consolidate Test & Train data. Select only measurement columns and fix column names
    joinData <- rbind(x_test, x_train)
    joinData <- joinData[, selectedCols]
    names(joinData) <- gsub("\\(\\)", "", featuresList[selectedCols, 2]) # remove "()
    names(joinData) <- gsub("mean", "Mean", names(joinData)) # Capitalize "M"
    names(joinData) <- gsub("std", "Std", names(joinData))   # Capitalize "S"
    names(joinData) <- gsub("-", "", names(joinData)       ) # Remove "-" in Column Names 


### ======================================================================================
### STEP-3: Usees descriptive activity names to name the activities in the data set.
###         Hint: Merge y_test & y_train 
### ======================================================================================
    joinActivity <- rbind(y_test, y_train)
    names(joinActivity) <- "activityID"

### Cleanup activityLabels in activity_labels data set
    activity_labels <- read.table("data/activity_labels.txt", col.names=c("activityID", "activityLabel"))
    activity_labels$activityLabel <- gsub("-", "", activity_labels$activityLabel) # Remove "-" in Column Names 

### Add descriptive activityLabels to joinActivity data set
    joinActivity$activityLabel <- merge(joinActivity, activity_labels, by="activityID")$activityLabel


### ======================================================================================
### STEP-4: Appropriately labels the data set with descriptive variable names. 
###         Hint: Merge s_test & s_train 
### ======================================================================================
    joinSubject <- rbind(s_test, s_train)
    names(joinSubject) <- "subjectID"

### Write the combined data sets into a single output file setting row.name=FALSE
    df <- data.table(cbind(joinSubject, joinActivity, joinData))
    write.table(df, "combined_data.txt", row.name=FALSE)
  

### ======================================================================================
### STEP-5: From the data set in step 4, create a second, independent tidy data set  
###         with the average of each variable for each activity and each subject.
### ======================================================================================

### Generate Tidy Data of averages on combined data grouped by activityLabel, activityID, and subjectID
    tidyData <- df[, lapply(.SD, mean), by=c("activityLabel", "activityID", "subjectID")]

### Write the tidyData into a single output file setting row.name=FALSE
    write.table(tidyData, "tidy_data.txt", row.name=FALSE)


