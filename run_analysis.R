###
### Load required libraries
    library( reshape2 )
    library( data.table )


### =======================================================================
### Housekeeping Activities: Download data and unzip into ./data folder
### =======================================================================
### Download the data file using https:// protocol
    setInternet2(use=TRUE) # Use only on Windows Platform
    fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(fileURL, destfile="./getdata-dataFile.zip")

### Unzip the data file
    unzip("./getdata-dataFile.zip")
    unlink( "./getdata-dataFile.zip", force=TRUE )

### Move unzipped files to ./data folder & cleanup workspace
    unlink( "./data", recursive=TRUE, force=TRUE )
    if( !isTRUE(file.info("./data")$isdir)) dir.create("./data", recursive=FALSE )
    file.copy( "./UCI HAR Dataset/.", "./data", recursive=TRUE )
    unlink( "./UCI HAR Dataset", recursive=TRUE, force=TRUE )
     

### ======================================================================================
### STEP-1: Merge the training and the test sets to create one "data" set.
###         Read input files from Test & Train datasets and join the "data" data sets
### ======================================================================================
### Read files from Test folder
    x_test        <- read.table("./data/test/X_test.txt") # Data
    y_test        <- read.table("./data/test/y_test.txt") # Activities
    subject_test  <- read.table("./data/test/subject_test.txt") # Subject

### Read files from Train folder
    x_train       <- read.table("./data/train/X_train.txt") # Data
    y_train       <- read.table("./data/train/y_train.txt") # Activities
    subject_train <- read.table("./data/train/subject_train.txt") # Subject

### Join the Test & Train "data" data sets. 
    joinData <- rbind(x_test, x_train)


### ======================================================================================
### STEP-2: Extract only the measurements on the mean and standard deviation for each 
###         measurement. 
###         Process features file and identify the required columns list for extracting 
###         data (measurement columns relating to mean() and std() only)
### ======================================================================================
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
### STEP-3: Use descriptive activity names to name the activities in the data set.
###         Join the Test & Train "activities" data sets. Merge joinActivity with
###         activity_labels data set to add descriptive activity names to the activities.
### ======================================================================================
    joinActivity <- rbind(y_test, y_train)
    names(joinActivity) <- "activityID"

### Cleanup activityLabels in activity_labels data set
    activity_labels <- read.table("data/activity_labels.txt", col.names=c("activityID", "activityLabel"))
    activity_labels$activityLabel <- gsub("-", "", activity_labels$activityLabel) # Remove "-" in Column Names 

### Add descriptive activityLabels to joinActivity data set
    joinActivity$activityLabel <- merge(joinActivity, activity_labels, by="activityID")$activityLabel


### ======================================================================================
### STEP-4: Appropriately label the data set with descriptive variable names. 
###         Join the Test & Train "subjects" data sets.
###         Finally, merge all three joined data sets and appropriately labele each
###         column with descriptive names. 
### ======================================================================================
    joinSubject <- rbind(subject_test, subject_train)
    names(joinSubject) <- "subjectID"

### Write the combined data sets into a single output file setting row.name=FALSE
    df <- data.table(cbind(joinSubject, joinActivity, joinData))
    write.table(df, "combined_data.txt", row.name=FALSE)
  

### ======================================================================================
### STEP-5: From the data set in step 4, create a second, independent tidy data set  
###         with the average of each variable for each activity and each subject.
### ======================================================================================

### Group combined data by activityLabel, activityID, and subjectID after computing std() on mean()
    tidyData <- df[, lapply(.SD, mean), by=c("activityLabel", "activityID", "subjectID")]

### Write the tidyData into a single output file setting row.name=FALSE
    write.table(tidyData, "tidy_data.txt", row.name=FALSE)


