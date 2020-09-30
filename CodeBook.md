## Instructions
The code book should describe:
1. the variables 
2. the data
3. any transformations or work that you performed to clean up the data

## Code Book
This run_analysis.R script first prepares the environment with the required packages and raw dataset.
It then tidies the downloaded data in accordance with the 5 requirements outlined in the Instructions:

## Preparation
1. The dplyr package is loaded into the library
2. The dataset zip file is downloaded and then its contents unzipped to the folder "UCI HAR Dataset"
3. Each .txt file in the dataset is assigned to a corresponding variable:
* features<-features.txt: 561 rows x 2 columns: The features within this file come from accelerometer (tAcc-XYZ) and gyroscope 3-axial (tGyro-XYZ) raw signals 
* activities<-activity_labels.txt: 6 rows x 2 columns: Contains the activities performed when measurements were taken and their codes (i.e. labels)
* subject_test<-test/subject_test.txt: 2947 rows x 1 column: Contains test data from 9/30 volunteer test subjects
* x_test<-test/X_test.txt: 2947 rows x 561 columns: Contains recorded features test data
* y_test<-test/y_test.txt: 2947 rows x 1 column: Contains activity code label's test data
* subject_train<-train/subject_train.txt: 7352 rows x 1 column: Contains training data from 21/30 volunteer subjects
* x_train<-train/X_train.txt: 7352 rows x 561 columns: Contains recorded features training data
* y_train<-train/y_train.txt: 7352 rows x 1 column: Contains activity code label's training data


## 1. Merges the training and the test sets to create one data set


## 2. Extracts only the measurements on the mean and standard deviation for each measurement


## 3. Uses descriptive activity names to name the activities in the data set


## 4. Appropriately labels the data set with descriptive variable names


## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

