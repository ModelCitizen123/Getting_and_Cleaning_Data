# Getting_and_Cleaning_Data
Coursera - Getting and Cleaning Data

###Contents
This project contains 3 files inaddition to the readme.
+ **CodeBook.md** - explains the steps in the R code file 
+ **run_analysis.R** - an R program that takes in data from the source below and merges the data from the test and training, combined the metadata about the data (subjects and activities), collects the means and stdev and outputs the averages of those to a text file
+ **data_averages_by_subject_and_activity.txt** - is the text output of the R code run_analysis.R

###What the code does
1. First the code loads the data from the source text files using *read.table()*.  The training and test data for each is combined using *rbind()*.  This can be done because the is similar, it contain the same number of column and the values are related or have the same entities as the raw data.
1. Secondly the **features** of the data (the items captured in the column data) is turned into a numeric vector (**features_mean_and_std**) that is used to subset the **X_dataset**.  It is also used to provide names using *names()* for the **X_dataset**.
1. Next the **activity_labels** data is loaded from the source text file and applied to the columns of the **y_dataset** using *names()*.  
1. Then similarly to the activities (y_dataset) the **subject** data is loaded and applied to the **subjects_dataset**.  The data from the features, activities and subjects are then merged using *cbind()*.  This fills the column 1:66 with data and leaves the activity and subject columns at the end, which makes the next step more orderly and logical to process.
1. Finally we create a grouped dataset using *ddply()* with activity and subject as the group and use the *colMean()* function applied to all of the columns 1:66 to get the average data for the combined set.  This produces a table by subject and activity which has the correct column labels of each feature.  This data is saved to a txt file.

###Source Data
The source of this project uses comes from this URL.  
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#

#####The credit for generating and publishing this data set goes to:  
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.
