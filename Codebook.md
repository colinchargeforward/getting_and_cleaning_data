#Introduction

The run_analysis.r runs the following 5 steps 
1.Merges the training and the test sets to create one data set.
2.Extracts only the measurements on the mean and standard deviation for each measurement. 
3.Uses descriptive activity names to name the activities in the data set
4.Appropriately labels the data set with descriptive variable names. 
5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#A detailed introduction

1. Merges the training and test sets to create one data set, namely
X_train.txt with X_test.txt -- the result is a 10299 x 561 data frame
y_train.txt with y_test.txt -- the result is a 10299 x 1 data frame
subject_train.txt with subject_test.txt -- the result is a 10299 x 1 data frame

2. Reads file features.txt and extracts only the measurements on the mean and standard deviation for each measurement.
The result is a 10299 x 66 data frame, because only 66 out of 561 attributes are measurements on the mean and standard deviation. 
All measurements appear to be floating point numbers in the range (-1, 1).

3. Reads activity_labels.txt and applies descriptive activity names to name the activities in the data set:
The activities are as follows:
walking,walkingupstairs,walkingdownstairs,sitting,standing,laying

4. The script also appropriately labels the data set with descriptive variable names: 
The 10299x66 data frame containing features is merged with 10299x1 data frames containing activity labels and subject IDs.

The result is saved as tidydata.txt, a 10299x68 data frame such that the first column contains subject IDs, the second column activity names, and the last 66 columns are measurements. 
Names of the attributes are similar to the following:
tBodyAcc-mean()-X,tBodyAcc-mean()-Y,tBodyAcc-mean()-Z,tBodyAcc-std()-X,tBodyAcc-std()-Y,tBodyAcc-std()-Z


5. Finally, the script creates a tidy data set with the average of each measurement for each activity and each subject.
The result is saved as tidydata.txt, a 180x68 data frame,there are 30IDs and 6 acticities for each ID,hence there are 180rows.
