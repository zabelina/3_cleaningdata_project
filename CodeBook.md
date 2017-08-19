CodeBook.md
=================

# Raw Data

The raw data can be dowloaded [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

For more information about the data set and data compilation, please see its [webpage](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#)

The raw data contain the following files:

* File “README.txt”, that explains the structure of the data set.
* Folder “UCI HAR Dataset”, that contains the data

# Transformation of the Raw Data

* Append test data to train data and add subjects and activities id.
* Extract variables, that provide mean and standard deviation of the measurements. 
* Merge activities labels to the data set using activity id number.
* Replace the variables names with features names.
* Compute mean value of each variables for each subject and activity.

# Tidy Data

Tidy data are obtained by performing analysis using the script “run_analysis.R”.
The tidy data contain the following files:

* File “README.txt”, that explains the analysis performed by the script “run_analysis.R”.
* File “tidy_data.txt”, that contained transformed data (dimentions of the data set is 180x81)


## Variables 

*  subject - identify a person performing the test, ranges from 1 to 30
*  activity - identify an activity perfermed by a subject, 5 values are avaliable:
	* WALKING
	* WALKING_UPSTAIRS
	* WALKING_DOWNSTAIRS
	* SITTING
	* STANDING
	* LAYING
* the following 66 variables are mean values (for each subject and activity) of mean and std values for the following measurments ('-XYZ' is used to denote 3-axial signals in the X, Y and Z directions) :
tBodyAcc-XYZ, tGravityAcc-XYZ, tBodyAccJerk-XYZ, tBodyGyro-XYZ, tBodyGyroJerk-XYZ, tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag, fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccMag, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag

For more information about these measurments, please see file “features_info.txt” in the raw data.

