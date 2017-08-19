# Clear workspace, load libraries
rm(list=ls())
library(dplyr)

setwd("~/Study/2017/coursera/3_cleaningdata/project/RawData/UCI HAR Dataset/")
dir <- getwd()
# Load train data
trainX <- read.table(paste(dir,"/train/X_train.txt", sep =""))
trainy <- read.table(paste(dir,"/train/y_train.txt", sep =""))
subject_train <- read.table(paste(dir,"/train/subject_train.txt", sep =""))

# Load test data
testX <- read.table(paste(dir,"/test/X_test.txt", sep =""))
testy <- read.table(paste(dir,"/test/y_test.txt", sep =""))
subject_test <- read.table(paste(dir,"/test/subject_test.txt", sep =""))

# Load activities labels
activity_labels <- read.table("activity_labels.txt")
features <- read.table("features.txt")
#Load variables names

# 1. Append test to train data
measurements <- rbind(trainX, testX)
subjects <- rbind(subject_train,subject_test)
colnames(subjects)<-c("subject")
activities <- rbind(trainy,testy)
colnames(activities)<-c("activity_id")

full_data <- cbind(measurements,subjects,activities)

# 2. Extract only mean and std of the measurments and add subjects
meanstd_data <- full_data[,grep("mean\\(|std\\(", features$V2)]
meanstd_data <- cbind(meanstd_data,subjects,activities)

# 3. Add activities and rename them with activities namesnames
meanstd_data = merge(meanstd_data,activity_labels, by.x = "activity_id", by.y = "V1")
names(meanstd_data)[names(meanstd_data) == "V2.y"] <- "activity"
#delete activity_id
meanstd_data <- meanstd_data[,-1]

# 4. Label variables with names from features dataset 
var_names <- as.vector(features[grep("mean\\(|std\\(", features$V2),2])
var_names <- c(var_names,"subject","activity")
colnames(meanstd_data) <- var_names

# 5. Group variable by activity ans subject and compute mean 
meanstd_data <- as.tbl(meanstd_data)
meanstd_data_grouped <- meanstd_data  %>% group_by(subject,activity)
mean_meanstd_data <- summarize_all(meanstd_data_grouped,mean)

setwd("~/Study/2017/coursera/3_cleaningdata/project/")
write.table(mean_meanstd_data, file = "tidy_data.txt",row.name=FALSE)

# Remove temporate data
#rm(list = ls()[ls()!="meanstd_data" & ls()!="mean_meanstd_data"])
