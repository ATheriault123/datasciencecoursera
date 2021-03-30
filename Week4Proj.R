install.packages('dplyr')
install.packages('tidyr')
install.packages('readr')
library(dplyr)
library(tidyr)
library(readr)


features <- read.table("C:/Users/AMThe/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/features.txt", col.names = c('n','functions'))
subtest <- read.table("C:/Users/AMThe/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt", col.names = 'Subject')
subtrain <- read.table("C:/Users/AMThe/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt", col.names = 'Subject')
actlabels <- read.table("C:/Users/AMThe/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt", col.names = c('Labels', 'Activity'))
Xtest = read.table("C:/Users/AMThe/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
Ytest <- read.table("C:/Users/AMThe/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt", col.names = 'Labels')
Xtrain = read.table("C:/Users/AMThe/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
Ytrain <- read.table("C:/Users/AMThe/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt", col.names = 'Labels')

X <- rbind(Xtest, Xtrain)
Y <- rbind(Ytest, Ytrain)
labels <- rbind(subtest, subtrain)
df <- cbind(labels, X, Y)


data <- select(df, Subject, Labels, contains('mean'), contains('std'))
data$Labels <- actlabels[data$Labels, 2]

names(data) <- gsub('.mean', ' Mean ', names(data))
names(data) <- gsub('.gravity', ' Gravity ', names(data))
names(data) <- gsub('Body Body', ' Body ', names(data))
names(data) <- gsub('angle.t', ' Angle Time ', names(data))
names(data) <- gsub('Acc', ' Accelerometer ', names(data))
names(data) <- gsub('Gyro', ' Gyroscope ', names(data))
names(data) <- gsub('Freq', ' Frequency ', names(data))
names(data) <- gsub('Mag', ' Magnitude ', names(data))
names(data) <- gsub('^t', 'Time ', names(data))
names(data) <- gsub('^f', 'Frequency ', names(data))


dp<-data %>% 
  group_by(Subject, Labels) %>%
  summarize_all(funs(mean))

View(dp)
