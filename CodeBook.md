## Codebook 

The run_analysis.R script performs the data preparation in 6 steps required as described below.

## 1- Get the data from:

    + https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

### 1- Dataset downloaded and extracted under the folder called UCI HAR Dataset
  
### 2- Then was create all the datasets needed to merge:
  
    + features (561 obs, 2 var)
    
    + activities_labels (6 obs, 2 var)
    
    + subject_test (2947 obs, 1 var)
    
    + x_test (2947 obs, 561 var)
    
    + y_test (2947 obs, 1 var)
    
    + subject_train (7352 obs, 1 var)
    
    + x_train (7352 obs, 561 var)
    
    + y_train (7352 obs, 1 var)
    
## 2- Merges the training and the test sets to create one data set.
  
    + Dataset result was named All_Data with 10299 observation and 563 variable

## 3- Extracts only the measurements on the mean and standard deviation for each measurement.

    + Dataset result was named MEAN_STD_Data with 10299 observation and 88 variable

## 4- Uses descriptive activity names to name the activities in the data set
  
    + Numbers in code column of the MEAN_STD_Data was replaced with corresponding activity taken from second column of the _labels variable

## 5- Appropriately labels the data set with descriptive variable names.
code column in MEAN_STD_Data renamed into activities

    + Code column of the MEAN_STD_Data replaced by "Activity"
    + All Acc in column’s name replaced by Accelerometer
    + All Gyro in column’s name replaced by Gyroscope
    + All BodyBody in column’s name replaced by Body
    + All Mag in column’s name replaced by Magnitude
    + All start with character f in column’s name replaced by Frequency
    + All start with character t in column’s name replaced by Time
    
  
## 6- From the data set in step 5, creates a second, independent tidy data set with the average of each variable for each activity and each subject, 

    + Dataset result was named AVAS (Average of each Variable for each Activity and each Subject) with 180 observation and 88 variable
