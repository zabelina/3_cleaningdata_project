README.md
==================================================================

The script "run_analysis.R" uses  ["Human Activity Recognition Using Smartphones Data Set"](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).
For more information about the data set and data compilation, please see its [webpage](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#)


# The script uses the following raw files: 

- Data on measurements: 					"X_train.txt", "X_test.txt"
- Data on subjects: 						"subject_train.txt", "subject_test.txt"
- Data on activities: 						"y_train.txt", "y_test.txt"
- List of activity labels match with activity id : "activity_labels.txt"
- List of measurements names: 				"features.txt" 


# The script  performs the following analyses:

1. Append test data for measurements (X_test.txt), subjects(subject_test.txt) and activities(y_test.txt) to the corresponding train data and combines three data set in one complete dataset.
2. Extract variables, that provide mean and standard deviation of the measurements. 
3. Using file "activity_labels.txt" merge activities labels to the data set using activity id number.
4. Using file "features.txt" replace the variables names with features names given in the file.
5. Compute mean value of each variables for each subject and activity.
6. The script saves the dataset from step 5 as "tidy_data.txt"


# Output:

 - Data on mean values for each subject and activity of mean and standard deviations:  tidy_data.txt
