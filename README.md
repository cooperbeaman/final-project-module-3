## Files Information
* CodeBook.md describes the variables, the data, and any transformations or work that I performed to clean up the data
* run_analysis.R first prepares the environment with the required packages and raw dataset files. It then tidies the downloaded data in accordance with the 5 requirements outlined in the Instructions:
  1. Merges the training and the test sets to create one data set.
  2. Extracts only the measurements on the mean and standard deviation for each measurement.
  3. Uses descriptive activity names to name the activities in the data set
  4. Appropriately labels the data set with descriptive variable names.
  5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
* fdata.txt is the exported tidy data set created by the run_analysis.R script from the raw files in the initial "UCI HAR Dataset" folder
