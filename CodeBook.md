Code Book


Action

	WALKING
	WALKING_UPSTAIRS
	WALKING_DOWNSTAIRS
	SITTING
	STANDING
    LAYING


subject
    Subject ID: 1-30
	


The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals. 
Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. 
Similarly, the acceleration signal was then separated into body and gravity acceleration signals ("body acceleration signal" and "gravity acceleration signal") using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals ("linear jerk of the Body acceleration signal" and "angular jerk of the Body acceleration signal"). 
Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm:
 ( "Magnitude of the body acceleration signal"
   "Magnitude of the gravity acceleration signal"
   "Magnitude of the linear jerk of the Body acceleration signal"
   "Magnitude of the body gyroscope signal"
   "Magnitude of the angular jerk of the Body acceleration signal")

Finally a Fast Fourier Transform (FFT) was applied to some of these signals  ( features named "FFT of")

For these signals the Mean and Standard Deviation variables were estimated.

For each feature named below the values is the average of the measurement over all the values of the (subject, action) pair.

Mean of the body acceleration signal on the X axis
Mean of the body acceleration signal on the Y axis
Mean of the body acceleration signal on the Z axis
Standard Deviation of the body acceleration signal on the X axis
Standard Deviation of the body acceleration signal on the Y axis
Standard Deviation of the body acceleration signal on the Z axis
Mean of the gravity acceleration signal on the X axis
Mean of the gravity acceleration signal on the Y axis
Mean of the gravity acceleration signal on the Z axis
Standard Deviation of the gravity acceleration signal on the X axis
Standard Deviation of the gravity acceleration signal on the Y axis
Standard Deviation of the gravity acceleration signal on the Z axis
Mean of the linear jerk of the Body acceleration signal on the X axis
Mean of the linear jerk of the Body acceleration signal on the Y axis
Mean of the linear jerk of the Body acceleration signal on the Z axis
Standard Deviation of the linear jerk of the Body acceleration signal on the X axis
Standard Deviation of the linear jerk of the Body acceleration signal on the Y axis
Standard Deviation of the linear jerk of the Body acceleration signal on the Z axis
Mean of the body gyroscope signal on the X axis
Mean of the body gyroscope signal on the Y axis
Mean of the body gyroscope signal on the Z axis
Standard Deviation of the body gyroscope signal on the X axis
Standard Deviation of the body gyroscope signal on the Y axis
Standard Deviation of the body gyroscope signal on the Z axis
Mean of the angular jerk of the Body acceleration signal on the X axis
Mean of the angular jerk of the Body acceleration signal on the Y axis
Mean of the angular jerk of the Body acceleration signal on the Z axis
Standard Deviation of the angular jerk of the Body acceleration signal on the X axis
Standard Deviation of the angular jerk of the Body acceleration signal on the Y axis
Standard Deviation of the angular jerk of the Body acceleration signal on the Z axis
Mean of the Magnitude of the body acceleration signal
Standard Deviation of the Magnitude of the body acceleration signal
Mean of the Magnitude of the gravity acceleration signal
Standard Deviation of the Magnitude of the gravity acceleration signal
Mean of the Magnitude of the linear jerk of the Body acceleration signal
Standard Deviation of the Magnitude of the linear jerk of the Body acceleration signal
Mean of the Magnitude of the body gyroscope signal
Standard Deviation of the Magnitude of the body gyroscope signal
Mean of the Magnitude of the angular jerk of the Body acceleration signal
Standard Deviation of the Magnitude of the angular jerk of the Body acceleration signal
Mean of the FFT of body acceleration signal on the X axis
Mean of the FFT of body acceleration signal on the Y axis
Mean of the FFT of body acceleration signal on the Z axis
Standard Deviation of the FFT of body acceleration signal on the X axis
Standard Deviation of the FFT of body acceleration signal on the Y axis
Standard Deviation of the FFT of body acceleration signal on the Z axis
Mean of the FFT of linear jerk of the Body acceleration signal on the X axis
Mean of the FFT of linear jerk of the Body acceleration signal on the Y axis
Mean of the FFT of linear jerk of the Body acceleration signal on the Z axis
Standard Deviation of the FFT of linear jerk of the Body acceleration signal on the X axis
Standard Deviation of the FFT of linear jerk of the Body acceleration signal on the Y axis
Standard Deviation of the FFT of linear jerk of the Body acceleration signal on the Z axis
Mean of the FFT of body gyroscope signal on the X axis
Mean of the FFT of body gyroscope signal on the Y axis
Mean of the FFT of body gyroscope signal on the Z axis
Standard Deviation of the FFT of body gyroscope signal on the X axis
Standard Deviation of the FFT of body gyroscope signal on the Y axis
Standard Deviation of the FFT of body gyroscope signal on the Z axis
Mean of the FFT of Magnitude of the body acceleration signal
Standard Deviation of the FFT of Magnitude of the body acceleration signal
Mean of the FFT of Magnitude of the linear jerk of the Body acceleration signal
Standard Deviation of the FFT of Magnitude of the linear jerk of the Body acceleration signal
Mean of the FFT of Magnitude of the body gyroscope signal
Standard Deviation of the FFT of Magnitude of the body gyroscope signal
Mean of the FFT of Magnitude of the angular jerk of the Body acceleration signal
Standard Deviation of the FFT of Magnitude of the angular jerk of the Body acceleration signal

=====================================================================================

The original data set contained the following files:The dataset includes the following files:
=========================================

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


   
   
   