# Source: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

DSX <- rbind(read.table("train/X_train.txt"), read.table("test/X_test.txt"))
DSS <- rbind(read.table("train/subject_train.txt"),read.table("test/subject_test.txt"))
DSY <- rbind(read.table("train/y_train.txt"), read.table("test/y_test.txt"))

features <- read.table("features.txt")
indices_of_good_features <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
DSX <- DSX[, indices_of_good_features]
names(DSX) <- features[indices_of_good_features, 2]
names(DSX) <- gsub("\\(|\\)", "", names(DSX))
names(DSX) <- tolower(names(DSX))

activities <- read.table("activity_labels.txt")
activities[, 2] = gsub("_", "", tolower(as.character(activities[, 2])))
DSY[,1] = activities[DSY[,1], 2]
names(DSY) <- "activity"

names(DSS) <- "Subject"
cleaned <- cbind(DSS, DSY, DSX)
write.table(cleaned, "merged_clean_data.txt")

uniqueSubjects = unique(DSS)[,1]
numSubjects = length(unique(DSS)[,1])
numActivities = length(activities[,1])
numCols = dim(cleaned)[2]
result = cleaned[1:(numSubjects*numActivities), ]

row = 1
for (s in 1:numSubjects) {
  for (a in 1:numActivities) {
    result[row, 1] = uniqueSubjects[s]
    result[row, 2] = activities[a, 2]
    tmp <- cleaned[cleaned$subject==s & cleaned$activity==activities[a, 2], ]
    result[row, 3:numCols] <- colMeans(tmp[, 3:numCols])
    row = row+1
  }
}
write.table(result, "tidyDataSet.txt", row.names = FALSE)