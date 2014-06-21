##Tyler Byers
##Getting and Cleaning Data
##Coursera Course Project
##21 June 2014

------
###PROJECT DESCRIPTION (from project instructions page):
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

 You should create one R script called run_analysis.R that does the following. 
Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement. 
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names. 
Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
Good luck!

--------
###MY PROJECT

As instructed, I created a run_analysis.R script to complete this project.

Please see the script, which has fairly good documentation for each section of code.  Below is what I did "in general".
1. Loaded the list of the features. Created a variable `featureNames` to hold the features list. Pre-pended this list with `activity`, `subject`, and `datatype` variables (the datatype variable holds whether the data is from the testing or training data set).
2. Loaded the activity key 
3. Loaded the training data set
  1. Load the X_train and subject_train data sets.
  2. Load the Y_train data set.
  3. Within the `ytrain` data frame, create new variable that takes the activity number and converts it to an activity name using the activity key.
  4. Combine the subject_train, activity name, datatype, and xtrain data into a single data frame.
  5. Set the variable names in data frame to be the ones that we set in list item 1.
4. Repeat step 3, but with the test data set.
5. Merge the two data sets using an `rbind` command.
6. Filter out all the columns that aren't `mean` or `std`.  Also filtered out the `meanFreq` columns, which took an extra step since the `grep` command grabbed the `meanFreq` columns.
7. Create new data frame with only the `subject`, `activity`, and `mean` and `std` variables.
8. Fix the names to take out the special characters.  This operation created some double dot (..) characters, so had to replace those as well.
  * In class we talked about taking dots out of variable names. I sort of disagree, and left them in because it makes reading the variable names easier IMHO, especially with so many closely-related variables.
9. Create new set vectors of the subjects and activities.  Will use this in the next step.
10. Looping through each combination of subject and activity, the for-loop creates subsets of the data for each combination, then takes the mean of every single column.  
  * Because I use an `lapply` function, it also tried to take the mean of the activity names, which doesn't work, so at the end of the loop I have to add back in the activity name.
  * This operation creates a new data frame (colMeans).  I then either create a `dataOutput` data frame if it doesn't exist, or rbind colMeans to dataOutput.  
11. Finally the script writes out the `dataOutput` data frame to a text file, removing row names.
