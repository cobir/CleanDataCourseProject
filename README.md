Course Project for the "Getting and Cleaning Data" Coursera course
==================================================================

A dataset called "Human Activity Recognition Using Smartphones Dataset"
which was taken from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
contains data collected from the accelerometers from the Samsung Galaxy S smartphone by 30 subjects doing 6 actions.

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. 
Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 
The experiments have been video-recorded to label the data manually. 
The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The R script run_analysis.R prepares a tidy dataset from the original data, to be used for later analysis.
By  running the script from the original dataset home directory, an output file called "action_subject_avgs.txt" is created in the same directory.


The script works by performing the following 5 steps:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set,
   with the average of each variable for each activity and each subject.

See the CodeBook.md file for a detailed description of the variables, the data, and the transformations performed by the run_analysis.R script to clean up the data.
The script should be activated when working directory is the home directory of the dataset (UCI HAR Dataset).