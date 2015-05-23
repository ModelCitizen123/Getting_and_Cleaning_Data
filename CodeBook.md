#CodeBook.md

###Overview
The script run_analysis.R does the 5 steps listed in the Coursera Getting and Cleansing Data class project.  See the README for description of the code

###Description
The code first loaded and then merges the X, y and sample training and test data.  The datasets are filter for content, labeled and combined in a way that displays the averages by subject and activity.

###Variables
**X_train**, **y_train**, **X_test**, **y_test**, **subject_train** and **subject_test** contain the data from the downloaded files of the same name.
**X_dataset**, **y_dataset** and **subject_dataset** merge the previous training and test datasets.
**features** has the correct names for the X_dataset data, which are used with the column names in **features_mean_and_std**, a numeric vector that can be used to subset the previous data to get only the values we want.
**activites_lables** contains the activity data and is applied to the column names of the y_dataset.
**subject** contains the subject data header info and is applied to the column names of the subject_dataset.
**combined_dataset** contains combination of the X_dataset, y_dataset and subject_dataset in a big dataset.
**combined_dataset_average contains** the related averages by subject and activities which is later output to the file **data_averages_by_subject_and_activity.txt**
