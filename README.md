# Human Activity Recognition Data Project

To set up the script, set the datadir value to the home folder of the data

## Functions

### mergeandclean
This is the main function. The entry point. 

### mergetrainandtest
This function merges the training and test data sets into one data set.

### mergetrain
Merges the X_train, y_train and subject_train data
Default values are as below and can be changed according to the structure of your data folder and the names of your data set files
trainfile_x = "X_train.txt", trainfile_y = "y_train.txt", trainfile_subject = "subject_train.txt", traindir = "train"

### mergetest
Merges the X_test, y_test and subject_test data
Default values are as below and can be changed according to the structure of your data folder and the names of your data set files
testfile_x = "X_test.txt", testfile_y = "y_test.txt", testfile_subject = "subject_test.txt", testdir = "test"

### getmeanandsdmeasurements
Extracts only the measurements on the mean and standard deviation.

### setactivitynames
Set descriptive activity names for the data set

### getfeaturelabels
Gets the feature label names from the features.txt file