library(data.table)
library(reshape2)

# Loading and cleaning the carried out activities
activity_labels<-read.table("activity_labels.txt")[,2]
activity_labels<-gsub("_", "",activity_labels)
activity_labels<-tolower(activity_labels)

features <- read.table("features.txt")[,2]
selection<-grep("mean[^Freq]|std",features)

features <- gsub("\\(|\\)", "", features)
features <- tolower(features)



# Loading and cleaning the test data

x_test <- read.table("./test/X_test.txt")
y_test <- read.table("./test/y_test.txt")
subject_test <- read.table("./test/subject_test.txt")

names(x_test)<-features
names(subject_test)<-"subject"

x_test2<-x_test[,selection]

y_test[,2]<-activity_labels[y_test[,1]]
names(y_test)<-c("activity_id","activity")

merged_test<-cbind(as.data.table(subject_test),y_test,x_test2)

# Loading and cleaning the train data

x_train <- read.table("./train/X_train.txt")
y_train <- read.table("./train/y_train.txt")
subject_train <- read.table("./train/subject_train.txt")

names(x_train)<-features
names(subject_train)<-"subject"

x_train2<-x_train[,selection]

y_train[,2]<-activity_labels[y_train[,1]]
names(y_train)<-c("activity_id","activity")

merged_train<-cbind(as.data.table(subject_train),y_train,x_train2)


# Creating the overall dataset

merged<-rbind(merged_test,merged_train)

write.table(merged,"tidy_data.txt")

# Dataset with the average of each variable for each activity and each subject: created with the reshape2 package (melt, dcast)

group_labels<- names(merged)[1:3]
data_labels<- names(merged)[4:ncol(merged)]

melting<-melt(merged,id=group_labels,measure.vars=data_labels)

final_data<-dcast(melting,subject + activity ~ variable, mean)
names(final_data)<-gsub("mean","grandmean",names(final_data))

write.table(final_data,"tidy_data2.txt")
