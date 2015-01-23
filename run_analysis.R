
#
#
# This script cleans and merges the "UCI HAR" Dataset by doing the following steps:
#
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set,
#    with the average of each variable for each activity and each subject.
#
#

library(dplyr)

action_colname<-c("action_no")
subject_colname<-c("subject")

#
# step 1: read and merge the test and train data sets to create a single data set
#  

# read the features names
fnames_df<-read.table("./features.txt", header=FALSE,col.names=c("feature_number", "feature_name"))
fnames<-fnames_df[,"feature_name"]

# read files X_train.txt, subject_train.txt, Y_train.txt 
# with the features values, subjects and actions, into data frames
Xtrain_df<-read.table("./train/X_train.txt", header=FALSE, col.names=fnames, check.names=FALSE)
subject_train_df<-read.table("./train/subject_train.txt", header=FALSE, col.names=subject_colname, check.names=FALSE)
actions_train_df<-read.table("./train/Y_train.txt", header=FALSE, col.names=action_colname, check.names=FALSE)

# combine the 3 train data frames
train_df<-cbind(Xtrain_df, subject_train_df, actions_train_df)

# do the same for test files to get a data frame for test observations
Xtest_df<-read.table("./test/X_test.txt", header=FALSE, col.names=fnames, check.names=FALSE)
subject_test_df<-read.table("./test/subject_test.txt", header=FALSE, col.names=subject_colname, check.names=FALSE)
actions_test_df<-read.table("./test/Y_test.txt", header=FALSE, col.names=action_colname, check.names=FALSE)

test_df<-cbind(Xtest_df, subject_test_df, actions_test_df)

#combine train and test data frames
maindf<-rbind(train_df, test_df)



#
# step 2 : create a data set with only the mean and std measurements
#

# calculate a vector with the features names that contain "mean" or "std"
colNames<-names(maindf)
isMean<-grepl("-mean()", colNames,fixed=TRUE)
isStd<-grepl("-std()", colNames,fixed=TRUE)
meanStdColNames<-colNames[isMean | isStd]

# data frame with the "mean","std" columns, and action and subject column
allColNames<-c(meanStdColNames,action_colname,subject_colname)
mean_std_df<-maindf[,allColNames]

#
# step 3: replace activity numbers with activity names
#

# read activities data
activities_df<-read.table("./activity_labels.txt", header=FALSE, col.names=c(action_colname, "Action"), check.names=FALSE)

# join activities data frame and main data frame according to action_no column
mean_std_df_w_actions<-merge(mean_std_df, activities_df, by.x="action_no", by.y="action_no",all=FALSE)


#
# step 4 - descriptive variable names
#


# This function gets an original name, a new name, a list of original strings, and a list new strings.
# It finds the first match of the original in the original name and concatenates the matching new string
# to the the new name.
concatDesc <- function(origColName, origExprs, newColName, newExprs) {
  for (i in 1:length(origExprs)) {
    origExpr<-origExprs[i]
    newExpr<-newExprs[i]
    if (substr(origColName,2,nchar(origExpr)+1)==origExpr) {
      newName<-paste(newColName,newExpr)
      return(newName)
    }
  }
  origColName
}

# This function translates feature name to a meaningful descriptive name
descName  <- function(origColName) {
  # fix problem of double "Body" in column name
  origColName<-gsub("BodyBody","Body",origColName,fixed=TRUE)
  
  newName<-""
  nonDesc<-c("BodyAccJerk",
             "BodyGyroJerk",
             "BodyAcc",
             "BodyGyro",
             "GravityAcc")
  desc<-c("linear jerk of the Body acceleration signal",
          "angular jerk of the Body acceleration signal",
          "body acceleration signal",
          "body gyroscope signal",
          "gravity acceleration signal")
  newName<-concatDesc(origColName, nonDesc, newName, desc)
  
  
  
  if (grepl("Mag",origColName,fixed=TRUE)) {
    newName<-paste("Magnitude of the", newName)
  }
  if (grepl("()-",origColName,fixed=TRUE)) {
    n<-nchar(origColName)
    axis<-substr(origColName,n,n)
    newName<-paste(newName,"on the",axis,"axis")
  }
  if (substr(origColName,1,1)=="f") {
    newName<-paste("FFT of",newName)
  }
  if (grepl("-mean()",origColName,fixed=TRUE)) {
    newName<-paste("Mean of the", newName)
  }
  if (grepl("-std()",origColName,fixed=TRUE)) {
    newName<-paste("Standard Deviation of the", newName)
  }
  
  
  if (nchar(newName)==0) {
    newName<-origColName
  }
  
  newName<-gsub("  "," ",newName,fixed=TRUE)
  
  newName
}


# create meaningful names
mfulNames<-sapply(names(mean_std_df_w_actions), descName, USE.NAMES = FALSE)

# replace column names to meaningful ones
colnames(mean_std_df_w_actions)<-mfulNames


#
# step 5: group by action and subject
#

by_action_subject<-group_by(mean_std_df_w_actions,Action,subject)

# first col is action_no and last 2 cols are subject and action name
# so they are out of the summarisation
tidydf<-summarise_each(by_action_subject,funs(mean),seq(2,length(mfulNames)-2))

write.table(tidydf,"action_subject_avgs.txt",row.name=FALSE)

