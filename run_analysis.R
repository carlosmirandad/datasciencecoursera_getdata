########################################################################################################################
# Load relevant files into individual R dataframes
########################################################################################################################

#Location of files (the data is extracted into the working directory and the subdirectories of the zip file are maintained):
sLocationRoot  <- "./UCI HAR Dataset"
sLocationTrain <- "./UCI HAR Dataset/train"
sLocationTest  <- "./UCI HAR Dataset/test"


#Note: According to documentation ("README.txt"), the names of the files mentioned in the instructions above are:
# - 'train/X_train.txt': Training set.
# - 'test/X_test.txt': Test set.
# - 'train/y_train.txt': Training labels.
# - 'test/y_test.txt': Test labels.
# - 'activity_labels.txt': Links the class labels with their activity name.
# - 'features.txt': List of all features.
# - 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
#    (and a similar file exists for the test directory)

##### LOAD ROOT DIRECTORY FILES #####

#Data load: Activity Labels (will be used to add the descriptions of the activities)
con <- file(paste(sLocationRoot, "activity_labels.txt", sep="/"))
datRootActivityLabels <- readLines(con)
datRootActivityLabels <- as.data.frame(matrix(unlist(strsplit(datRootActivityLabels,split=" ")), nrow=length(datRootActivityLabels), byrow=T))
colnames(datRootActivityLabels) <- c("ActivityID","Activity")
close(con)
#print(datRootActivityLabels)

#Data load: Feature Labels  (will be used to give descriprive names to the variables)
con <- file(paste(sLocationRoot, "features.txt", sep="/"))
datRootFeatureLabels <- readLines(con)
datRootFeatureLabels <- as.data.frame(matrix(unlist(strsplit(datRootFeatureLabels,split=" ")), nrow=length(datRootFeatureLabels), byrow=T))
colnames(datRootFeatureLabels) <- c("FeatureID","Feature")
close(con)
#dim(datRootFeatureLabels)  #Found 561 feature labels
#head(datRootFeatureLabels)
#tail(datRootFeatureLabels)


##### LOAD TRAIN DIRECTORY FILES #####

#Data load: subject_train.txt
con <- file(paste(sLocationTrain, "subject_train.txt", sep="/"))
datTrainSubject <- as.data.frame(readLines(con))
close(con)
#dim(datTrainSubject)  #Found 7352 readings
#summary(datTrainSubject)

#Data load: X_train.txt
con <- file(paste(sLocationTrain, "X_train.txt", sep="/"))
datTrainX <- readLines(con)
datTrainXrows <- length(datTrainX)
datTrainX <- unlist(strsplit(datTrainX,split=" "))
datTrainX <- datTrainX[datTrainX != ""]
datTrainX <- as.data.frame(matrix(as.numeric(datTrainX), nrow=datTrainXrows, byrow=T))
close(con)
#dim(datTrainX)  #Found 7352 records x 561 coluns (columns match number of features, rows match number of readings)
#summary(datTrainX)

#Data load: y_train.txt
con <- file(paste(sLocationTrain, "y_train.txt", sep="/"))
datTrainY <- as.data.frame(readLines(con))
close(con)
#dim(datTrainY)      #Found 7352 readings (matching the previous datasets)
#summary(datTrainY)  #Found 6 levels (matching the number of activities)


##### LOAD TEST DIRECTORY FILES #####

#Data load: subject_test.txt
con <- file(paste(sLocationTest, "subject_test.txt", sep="/"))
datTestSubject <- as.data.frame(readLines(con))
close(con)
#dim(datTestSubject)  #Found 2947 test readings
#summary(datTestSubject)

#Data load: X_test.txt
con <- file(paste(sLocationTest, "X_test.txt", sep="/"))
datTestX <- readLines(con)
datTestXrows <- length(datTestX)
datTestX <- unlist(strsplit(datTestX,split=" "))
datTestX <- datTestX[datTestX != ""]
datTestX <- as.data.frame(matrix(as.numeric(datTestX), nrow=datTestXrows, byrow=T))
close(con)
#dim(datTestX)  #Found 2947 records x 561 coluns (columns match number of features, rows match number of test readings)
#summary(datTestX)

#Data load: y_test.txt
con <- file(paste(sLocationTest, "y_test.txt", sep="/"))
datTestY <- as.data.frame(readLines(con))
close(con)
#dim(datTestY)      #Found 2947 readings (matching the previous datasets)
#summary(datTestY)  #Found 6 levels (matching the number of activities)


########################################################################################################################
# Label the training and testing datasets with descriptive variable names
########################################################################################################################


colnames(datTrainSubject) <- c("Subject")
colnames(datTestSubject)  <- c("Subject")
colnames(datTrainY)       <- c("ActivityID")
colnames(datTestY)        <- c("ActivityID")

#Using the descriptive names from the feature list as a starting point (these names will be enhanced a bit more before we save)
colnames(datTrainX)       <- datRootFeatureLabels[,"Feature"]
colnames(datTestX)        <- datRootFeatureLabels[,"Feature"]


########################################################################################################################
# Use descriptive activity names to name the activities in the data set
########################################################################################################################

#TRAINING DATA: Add activity descriptions
datTrainY <- merge(datTrainY, datRootActivityLabels, by="ActivityID") 
#dim(datTrainY)      # 7352 x 2 (OK)
#summary(datTrainY)

#TESTING DATA: Add activity descriptions
datTestY <- merge(datTestY, datRootActivityLabels, by="ActivityID") 
#dim(datTestY)      # 2947 x 2 (OK)
#summary(datTestY)


########################################################################################################################
# Merge the training and the test sets to create one data set.
########################################################################################################################

#TRAINING DATA: Join subject, feature, and activity datasets column-wise
datTrain <- cbind(datTrainSubject, datTrainY, datTrainX)
#dim(datTrain)      # 7352 x 564 (OK)
#summary(datTrain)

#TESTING DATA: Join subject, feature, and activity datasets column-wise
datTest <- cbind(datTestSubject, datTestY, datTestX)
#dim(datTest)      # 2947 x 564 (OK)
#summary(datTest)

#Merge TRAINING+TESTING datasets row-wise
datMaster <- rbind(datTrain, datTest)
#dim(datMaster)  #10299 x  564  (OK)
#summary(datMaster)


########################################################################################################################
# Extracts only the measurements on the mean and standard deviation for each measurement. 
########################################################################################################################

#Search for the variables that contain the mean & standard deviation of each mesurement
varMaster <- colnames(datMaster)
varMean   <- grep("mean", varMaster, ignore.case=T)
varStd    <- grep("std",  varMaster, ignore.case=T)

#Keep only the initial columns (subject & activity) plus the variables identified above (mean & standard deviation)
varNew     <- unique(c(1:3, varMean, varStd))
datMaster2 <- datMaster[, varNew]
#dim(datMaster2)  #10299 x  89  (OK)
#colnames(datMaster2)
#summary(datMaster2)
table(datMaster2$Subject, datMaster2$Activity)


########################################################################################################################
# Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
########################################################################################################################

datAverages <- aggregate(. ~ Subject + ActivityID + Activity, data=datMaster2, FUN=mean, na.rm=T)
#head(datAverages)
#dim(datAverages)

#Improve the names even more, before saving final result
colnames(datAverages) <- c(
    "Subject",
    "ActivityID",
    "Activity",
    "T_mean_BodyAcc_X",
    "T_mean_BodyAcc_Y",
    "T_mean_BodyAcc_Z",
    "T_mean_GravityAcc_X",
    "T_mean_GravityAcc_Y",
    "T_mean_GravityAcc_Z",
    "T_mean_BodyAccJerk_X",
    "T_mean_BodyAccJerk_Y",
    "T_mean_BodyAccJerk_Z",
    "T_mean_BodyGyro_X",
    "T_mean_BodyGyro_Y",
    "T_mean_BodyGyro_Z",
    "T_mean_BodyGyroJerk_X",
    "T_mean_BodyGyroJerk_Y",
    "T_mean_BodyGyroJerk_Z",
    "T_mean_BodyAccMag",
    "T_mean_GravityAccMag",
    "T_mean_BodyAccJerkMag",
    "T_mean_BodyGyroMag",
    "T_mean_BodyGyroJerkMag",
    "F_mean_BodyAcc_X",
    "F_mean_BodyAcc_Y",
    "F_mean_BodyAcc_Z",
    "F_mean_BodyAccFreq_X",
    "F_mean_BodyAccFreq_Y",
    "F_mean_BodyAccFreq_Z",
    "F_mean_BodyAccJerk_X",
    "F_mean_BodyAccJerk_Y",
    "F_mean_BodyAccJerk_Z",
    "F_mean_BodyAccJerkFreq_X",
    "F_mean_BodyAccJerkFreq_Y",
    "F_mean_BodyAccJerkFreq_Z",
    "F_mean_BodyGyro_X",
    "F_mean_BodyGyro_Y",
    "F_mean_BodyGyro_Z",
    "F_mean_BodyGyroFreq_X",
    "F_mean_BodyGyroFreq_Y",
    "F_mean_BodyGyroFreq_Z",
    "F_mean_BodyAccMag",
    "F_mean_BodyAccMagFreq",
    "F_mean_BodyBodyAccJerkMag",
    "F_mean_BodyBodyAccJerkMagFreq",
    "F_mean_BodyBodyGyroMag",
    "F_mean_BodyBodyGyroMagFreq",
    "F_mean_BodyBodyGyroJerkMag",
    "F_mean_BodyBodyGyroJerkMagFreq",
    "T_mean_angleBodyAccMeangravity",
    "T_mean_angleBodyAccJerkMeangravityMean",
    "T_mean_angleBodyGyroMeangravityMean",
    "T_mean_angleBodyGyroJerkMeangravityMean",
    "T_mean_anglegravityMean_X",
    "T_mean_anglegravityMean_Y",
    "T_mean_anglegravityMean_Z",
    "T_std_BodyAcc_X",
    "T_std_BodyAcc_Y",
    "T_std_BodyAcc_Z",
    "T_std_GravityAcc_X",
    "T_std_GravityAcc_Y",
    "T_std_GravityAcc_Z",
    "T_std_BodyAccJerk_X",
    "T_std_BodyAccJerk_Y",
    "T_std_BodyAccJerk_Z",
    "T_std_BodyGyro_X",
    "T_std_BodyGyro_Y",
    "T_std_BodyGyro_Z",
    "T_std_BodyGyroJerk_X",
    "T_std_BodyGyroJerk_Y",
    "T_std_BodyGyroJerk_Z",
    "T_std_BodyAccMag",
    "T_std_GravityAccMag",
    "T_std_BodyAccJerkMag",
    "T_std_BodyGyroMag",
    "T_std_BodyGyroJerkMag",
    "F_std_BodyAcc_X",
    "F_std_BodyAcc_Y",
    "F_std_BodyAcc_Z",
    "F_std_BodyAccJerk_X",
    "F_std_BodyAccJerk_Y",
    "F_std_BodyAccJerk_Z",
    "F_std_BodyGyro_X",
    "F_std_BodyGyro_Y",
    "F_std_BodyGyro_Z",
    "F_std_BodyAccMag",
    "F_std_BodyBodyAccJerkMag",
    "F_std_BodyBodyGyroMag",
    "F_std_BodyBodyGyroJerkMag")

#Save second result
write.csv(file='./Second_Result_Averages.csv', x=datAverages, row.names=FALSE)


