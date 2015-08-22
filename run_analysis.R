#The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. 
#The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers 
#on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data 
#set as described below, 2) a link to a Github repository with your script for performing the analysis, 
#and 3) a code book that describes the variables, the data, and any transformations or work that you performed 
#to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. 
#This repo explains how all of the scripts work and how they are connected.  

#One of the most exciting areas in all of data science right now is wearable computing - 
#see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to 
#develop the most advanced algorithms to attract new users. The data linked to from the 
#course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. 
#A full description is available at the site where the data was obtained: 
  
#  http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

#Here are the data for the project: 
  
#  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

#download the data to our working directory, this was done before and manually placed as its a larger uniqe dataset
#analyzied the data set there first

#download the data into tables
#commented out as this takes a while and for testing easier to load in once than running through each time
TestSub = read.table("./DownloadedData/UCI HAR Dataset/test/subject_test.txt",header=FALSE)
TestX = read.table("./DownloadedData/UCI HAR Dataset/test/X_test.txt",header=FALSE)
TestY = read.table("./DownloadedData/UCI HAR Dataset/test/Y_test.txt",header=FALSE)

TrainSub = read.table("./DownloadedData/UCI HAR Dataset/train/subject_train.txt",header=FALSE)
TrainX = read.table("./DownloadedData/UCI HAR Dataset/train/X_train.txt",header=FALSE)
TrainY = read.table("./DownloadedData/UCI HAR Dataset/train/Y_train.txt",header=FALSE)

#to understand the data set see photo taken of data structure 
# taken from https://class.coursera.org/getdata-008/forum/thread?thread_id=24
#this explains the dataset and gives a clear picture of where the x/y axis is of the 
#data set, i saved a picture of it to my desktop and used it to understand how to bind the data

#1.) Merges the training and the test sets to create one data set.

#merge the items by rows first
#x with x, y with y, sub test with sub train
XData <- rbind(TestX,TrainX) #features
YData <- rbind(TestY,TrainY) #activity
SubData <- rbind(TestSub,TrainSub) #subject

#name them
names(SubData)<-c("subject")
names(YData)<- c("activity")

#read the features names
FeaturesNames = read.table("./DownloadedData/UCI HAR Dataset/features.txt",header=FALSE)
head(FeaturesNames)
#apply to the Xdata, only the 2nd column
names(XData)<- FeaturesNames$V2

#all data
Combined1 <- cbind(SubData, YData)
AllData <- cbind(XData, Combined1) #all data is our entire merged dataset

#2.) Extracts only the measurements on the mean and standard deviation for each measurement. 
#first check the data, notice that in the names there is mean() and std() thats what we want...
#some googling indicated we need to use the grep() function

#this shows we have loads of cols, want to save last 2, (subject & activity and all that contain mean() & std())
head(AllData) 

#first get a T/F list of the cols that are consistent with what we want, we only want to look at the features cols
print(FeaturesNames) #see that only want 2nd col i.e V2
#this works, cannot find why the syntax is so... investigate later
WantedNames <- FeaturesNames$V2[grep("mean\\(\\)|std\\(\\)", FeaturesNames$V2)]
#need to add in subject & activity, again syntax, need the wanted names as char...
WantedNames <- c(as.character(WantedNames), "subject", "activity" )
#now subset the data based on the wanted names...
WantedData <- subset(AllData,select=WantedNames)

#3. Uses descriptive activity names to name the activities in the data set
activityLabels <- read.table("./DownloadedData/UCI HAR Dataset/activity_labels.txt"),header = FALSE)
#applying this to activity col in the WantedData col
#this modifies the $activity col in our table, its applying the activity labels,
#activityLabels[WHAT WE WANT TO APPLY IT TO, THE ACTIVITY COL, WHAT COL FROM ACTIVITYLABELS WE WANT TO GRAB LOOKUPTO]
WantedData$activity <- activityLabels[WantedData$activity, 2]

#4. Appropriately labels the data set with descriptive variable names.
names(WantedData)<-gsub("^t", "time", names(WantedData))
names(WantedData)<-gsub("^f", "frequency", names(WantedData))
names(WantedData)<-gsub("Acc", "Accelerometer", names(WantedData))
names(WantedData)<-gsub("Gyro", "Gyroscope", names(WantedData))
names(WantedData)<-gsub("Mag", "Magnitude", names(WantedData))
names(WantedData)<-gsub("BodyBody", "Body", names(WantedData))

library(plyr);
Data2<-aggregate(. ~subject + activity, WantedData, mean)
Data2<-Data2[order(Data2$subject,Data2$activity),]
write.table(Data2, file = "tidydata.txt",row.name=FALSE)
