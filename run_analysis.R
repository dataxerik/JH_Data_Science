#This script assumes that the text files are in the current working directory
#Reads the files of the x train and test data sets from
train_x_data = read.table("X_test.txt")
test_x_data = read.table("X_train.txt")

#Reads the files that contain the activity type for corresponding dataset
train_y_data = read.table("y_test.txt")
test_y_data = read.table("y_train.txt")

#subject name list
train_subject_data = read.table("subject_test.txt")
test_subject_data = read.table("subject_train.txt")

#I get the full dataset by row binding the train test for the x and y data sets
raw_complete_dataset <- rbind(train_x_data, test_x_data)
complete_activity_type_col <- rbind(train_y_data, test_y_data)
colnames(complete_activity_type_col) <- c("activityType")
complete_subject_type_col <- rbind(train_subject_data, test_subject_data)
colnames(complete_subject_type_col) <- c("subjectID")

#I want only the mean or standard deviation columns from the x data set, so I get all the columns
#from the features.txt provided by dataset.
complete_feature_list <- readLines("features.txt")

#I search for row indexes with text containig mean or std, and using that index list, I get the names
#of the columns from the feature.txt text I've read in earlier. But, each column as numeric prefix, so
#I remove those using a regex expresion
mean_and_std_feature_list_index <- grep('-mean|-std', complete_feature_list, ignore.case=TRUE)
raw_mean_feature_list <- complete_feature_list[mean_and_std_feature_list_index]
names <- c(gsub("[0-9].* ", "", raw_mean_feature_list))

#I'm using the row index to select the desired columns from the complete dataset
selected_data <- raw_complete_dataset[,mean_and_std_feature_list_index]
colnames(selected_data) <- names

#The second part of the assignment ask to take the mean for each columns grouped by activity type
selected_data_with_activity_type <- cbind(selected_data, complete_activity_type_col, complete_subject_type_col)
aggregate_data_by_activity_type <- aggregate(selected_data_with_activity_type[,-c(80,81)], 
                                             list(selected_data_with_activity_type[,c(81)], selected_data_with_activity_type[,c(80)]), 
                                             mean)
aggregate_data_by_activity_type <- round(aggregate_data_by_activity_type, digits=7)
colnames(aggregate_data_by_activity_type)[c(1,2)] <- c("subjectID", "activityType")
aggregate_data_by_activity_type[aggregate_data_by_activity_type$activityType==1,2]="Walking"
aggregate_data_by_activity_type[aggregate_data_by_activity_type$activityType==2,2]="Walking_Upstairs"
aggregate_data_by_activity_type[aggregate_data_by_activity_type$activityType==3,2]="Walking_Downstairs"
aggregate_data_by_activity_type[aggregate_data_by_activity_type$activityType==4,2]="Sitting"
aggregate_data_by_activity_type[aggregate_data_by_activity_type$activityType==5,2]="Standing"
aggregate_data_by_activity_type[aggregate_data_by_activity_type$activityType==6,2]="Laying"



write.table(selected_data, "means_data.txt", row.names = FALSE)
write.table(aggregate_data_by_activity_type, "aggregate_mean_data_by_activity_type.txt",  row.names = FALSE)