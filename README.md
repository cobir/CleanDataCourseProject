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

================================================================

The original data set contained the following files:The dataset includes the following files:
============================================================================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 



To prepare this data out of the original data set the following 5 steps are taken via the run_analysis.R script:

1. Merges the training and the test sets to create one data frame. 
   Uses the features.txt file for the columns of the data frame

2. Extracts only the measurements on the mean and standard deviation for each measurement, by looking for "-mean()" and "-mean()" in the feature name.

3. Uses descriptive activity names to name the activities in the data set using the activity_labels.txt file.

4. Appropriately labels the data set with descriptive variable names. 
   
   This is done by replacing abbreviations in the feature name with a more descriptive name:
   
   "BodyAccJerk"  => "linear jerk of the Body acceleration signal"
   "BodyGyroJerk" => "angular jerk of the Body acceleration signal",
   "BodyAcc"      => "body acceleration signal",
   "BodyGyro"     => "body gyroscope signal",
   "GravityAcc"   => "gravity acceleration signal"
   "Mag"          => "Magnitude of the"
   "-mean()"      => "Mean of the"
   "-std()"       => "Standard Deviation of the"
   "f" at the beginning => "FFT of"
   The character following "()-" is the the axis.

5. From the data set in step 4, creates a second, independent tidy data set,
   with the average of each variable for each activity and each subject.
   
   This is done by grouping according to two variables - action and subject and using mean on that grouping.
