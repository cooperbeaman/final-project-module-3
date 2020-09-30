##preparation

library(dplyr)

##get the dataset
fname<-"getdata_projectfiles_UCI HAR Dataset.zip"

##check if the dataset zip exists
if (!file.exists(fname)){
        furl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(furl, fname, method="curl")
}  

##check if the "UCI HAR Dataset" folder exists
if (!file.exists("UCI HAR Dataset")) { 
        unzip(fname) 
}

##assign data frames (assuming dataset zip file already unzipped and folder
##within is in the same working directory as the run_analysis.R script)

features<-read.table("UCI HAR Dataset/features.txt",col.names=c("n","functions"))
activities<-read.table("UCI HAR Dataset/activity_labels.txt",col.names=c("code","activity"))
subject_test<-read.table("UCI HAR Dataset/test/subject_test.txt",col.names="subject")
x_test<-read.table("UCI HAR Dataset/test/X_test.txt",col.names=features$functions)
y_test<-read.table("UCI HAR Dataset/test/y_test.txt",col.names="code")
subject_train<-read.table("UCI HAR Dataset/train/subject_train.txt",col.names="subject")
x_train<-read.table("UCI HAR Dataset/train/X_train.txt",col.names=features$functions)
y_train<-read.table("UCI HAR Dataset/train/y_train.txt",col.names="code")

##part 1 (Merges the training and the test sets to create one data set.)

x<-rbind(x_train,x_test)
y<-rbind(y_train,y_test)
subject<-rbind(subject_train,subject_test)
merged<-cbind(subject,y,x)

##part 2 (Extracts only the measurements on the mean and standard deviation for 
##each measurement.)

meansd<-merged%>%select(subject,code,contains("mean"),contains("std"))

##part 3 (Uses descriptive activity names to name the activities in the data 
##set)

meansd$code<-activities[meansd$code,2]

##part 4 (Appropriately labels the data set with descriptive variable names.)

names(meansd)[2]<-"activity"
names(meansd)<-gsub("Acc","Accelerometer",names(meansd))
names(meansd)<-gsub("Gyro","Gyroscope",names(meansd))
names(meansd)<-gsub("BodyBody","Body",names(meansd))
names(meansd)<-gsub("Mag","Magnitude",names(meansd))
names(meansd)<-gsub("^t","Time",names(meansd))
names(meansd)<-gsub("^f","Frequency",names(meansd))
names(meansd)<-gsub("tBody","TimeBody",names(meansd))
names(meansd)<-gsub("-mean()","Mean",names(meansd),ignore.case=TRUE)
names(meansd)<-gsub("-std()","SD",names(meansd),ignore.case=TRUE)
names(meansd)<-gsub("-freq()","Frequency",names(meansd),ignore.case=TRUE)
names(meansd)<-gsub("angle","Angle",names(meansd))
names(meansd)<-gsub("gravity","Gravity",names(meansd))

##part 5 (From the data set in step 4, creates a second, independent tidy data 
##set with the average of each variable for each activity and each subject.)

fdata<-meansd %>%
        group_by(subject,activity) %>%
        summarize_all(list(mean))
write.table(fdata,"fdata.txt",row.name=FALSE)