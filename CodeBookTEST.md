{\rtf1\ansi\ansicpg1252\cocoartf1347\cocoasubrtf570
{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
\margl1440\margr1440\vieww17120\viewh14160\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural

\f0\fs24 \cf0 Introduction\
The script run_analysis.R performs the 5 steps described in the course project's definition.\
\
1. Read in the various data sets\
2. Merge the training and test sets into 3 variables\
3. Name the activity & subject dataset\
4. Read in the features names and apply it to the X data, only on the 2nd column\
5. Get all the data together into "AllData"\
6. To get the mean & std only need to use grep function to filter out the wanted names\
7. Apply these to the AllData\
8. Read in the activity labels and apply it to the "activity" column \
9. Label the data set with descripitive variable names\
10. Create the tidydata.txt data set thats the mean of the data, for the subject & activity\
\
\
Variables\
\
TestSub = subject #'s for TestX\
TestX = raw data\
TestY = activity info for TestX & Test Sub\
TrainSub = subject #'s for TestX\
TrainX = raw data\
TrainY = activity info for TestY & Train Sub\
XData = combined x data\
YData = combined y data\
SubData = combined sub data\
FeaturesNames = data from the features.txt data in the dataset, applied to xData\
Combined1 = used in first stem of combining all the data\
AllData = self explanitory, all the data\
WantedNames = used to filter out the names we want\
WantedData = subset of AllData, this is what we want to analyize\
activityLabels = data from the activity_labels.txt, applied to the "activity" column in the wanted data\
TidyData = final data set that we want to use to creat the tidydata.txt\
\
}