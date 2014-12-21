==============================================================
Getting-and-Cleaning-Data (Getdata-Assignment1-master)
on Human Activity Recognition Using Smartphones Dataset v1.0
==============================================================

Files submitted as part of this assignment:
===========================================
- run_analysis.R (R-script file): https://github.com/goduwin-ravi/Getdata-Assignment1/blob/master/run_analysis.R
- data (folder containing input data to run the above R-Script): https://github.com/goduwin-ravi/Getdata-Assignment1/tree/master/data
- README.md (Readme file): https://github.com/goduwin-ravi/Getdata-Assignment1/blob/master/README.md
- CookBook.md (CookBook file): https://github.com/goduwin-ravi/Getdata-Assignment1/blob/master/CodeBook.md
- tidy_data.txt (Output-2 tidy data set): https://github.com/goduwin-ravi/Getdata-Assignment1/blob/master/tidy_data.txt

Instructions:
=============
1. Launch your browser and access the Git webpage at: https://github.com/goduwin-ravi/Getdata-Assignment1

2. Click the button 'Download Zip' and make a copy of this entire Git submission.

3. Unzip the downloaded 'Getdata-Assignment1-master.zip' file.

4. Move the 'data' folder, 'run_analysis.R' script file, as well as the 'README.md' and 'CookBook.md' files to the current working directory of either the 'R' package or the 'R-Studio' instance on your local system.

5. Load the R script using source("run_analysis.txt")

6. Run the R script and after successful execution of the script, you will find 'tidy_data.txt' output to your current R working directory.

Dependencies:
=============
1. The R script assumes that the zip version of the input data file ("getdata-projectfiles-UCI HAR Dataset.zip") is available in its current working directory.
 
2. The R script assumes that the R-packages 'reshape2' and  'data.table' are already installed. If this is not the case, install both pakages using install.packages("data.table") and install.packages("reshape2").

About the Input Data:
=====================
The data used in this analysis has been taken from experiments carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz data were captured. The experiments were video-recorded to label the data manually. The obtained dataset was randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The original dataset included the following data files:
=======================================================
- 'features.txt': List of all features.
- 'activity_labels.txt': List of class labels and their activity names.

- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'train/subject_train.txt': ID's of subjects in the training data

- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
- 'test/subject_test.txt': ID's of subjects in the training data

For more information about the "Human Activity Recognition Using Smartphones Dataset Version 1.0" contact: activityrecognition@smartlab.ws

