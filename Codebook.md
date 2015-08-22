# Introduction
Codebook

1. Read in the various data sets
2. Merge the training and test sets into 3 variables
3. Name the activity & subject dataset
4. Read in the features names and apply it to the X data, only on the 2nd column
5. Get all the data together into "AllData"
6. To get the mean & std only need to use the grep fucntion to filter out the wanted names
7. Apply these to the AllData
8. Read in the activity labels and apply it to the "activity" column
9. Label the data set with descriptive variable names
10. Create the tidydata.txt data set thats the mean of the data, for the subject & activity

#Variables
TestSub = subject #'s for TestX
TestX = raw data
TestY = activity info for TestX & Test sub
TrainX = raw data
Train Y = activity infor for TestY and Train Sub
XData = combined x data
YData = combined y data
SubData = combined sub data
FeaturesNames = data from the features.txt data in the dataset, applied to x data
Combined1 = used in the first step of combining all the data
AllData = all the data together
WantedNames = used to filter out the names we want
WantedData = subset of AllData, this is what we want to analyize
activityLabels = data from the activity_labels.txt file, applied to the "activity" column in the wanted data
TidyData = final data set that we want to use to create the tidydata.txt file

test...
