# Loading Data
setwd("~/Desktop/Coursera/DataScience/02GettingCleaningData/CourseProject01")
Xtest<-read.table("X_test.txt")
Ytest<-read.table("y_test.txt")
Xtrain<-read.table("X_train.txt")
Ytrain<-read.table("y_train.txt")
SubjectTest<-read.table("subject_test.txt")
SubjectTrain<-read.table("subject_train.txt")
VarNames0<-as.vector(t(read.table("features.txt")[2]))

# Cleaning Variables names
VarNames<-tolower(gsub("\\(|\\)|,|-|_","", VarNames0))

# Giving data a header and descriptive activity names
names(Xtest)        <-VarNames
names(Xtrain)       <-VarNames
names(Ytest)        <-"activity"
names(Ytrain)       <-"activity"
names(SubjectTrain) <-"subject"
names(SubjectTest)  <-"subject"
factor(Ytest,levels=c(1,2,3,4,5,6),
       labels=c("walking","walking_up","walinkg_down","sitting","standing","laying"))
factor(Ytrain,levels=c(1,2,3,4,5,6),
       labels=c("walking","walking_up","walinkg_down","sitting","standing","laying"))

# Binding data
Test<-cbind(SubjectTest,Ytest,Xtest)
Train<-cbind(SubjectTrain,Ytrain,Xtrain)
CompleteDataset<-rbind(Test,Train)

# Create a dataset with the mean for each measurment for each subject
MeanDataset<-aggregate(CompleteDataset[,2:length(CompleteDataset)],
                 by=list(CompleteDataset$subject,CompleteDataset$activity), mean)

# Write Complete file to CSV
write.table(CompleteDataset,file="CompleteData.txt",sep=",",row.names=FALSE)
write.table(MeanDataset,file="SamsungMeanData.txt",sep=",",row.names=FALSE)