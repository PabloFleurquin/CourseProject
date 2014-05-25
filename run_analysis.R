# Loading Data
setwd("~/Desktop/Coursera/DataScience/02GettingCleaningData/CourseProject01")
Xtest<-read.table("X_test.txt")
Ytest<-read.table("y_test.txt")
Xtrain<-read.table("X_train.txt")
Ytrain<-read.table("y_train.txt")
VarNames0<-as.vector(t(read.table("features.txt")[2]))

# Cleaning Variables names
VarNames<-tolower(gsub("\\(|\\)|,|-|_","", VarNames0))

# Giving data a header
names(Xtest)   <-VarNames
names(Xtrain)  <-VarNames
names(Ytest)   <-"subject"
names(Ytrain)  <-"subject"

# Binding data
Test<-cbind(Xtest,Ytest)
Train<-cbind(Xtrain,Ytrain)
CompleteDataset<-rbind(Test,Train)

# Create a dataset with the mean for each measurment for each subject
MeanDataset<-aggregate(CompleteDataset[,1:length(CompleteDataset)-1],
                 by=list(CompleteDataset$subject), mean)

# Write Complete file to CSV
write.table(CompleteDataset,file="CompleteData.txt",sep=",",row.names=FALSE)
write.table(MeanDataset,file="SamsungMeanData.txt",sep=",",row.names=FALSE)