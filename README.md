=========================================
These datasets were created for an assignment for the Johns Hopkins University "Getting and Cleaning Data" course on Coursera using the Human Activity Recognition Using Smartphones Dataset.
Ownership for original dataset is credited for in the next two sections. Information from their README file was used to help give context to the data set. 
Please go to this URL for more infromation: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
The purpose of this assignment was to create two datasets. One dataset that contains only the means and standard deviation data columns from the Human Activity Recognition Using Smartphones Dataset. 
And then, using the first dataset, take the means of each column by activity type from the Human Activity Recognition Using Smartphones Dataset

You can use the below two commands to read the datasets. 
write.table(selected_data, "means_data.txt")
write.table(aggregate_data_by_activity_type, "aggregate_mean_data_by_activity_type.txt")

These datasets meet the following criteria as described in the coursera lecture:
1. Each variable is in one columns
2. Each different observation is in each row
3. There is one table for each "kind" of variable

=========================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
=========================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

The dataset includes the following files:
=========================================

- 'README.txt'

- 'Code_Book.txt': Describes each variable for both dataset used on the feature vector.

The following data sets. Their descriptions are equivalent. 

- 'means_data.txt': This is mean and standard deviation data columns from the X_train.txt and  X-test.txt from the SmartLab Human Activity Recognition Using Smartphones Dataset

- 'aggregate_mean_data_by_activity_type.txt': This is the means of each column by activty type. The activty type column is the row combination of the y_train.txt and y_text.txt data from the SmartLab Human Activity Recognition Using Smartphones Dataset

Process for creating the datasets:
=========================================
Here is an headlevel overview of what I did to create the two datasets. For the R Code, please see run_analysis.R script. 

means_data.txt
Frist, I read the dataset into R and combine the the x_train.txt and x_test.txt by rows.

Second, using the freatures.txt list, I gather the a list of columns for the contain the means and standard deviation.

Third, using means and standard deviation list, I get an index list from the combined dataset then select the data using those index numbers.

Last, I add columns names to the dataset.


First, I add the acitivty type column and subject ID which is a row combination of y_train.txt and y_text.txt and subject_train.txt and subject_test.txt respectively to the means_data dataset.

Second, I aggregate the data by activty type and subject and take the column means for each variable

Last, I round the 7th digits place for the means and standarrd deviations columns, so each comlumn has the same number of digits
