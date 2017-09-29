# Programming-Assignment-Course-3

This assignment utilizes the Human Activity Recognition Data Set described below.
==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit‡ degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

Here is a link to the data set:
https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#

The script run_analysis.R performs the following function to create two tidy data sets:
 - loads and merges the training and test data sets into one data set.  Each data set consists of 3 files that are all merged.
 - replaces the column names from the features.txt file
 - replaces the activity number codes with the activity names from the activity_labels.txt file
 - prunes the columns to only include columns related to mean and standard deviation
This ends up with a tidy data set.

In addition, further analysis is done and written out in a tidy.txt file.
 - The above data set is grouped by subject and activity
 - the mean of each column is calculated by subject/activity pairs
 - the resulting data table is written out to a file names 'tidy.txt'
 
