x_training <- read.csv("UCI HAR Dataset/train/X_train.txt", sep="", header=FALSE)
y_training <- read.csv("UCI HAR Dataset/train/Y_train.txt", sep="", header=FALSE)
subject_training <- read.csv("UCI HAR Dataset/train/subject_train.txt", sep="", header=FALSE)

x_testing <- read.csv("UCI HAR Dataset/test/X_test.txt", sep="", header=FALSE)
y_testing <- read.csv("UCI HAR Dataset/test/Y_test.txt", sep="", header=FALSE)
subject_testing <- read.csv("UCI HAR Dataset/test/subject_test.txt", sep="", header=FALSE)

##create 'x' data set
x <- rbind(x_training, x_testing)

##create 'y' data set
y <- rbind(y_training, y_testing)

##create 'subject' data set
subject <- rbind(subject_training, subject_testing)

##Step 2
##Extract only the measurements on the mean and standard deviation for each measurement

features <- read.csv("UCI HAR Dataset/features.txt", sep="", header=FALSE)

##get only columns with mean() or std() in their names
mean_std_features <- grep("-(mean|std)\\(\\)", features[, 2])

##subset the desired columns
x <- x[, mean_std_features]

##correct the column names
names(x) <- features[mean_std_features, 2]

##Step 3
##Use descriptive activity names to name the activities in the data set

activities <- read.csv("UCI HAR Dataset/activity_labels.txt", sep="", header=FALSE)

##update values with correct activity names
y[, 1] <- activities[y[, 1], 2]

##correct column name
names(y) <- "activity"

##Step 4
##Appropriately label the data set with descriptive variable names

##correct column name
names(subject) <- "subject"

##bind all the data in a single data set
all_data <- cbind(x, y, subject)

##Step 5
##Create a second, independent tidy data set with the average of each variable
##for each activity and each subject
library(plyr)
tidydata <- ddply(all_data, .(subject, activity), function(x) colMeans(x[, 1:66]))

write.table(tidydata, "tidydata.txt", row.name=FALSE)
