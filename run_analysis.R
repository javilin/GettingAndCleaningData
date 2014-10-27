# Point 1
trainingSet = read.table("train/X_train.txt", stringsAsFactors=FALSE)
testSet = read.table("test/X_test.txt", stringsAsFactors=FALSE)
mergedSet = rbind(trainingSet, testSet)

# Point 2
features = read.table("features.txt", stringsAsFactors = FALSE)
meanIndex = grep("mean()",features$V2, fixed=TRUE)
stdIndex = grep("std()",features$V2, fixed=TRUE)
index = sort(c(meanIndex,stdIndex))
meanAndStdSet = mergedSet[,index]

# point 3
trainingLabels = read.table("train/Y_train.txt", stringsAsFactors=FALSE)
testLabels = read.table("test/Y_test.txt", stringsAsFactors=FALSE)
meanAndStdSet = cbind(activity=c(trainingLabels$V1, testLabels$V1),meanAndStdSet)
meanAndStdSet$activity[meanAndStdSet$activity==1] = "ActWalk"
meanAndStdSet$activity[meanAndStdSet$activity==2] = "ActWalkUpstairs"
meanAndStdSet$activity[meanAndStdSet$activity==3] = "ActWalkDownstairs"
meanAndStdSet$activity[meanAndStdSet$activity==4] = "ActSitting"
meanAndStdSet$activity[meanAndStdSet$activity==5] = "ActStanding"
meanAndStdSet$activity[meanAndStdSet$activity==6] = "ActLaying"

#point 4
colnames = features[index,]$V2
colnames = gsub("()","",colnames,fixed=TRUE)
colnames(meanAndStdSet) = c("activity",colnames)

#point 5
trainingSubject  = read.table("train/subject_train.txt", stringsAsFactors=FALSE)$V1
testSubject  = read.table("test/subject_test.txt", stringsAsFactors=FALSE)$V1
meanAndStdSet$subject = c(trainingSubject, testSubject)

tidySet = aggregate(meanAndStdSet[,colnames],by=list(meanAndStdSet$activity,meanAndStdSet$subject),mean)
names(tidySet)[names(tidySet)=="Group.1"] = "activity"
names(tidySet)[names(tidySet)=="Group.2"] = "subject"
write.table(meanAndStdSet,"tidyData.txt",row.name=FALSE)

