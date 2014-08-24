## Folders
trainFolder <- "data/UCI HAR Dataset/train"
testFolder <- "data/UCI HAR Dataset/test"
rootFolder <- "data/UCI HAR Dataset"
## import train data
xTrain <- read.table(paste(trainFolder,"/X_train.txt", sep=""))
yTrain <- read.table(paste(trainFolder,"/y_train.txt", sep=""))
subjectTrain <- read.table(paste(trainFolder,"/subject_train.txt", sep=""))

## import test data
xTest <- read.table(paste(testFolder,"/X_test.txt", sep=""))
yTest <- read.table(paste(testFolder,"/y_test.txt", sep=""))
subjectTest <- read.table(paste(testFolder,"/subject_test.txt", sep=""))

## import names
names <- read.table(paste(rootFolder,"/features.txt", sep=""))
names <- names$V2

## assign names to datasets
colnames(xTest) <- names
colnames(xTrain) <- names

colnames(yTest) <- c("activityvalue")
colnames(yTrain) <- c("activityvalue")

colnames(subjectTest) <- c("subjectid")
colnames(subjectTrain) <- c("subjectid")

# assign labels to y instead of numeric values.
activityLabels <- read.table(paste(rootFolder,"/activity_labels.txt", sep=""))
activityLabels = tolower(levels(activityLabels$V2))

yTrain$activityvalue = factor(yTrain$activityvalue,labels = activityLabels)
yTest$activityvalue = factor(yTest$activityvalue, labels = activityLabels)

# Merge train related data to trainData & merge test related data to testData
trainData = cbind(xTrain, subjectTrain, yTrain)
testData = cbind(xTest, subjectTest, yTest)

# Merge train and test data into one data set
data <- rbind(trainData, testData)

# Clean data
# extract mean, standard deviation, subjectid and activityvalue
cleanData <- data[grep("mean|std|subjectid|activityvalue",names(data),value=TRUE)]
# clean names
cleanNames = gsub("\\(|\\)|-|,", "", names(cleanData))
names(cleanData) <- tolower(cleanNames)
# aggregate data grouped by subjectid and activityvalue
aggregatedCleanData <- aggregate(formula = . ~ subjectid + activityvalue,data = cleanData, FUN=mean, na.rm=TRUE)

write.table(aggregatedCleanData, "clean.txt", sep="\t",row.names = FALSE, quote = FALSE, append=FALSE)
