GettingAndCleaningData
======================

## Script run_analysis.R
	
The cleaning and getting data script (run_analysis.R) is written to do the following:
	
1. Merge the training and the test sets to create one data set.
2. Extract only the measurements on the mean and standard deviation for each measurement. 
3. Use descriptive activity names to name the activities in the data set
4. Appropriately label the data set with descriptive activity names. 
5. Create a second, independent tidy data set with the average of each variable for each activity and each subject. 

To run `run_analysis.R` simply change workspace to the folder where this file is. Then run it. There should be no errors and file `cleaned_data.txt` should be produced.
## How code works
1. Loads test and train data via subject, x, y sets.
2. Changes labels for columns of subject, x, y sets.
3. Changes numbers of y (acivityvalue) to activity labels.
4. Merges all test data together.
5. Merges all train data together.
6. Merges test and train data together.
7. Retrieves only subject, y, mean and standard deviation columns.
8. Mean is calculated for all columns grouped by subjectid and y(activityvalue)
9. Result is saved to clean.txt

## Other files
1. codebook - codebook.md
2. folder with raw data - data
3. readme file - README.md
4. result file - clean.txt
