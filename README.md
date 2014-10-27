### Point 1
1. Reads the training and test data sets from "X_train.txt" and "X_test.txt"
2. Combines them using "rbind"" function on a single data frame.

### Point 2
1. Reads all the features from "features.txt"
2. Filters just those for mean and std using the function "grep"", which returns the index of a matching criteria. 
3. Combine the indexes for mean and std on a single vector and sorts it using "sort"
3. Uses the index vector to extract the data.

### Point 3
1. Reads the traning and test labels from "Y_train.txt" and "Y_test.txt"
2. Appends an extra column call "activity" with the labels using "cbind"
3. Replaces the integer values assigned to each label with a more understandable one. Example, label=1 with "ActWalk".

### Point 4
1. Removes the characters "()" from the features names read on the point 1.1 using "gsub"
2. Renames the column's names with edited features names using the function "colnames"

### Point 5
1. Reads the training and test subjest from "subject_train.txt"" and "subject_test.txt"" files and combines them on a single vector.
2. Uses the function "aggregate" to calculate the mean of the data set aggregated by activity and subject
3. Renames the column name for activity and subject.
4. Saves the result on a .txt file using write.table


