# Tyler Byers
# Coursera, Getting and Cleaning Data 
# Course Project
# June 2014

# Load the features, which will be consistent across both data sets
features <- read.table('UCI HAR Dataset/features.txt',
                       colClasses = 'character')

# The initial names for the features
featureNames <- c('subject', 'activity', 'datatype', features$V2)

# Load the key to the activities (1-6)
activityKey <- read.table('UCI HAR Dataset/activity_labels.txt')

# Load the training set
xTrain <- read.table('UCI HAR Dataset/train/X_train.txt')
subjTrain <- read.table('UCI HAR Dataset/train/subject_train.txt')
yTrain <- read.table('UCI HAR Dataset/train/y_train.txt')
yTrain$Activity <- activityKey[with(yTrain, match(V1, activityKey$V1)),2]
yTrain$trainortest <- 'Train'
xTrain <- cbind(subjTrain, yTrain$Activity, yTrain$trainortest, xTrain)
names(xTrain) <- featureNames

# Load the test set
xTest <- read.table('UCI HAR Dataset/test/X_test.txt')
subjTest <- read.table('UCI HAR Dataset/test/subject_test.txt')
yTest <- read.table('UCI HAR Dataset/test/y_test.txt')
yTest$Activity <- activityKey[with(yTest, match(V1, activityKey$V1)), 2]
yTest$trainortest <- 'Test'
xTest <- cbind(subjTest, yTest$Activity, yTest$trainortest, xTest)
names(xTest) <- featureNames

# Combine the two data sets into one long data set
data <- rbind(xTest, xTrain)

# Grabs the column numbers for the mean and std dev columns
means <- grep('mean', names(data))
stds <- grep('std', names(data))
meanFreqs <- grep('meanFreq', names(data))
means <- setdiff(means, meanFreqs)  # Removes "meanFreqs" columns
meansAndStds <- sort(union(means,stds))
neededCols <- c(1,2,meansAndStds)

# Create a smaller data set with means and std devs only
dataMeanStd <- data[,neededCols]
fixedNames <- make.names(names(dataMeanStd))

# Fix the names -- remove characters like '-' and '()'
names(dataMeanStd) <- fixedNames

# Now take out the double periods created in the above operation
names(dataMeanStd) <- gsub('\\.\\.','', names(dataMeanStd))

# Change the 'std' in the names to 'stddev' 
names(dataMeanStd) <- gsub('std', 'stddev', names(dataMeanStd))

# Create a sorted list of the subjects
all_subjs <- sort(union(dataMeanStd$subject, dataMeanStd$subject[1]))

# Create a list of the activities
activities <- activityKey$V2

# dataOutput will be the output data frame.  Need to make sure we're starting
#  empty.
if(exists('dataOutput')) {
    rm(dataOutput)
}

# Loop through each subject and each activity and find the mean 
#  for each column.
for(subj in all_subjs) {
    for(acty in activities) {
        colmeans <- data.frame(lapply(subset(dataMeanStd, 
                                          subject == subj & 
                                              activity == acty), mean))
        # Warnings thrown when trying to average the activity strings. 
        # Need to rename the activity back to the actual activity name
        colmeans$activity <- acty
        # Create our data frame if it doesn't exist
        if(!exists('dataOutput')){
            dataOutput <- colmeans
        }
        else { # Otherwise add a new row to the bottom of the data frame
            dataOutput <- rbind(dataOutput, colmeans)
        }
    }
}

# Write the tidied data to a file
write.table(dataOutput, 'tidied_fitness_data.txt', row.names = FALSE)
