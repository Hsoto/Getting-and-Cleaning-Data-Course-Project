
# This script does the following.


# 1- Get the data from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
# 2- Merges the training and the test sets to create one data set.
# 3- Extracts only the measurements on the mean and standard deviation for each measurement.
# 4- Uses descriptive activity names to name the activities in the data set
# 5- Appropriately labels the data set with descriptive variable names.
# 6- From the data set in step 5, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Library to use
library(dplyr)

# Step by step
# 
# 1- Get the data (and create de datasets to work)
filename <- "personal_exercise_activity.zip"

fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

download.file(fileURL, filename, method = "curl")

unzip(filename)

## 1.1 Create datasets
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("ID","Var.feature"))
activities_labels <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "name.activity"))
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$Var.feature)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$Var.feature)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")

# 2- Merges the training and the test sets to create one data set.
subject <- rbind(subject_train, subject_test)
X <- rbind(x_train, x_test)
Y <- rbind(y_train, y_test)

All_Data <- cbind(subject, Y, X)

# 3- Extracts only the measurements on the mean and standard deviation for each measurement.

MEAN_STD_Data <- All_Data %>%
                  select(subject, code, contains("mean"), contains("std")) %>%
                  arrange(subject, code)

# 4- Uses descriptive activity names to name the activities in the data set

MEAN_STD_Data$code <- activities_labels[MEAN_STD_Data$code, 2]

# 5- Appropriately labels the data set with descriptive variable names.

names(MEAN_STD_Data)[2] <- "Activity"
names(MEAN_STD_Data)<-gsub("Acc", "Accelerometer", names(MEAN_STD_Data))
names(MEAN_STD_Data)<-gsub("Gyro", "Gyroscope", names(MEAN_STD_Data))
names(MEAN_STD_Data)<-gsub("BodyBody", "Body", names(MEAN_STD_Data))
names(MEAN_STD_Data)<-gsub("Mag", "Magnitude", names(MEAN_STD_Data))
names(MEAN_STD_Data)<-gsub("^t", "Time", names(MEAN_STD_Data))
names(MEAN_STD_Data)<-gsub("^f", "Frequency", names(MEAN_STD_Data))
names(MEAN_STD_Data)<-gsub("tBody", "TimeBody", names(MEAN_STD_Data))
names(MEAN_STD_Data)<-gsub("-mean()", "Mean", names(MEAN_STD_Data), ignore.case = TRUE)
names(MEAN_STD_Data)<-gsub("-std()", "STD", names(MEAN_STD_Data), ignore.case = TRUE)
names(MEAN_STD_Data)<-gsub("-freq()", "Frequency", names(MEAN_STD_Data), ignore.case = TRUE)
names(MEAN_STD_Data)<-gsub("angle", "Angle", names(MEAN_STD_Data))
names(MEAN_STD_Data)<-gsub("gravity", "Gravity", names(MEAN_STD_Data))

# 6- From the data set in step 5, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
# Average of each Variable for each Activity and each Subject == AVAS

AVAS <- MEAN_STD_Data %>%
        group_by(subject, Activity) %>%
        summarise_all(list(mean = mean))

write.table(AVAS, "AVAS.txt", row.name=FALSE)


