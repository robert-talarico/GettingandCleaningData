# GettingandCleaningData
Programming Assignment
The following README.md file contains the ordered steps of the Programming assignment for the Getting and Cleaning Data Assignment which is part of the Data Scientists Specialization with R on Coursera. The data was collected from the accelerometers of Samsung Galaxy 5 smartphones.

1. Read the text file with the variable names into a dataset called variables and extract only those variables names with the words mean or std in them.
2. Read the training and test datasets into R and merge. These consist of a x_test and x_train file which contains the accelerometer values, a y_test and y_train file which contains the activity values and suject_test and subject_train which contains the subject ID's.
3. Relabel the activity labels from integers to descrptive labels highlighting the actual movement behaviour.
4. Clean up the variable names and give the variables there appropriate descrptive labels.
5. Melt the dataset to obain a narrow dataset with ID and Activity as columns along with all the other variables in a single column named variable and a column containing there respective value. Compute the average of each activity for each ID in the wide tidy data form 
