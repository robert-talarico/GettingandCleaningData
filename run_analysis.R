#read the variable names into a dataset called variables and pull only
#those variable names with mean or std in it
library(dplyr)
library(reshape2)
variables<-read.table("test/features.txt")
variables[,2] <- as.character(variables[,2])
names1<-grep(".*mean.*|.*std.*",variables[,2])

#read the training data into R and merge into a dataset called train


xtrain<-read.table("train/X_train.txt")[names1]
ytrain<-read.table("train/y_train.txt")
ytrain<-rename(ytrain, Activity=V1)
subject_train<-read.table("train/subject_train.txt")
subject_train<-rename(subject_train,ID=V1)
xytrain<-cbind(xtrain, ytrain)
train<-cbind(xytrain,subject_train)

##read the testing data into R and merge into a dataset called test


xtest<-read.table("test/X_test.txt")[names1]
ytest<-read.table("test/y_test.txt")
ytest<-rename(ytest, Activity=V1)
subject_test<-read.table("test/subject_test.txt")
subject_test<-rename(subject_test, ID=V1)
xytest<-cbind(xtest,ytest)
test<-cbind(xytest,subject_test)

#use rbind to merge the train and test datasets together

data<-rbind(train,test)

##recode the levels of the activity variable from integers
#to the descriptive activity name

data$Activity <- factor(data$Activity,
                           levels = c(1,2,3,4,5,6),
                           labels = c("Walking", "Walking_Upstairs", "Walking_Downstairs",
                                      "Sitting","Standing","Laying"))

##clean up the variable names and merge the 
#descriptive variable names into the dataset

var_names<-variables[names1,2]
var_names<-gsub("-","",var_names)
var_names<-sub("mean","Mean",var_names)
var_names<-sub("std","Std",var_names)
var_names<-gsub('[()]',"",var_names)
names(data)[1:79]<-var_names

# melt the data into the narrow form and then compute the average of 
# each measurement for each activity and for each subject. The dataset
# data3 is tidy and in the wide form 

data2<-melt(data,id=c("Activity","ID"),measure.vars=1:79)
data3<-dcast(data2,Activity+ID~variable,mean)
View(data3)

write.table(data3,file='data3.txt',row.name=FALSE)
































