# Getting and Cleaning Data Project
## by Héctor Soto P. 
## Evaluation criteria: "The README that explains the analysis files is clear and understandable".

# The purpose

The purpose of this project is to demonstrate the ability to:
- collect, 
- work with, and 
- clean a data set. 

The goal is to prepare tidy data that can be used for later analysis.

Is required to submit: 
1) a tidy data set as described below, 
2) a link to a Github repository with your script for performing the analysis, and 
3) a code book that describes:

   3.1) the variables,
   
   3.2) the data, and
   
   3.3) any transformations or work that was performed to clean up the data called CodeBook.md. 

It should also include a README.md in the repo with the scripts. This repo explains how all of the scripts work and how they are connected.

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# Explanation the analysis file

I had create a R script called *run_analysis.R* that does the following

1- Merges the training and the test sets to create one data set.

2- Extracts only the measurements on the mean and standard deviation for each measurement.

3- Uses descriptive activity names to name the activities in the data set

4- Appropriately labels the data set with descriptive variable names.

5- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


