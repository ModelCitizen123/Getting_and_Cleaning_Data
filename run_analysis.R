library(plyr)

# 1 Merge the training and test sets to create one data set

X_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")

X_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")

# create 'x' dataset
X_dataset <- rbind(X_train, X_test)

# create 'y' dataset
y_dataset <- rbind(y_train, y_test)

# create 'subject' data set
subject_dataset <- rbind(subject_train, subject_test)

# 2 Extract only the measurements on the mean and standard deviation for each measurement

features <- read.table("features.txt")

# get only values with mean or std in their names
features_mean_and_std <- grep("-(mean|std)\\(\\)", features[, 2])

# subset the desired values
X_dataset <- X_dataset[, features_mean_and_std]

# correct the column names
names(X_dataset) <- features[features_mean_and_std, 2]

# 3 Use descriptive activity names to name the activities in the data set

activity_labels <- read.table("activity_labels.txt")

# update values with correct activity names
y_dataset[, 1] <- activity_labels[y_dataset[, 1], 2]

# update column name to activity for activity_labels dataset
# changed activities to activity so that it is singular like subject
names(y_dataset) <- "activity"

# 4 Appropriately label the data set with descriptive variable names

# update column name to subject for subject dataset
names(subject_dataset) <- "subject"

# combined all the data in a single data set
combined_dataset <- cbind(X_dataset, y_dataset, subject_dataset)

# 5 Create a second, independent tidy data set with the average of each variable for each activity and each subject

# There are 68 columns and 1:66 are the values but the last last two column are activity and subject
# split them on subject and activity where the function is the colMeans of values 1:66
combined_dataset_average <- ddply(combined_dataset, .(subject, activity), function(x) colMeans(x[, 1:66]))

write.table(combined_dataset_average, "data_averages_by_subject_and_activity.txt", row.name=FALSE)