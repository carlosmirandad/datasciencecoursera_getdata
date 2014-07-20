CodeBook.md
========================================================

This document is part of the final project submission for the Coursera class "Getting and Cleaning Data" organized by John Hopkins University. The purpose of this document is to describe the variables, the data, and any transformations or work that I performed to clean up the data.  

***

## Final Deliverable  

File "Second_Result_Averages.csv" contains the final deliverable of this project: this is a tidy data set that can be used for analysis and it was created according to the instructions in the project description.  

***

## Variable Description  

The final dataset in the project contains the following 89 variables:

|#|Variable Name|Type|Variable Description|Metric type|
|---|---|---|---|---|
|1|Subject|factor|Identifier of the person performing the exercise|Grouping|
|2|ActivityID|factor|Identifier of the activity performed (1 – 6)|Grouping|
|3|Activity|factor|Description of the activity|Grouping|
|4|T_mean_BodyAcc_X|numeric|Average of mean measurements for Body Acceleration on the X direction|Time domain signal (t)|
|5|T_mean_BodyAcc_Y|numeric|Average of mean measurements for Body Acceleration on the Y direction|Time domain signal (t)|
|6|T_mean_BodyAcc_Z|numeric|Average of mean measurements for Body Acceleration on the Z direction|Time domain signal (t)|
|7|T_mean_GravityAcc_X|numeric|Average of mean measurements for Gravity Acceleration on the X direction|Time domain signal (t)|
|8|T_mean_GravityAcc_Y|numeric|Average of mean measurements for Gravity Acceleration on the Y direction|Time domain signal (t)|
|9|T_mean_GravityAcc_Z|numeric|Average of mean measurements for Gravity Acceleration on the Z direction|Time domain signal (t)|
|10|T_mean_BodyAccJerk_X|numeric|Average of mean measurements for Jerk Signal derived from Body Acceleration on the X direction|Time domain signal (t)|
|11|T_mean_BodyAccJerk_Y|numeric|Average of mean measurements for Jerk Signal derived from Body Acceleration on the Y direction|Time domain signal (t)|
|12|T_mean_BodyAccJerk_Z|numeric|Average of mean measurements for Jerk Signal derived from Body Acceleration on the Z direction|Time domain signal (t)|
|13|T_mean_BodyGyro_X|numeric|Average of mean measurements for Gyroscope on the X direction|Time domain signal (t)|
|14|T_mean_BodyGyro_Y|numeric|Average of mean measurements for Gyroscope on the Y direction|Time domain signal (t)|
|15|T_mean_BodyGyro_Z|numeric|Average of mean measurements for Gyroscope on the Z direction|Time domain signal (t)|
|16|T_mean_BodyGyroJerk_X|numeric|Average of mean measurements for Jerk Signal derived from Gyroscope on the X direction|Time domain signal (t)|
|17|T_mean_BodyGyroJerk_Y|numeric|Average of mean measurements for Jerk Signal derived from Gyroscope on the Y direction|Time domain signal (t)|
|18|T_mean_BodyGyroJerk_Z|numeric|Average of mean measurements for Jerk Signal derived from Gyroscope on the Z direction|Time domain signal (t)|
|19|T_mean_BodyAccMag|numeric|Average of mean measurements for Magnitude of Body Acceleration|Time domain signal (t)|
|20|T_mean_GravityAccMag|numeric|Average of mean measurements for Magnitude of Gravity Acceleration|Time domain signal (t)|
|21|T_mean_BodyAccJerkMag|numeric|Average of mean measurements for Magnitude of Jerk Signal derived from Body Acceleration|Time domain signal (t)|
|22|T_mean_BodyGyroMag|numeric|Average of mean measurements for Magnitude of Gyroscope|Time domain signal (t)|
|23|T_mean_BodyGyroJerkMag|numeric|Average of mean measurements for Magnitude of Jerk Signal derived from Gyroscope|Time domain signal (t)|
|24|F_mean_BodyAcc_X|numeric|Average of mean measurements for Body Acceleration on the X direction|Frequency domain signal (f)|
|25|F_mean_BodyAcc_Y|numeric|Average of mean measurements for Body Acceleration on the Y direction|Frequency domain signal (f)|
|26|F_mean_BodyAcc_Z|numeric|Average of mean measurements for Body Acceleration on the Z direction|Frequency domain signal (f)|
|27|F_mean_BodyAccFreq_X|numeric|Average of mean measurements for Body Acceleration (weighted average of frequency components) on the X direction|Frequency domain signal (f)|
|28|F_mean_BodyAccFreq_Y|numeric|Average of mean measurements for Body Acceleration (weighted average of frequency components) on the Y direction|Frequency domain signal (f)|
|29|F_mean_BodyAccFreq_Z|numeric|Average of mean measurements for Body Acceleration (weighted average of frequency components) on the Z direction|Frequency domain signal (f)|
|30|F_mean_BodyAccJerk_X|numeric|Average of mean measurements for Jerk Signal derived from Body Acceleration on the X direction|Frequency domain signal (f)|
|31|F_mean_BodyAccJerk_Y|numeric|Average of mean measurements for Jerk Signal derived from Body Acceleration on the Y direction|Frequency domain signal (f)|
|32|F_mean_BodyAccJerk_Z|numeric|Average of mean measurements for Jerk Signal derived from Body Acceleration on the Z direction|Frequency domain signal (f)|
|33|F_mean_BodyAccJerkFreq_X|numeric|Average of mean measurements for Jerk Signal derived from Body Acceleration  (weighted average of frequency components) on the X direction|Frequency domain signal (f)|
|34|F_mean_BodyAccJerkFreq_Y|numeric|Average of mean measurements for Jerk Signal derived from Body Acceleration  (weighted average of frequency components) on the Y direction|Frequency domain signal (f)|
|35|F_mean_BodyAccJerkFreq_Z|numeric|Average of mean measurements for Jerk Signal derived from Body Acceleration  (weighted average of frequency components) on the Z direction|Frequency domain signal (f)|
|36|F_mean_BodyGyro_X|numeric|Average of mean measurements for Gyroscope on the X direction|Frequency domain signal (f)|
|37|F_mean_BodyGyro_Y|numeric|Average of mean measurements for Gyroscope on the Y direction|Frequency domain signal (f)|
|38|F_mean_BodyGyro_Z|numeric|Average of mean measurements for Gyroscope on the Z direction|Frequency domain signal (f)|
|39|F_mean_BodyGyroFreq_X|numeric|Average of mean measurements for Gyroscope  (weighted average of frequency components) on the X direction|Frequency domain signal (f)|
|40|F_mean_BodyGyroFreq_Y|numeric|Average of mean measurements for Gyroscope  (weighted average of frequency components) on the Y direction|Frequency domain signal (f)|
|41|F_mean_BodyGyroFreq_Z|numeric|Average of mean measurements for Gyroscope  (weighted average of frequency components) on the Z direction|Frequency domain signal (f)|
|42|F_mean_BodyAccMag|numeric|Average of mean measurements for Magnitude of Body Acceleration|Frequency domain signal (f)|
|43|F_mean_BodyAccMagFreq|numeric|Average of mean measurements for Magnitude of Body Acceleration (weighted average of frequency components)|Frequency domain signal (f)|
|44|F_mean_BodyBodyAccJerkMag|numeric|Average of mean measurements for Magnitude of Jerk Signal derived from Body Acceleration|Frequency domain signal (f)|
|45|F_mean_BodyBodyAccJerkMagFreq|numeric|Average of mean measurements for Magnitude of Jerk Signal derived from Body Acceleration  (weighted average of frequency components)|Frequency domain signal (f)|
|46|F_mean_BodyBodyGyroMag|numeric|Average of mean measurements for Magnitude of Gyroscope|Frequency domain signal (f)|
|47|F_mean_BodyBodyGyroMagFreq|numeric|Average of mean measurements for Magnitude of Gyroscope  (weighted average of frequency components)|Frequency domain signal (f)|
|48|F_mean_BodyBodyGyroJerkMag|numeric|Average of mean measurements for Magnitude of Jerk Signal derived from Gyroscope|Frequency domain signal (f)|
|49|F_mean_BodyBodyGyroJerkMagFreq|numeric|Average of mean measurements for Magnitude of Jerk Signal derived from Gyroscope  (weighted average of frequency components)|Frequency domain signal (f)|
|50|T_mean_angleBodyAccMeangravity|numeric|Average of mean measurements for Angle between Body Acceleration and Gravity|Time domain signal (t)|
|51|T_mean_angleBodyAccJerkMeangravityMean|numeric|Average of mean measurements for Angle between Jerk Signal derived from Body Acceleration and Gravity|Time domain signal (t)|
|52|T_mean_angleBodyGyroMeangravityMean|numeric|Average of mean measurements for Angle between Gyroscope direction and Gravity|Time domain signal (t)|
|53|T_mean_angleBodyGyroJerkMeangravityMean|numeric|Average of mean measurements for Angle between Jerk Signal derived from Gyroscope and Gravity|Time domain signal (t)|
|54|T_mean_anglegravityMean_X|numeric|Average of mean measurements for Angle between Coordinate and Gravity on the X direction|Time domain signal (t)|
|55|T_mean_anglegravityMean_Y|numeric|Average of mean measurements for Angle between Coordinate and Gravity on the Y direction|Time domain signal (t)|
|56|T_mean_anglegravityMean_Z|numeric|Average of mean measurements for Angle between Coordinate and Gravity on the Z direction|Time domain signal (t)|
|57|T_std_BodyAcc_X|numeric|Average of std measurements for Body Acceleration on the X direction|Time domain signal (t)|
|58|T_std_BodyAcc_Y|numeric|Average of std measurements for Body Acceleration on the Y direction|Time domain signal (t)|
|59|T_std_BodyAcc_Z|numeric|Average of std measurements for Body Acceleration on the Z direction|Time domain signal (t)|
|60|T_std_GravityAcc_X|numeric|Average of std measurements for Gravity Acceleration on the X direction|Time domain signal (t)|
|61|T_std_GravityAcc_Y|numeric|Average of std measurements for Gravity Acceleration on the Y direction|Time domain signal (t)|
|62|T_std_GravityAcc_Z|numeric|Average of std measurements for Gravity Acceleration on the Z direction|Time domain signal (t)|
|63|T_std_BodyAccJerk_X|numeric|Average of std measurements for Jerk Signal derived from Body Acceleration on the X direction|Time domain signal (t)|
|64|T_std_BodyAccJerk_Y|numeric|Average of std measurements for Jerk Signal derived from Body Acceleration on the Y direction|Time domain signal (t)|
|65|T_std_BodyAccJerk_Z|numeric|Average of std measurements for Jerk Signal derived from Body Acceleration on the Z direction|Time domain signal (t)|
|66|T_std_BodyGyro_X|numeric|Average of std measurements for Gyroscope on the X direction|Time domain signal (t)|
|67|T_std_BodyGyro_Y|numeric|Average of std measurements for Gyroscope on the Y direction|Time domain signal (t)|
|68|T_std_BodyGyro_Z|numeric|Average of std measurements for Gyroscope on the Z direction|Time domain signal (t)|
|69|T_std_BodyGyroJerk_X|numeric|Average of std measurements for Jerk Signal derived from Gyroscope on the X direction|Time domain signal (t)|
|70|T_std_BodyGyroJerk_Y|numeric|Average of std measurements for Jerk Signal derived from Gyroscope on the Y direction|Time domain signal (t)|
|71|T_std_BodyGyroJerk_Z|numeric|Average of std measurements for Jerk Signal derived from Gyroscope on the Z direction|Time domain signal (t)|
|72|T_std_BodyAccMag|numeric|Average of std measurements for Magnitude of Body Acceleration|Time domain signal (t)|
|73|T_std_GravityAccMag|numeric|Average of std measurements for Magnitude of Gravity Acceleration|Time domain signal (t)|
|74|T_std_BodyAccJerkMag|numeric|Average of std measurements for Magnitude of Jerk Signal derived from Body Acceleration|Time domain signal (t)|
|75|T_std_BodyGyroMag|numeric|Average of std measurements for Magnitude of Gyroscope|Time domain signal (t)|
|76|T_std_BodyGyroJerkMag|numeric|Average of std measurements for Magnitude of Jerk Signal derived from Gyroscope|Time domain signal (t)|
|77|F_std_BodyAcc_X|numeric|Average of std measurements for Body Acceleration on the X direction|Frequency domain signal (f)|
|78|F_std_BodyAcc_Y|numeric|Average of std measurements for Body Acceleration on the Y direction|Frequency domain signal (f)|
|79|F_std_BodyAcc_Z|numeric|Average of std measurements for Body Acceleration on the Z direction|Frequency domain signal (f)|
|80|F_std_BodyAccJerk_X|numeric|Average of std measurements for Jerk Signal derived from Body Acceleration on the X direction|Frequency domain signal (f)|
|81|F_std_BodyAccJerk_Y|numeric|Average of std measurements for Jerk Signal derived from Body Acceleration on the Y direction|Frequency domain signal (f)|
|82|F_std_BodyAccJerk_Z|numeric|Average of std measurements for Jerk Signal derived from Body Acceleration on the Z direction|Frequency domain signal (f)|
|83|F_std_BodyGyro_X|numeric|Average of std measurements for Gyroscope on the X direction|Frequency domain signal (f)|
|84|F_std_BodyGyro_Y|numeric|Average of std measurements for Gyroscope on the Y direction|Frequency domain signal (f)|
|85|F_std_BodyGyro_Z|numeric|Average of std measurements for Gyroscope on the Z direction|Frequency domain signal (f)|
|86|F_std_BodyAccMag|numeric|Average of std measurements for Magnitude of Body Acceleration|Frequency domain signal (f)|
|87|F_std_BodyBodyAccJerkMag|numeric|Average of std measurements for Magnitude of Jerk Signal derived from Body Acceleration|Frequency domain signal (f)|
|88|F_std_BodyBodyGyroMag|numeric|Average of std measurements for Magnitude of Gyroscope|Frequency domain signal (f)|
|89|F_std_BodyBodyGyroJerkMag|numeric|Average of std measurements for Magnitude of Jerk Signal derived from Gyroscope|Frequency domain signal (f)|


***

## Data Sources  

These are the input files that were used as source for this project based on the instructions:
- **Train set:** 'train/X_train.txt'
- **Test set:** 'test/X_test.txt'
- **Training labels:** 'train/y_train.txt'
- **Test labels:** 'test/y_test.txt'
- **Activity labels:** 'activity_labels.txt' (Links the class labels with their activity name.)
- **Feature List:** 'features.txt'
- **Subject Lists (2):** 'subject_train.txt' (Each row identifies the subject who performed the activity for each window sample. Two lists exist: one for the Train set and another one for the Test set.)

***

## Data Processing  

The following are the data processing, transformation, and summarization steps that were performed in order to generate the final deliverable. The R code that implements these steps is in file "run_analysis.R".    

**1. Loaded all the input files in R Dataframes.** These were the steps followed for that purpose: Read the text of the file into a character vector, split the lines using spaces as separators, removed empty values (if they existed), converted the resulting vector to a matrix with the same number of rows than the input file, and finally transformed the matrix into an R data frame. These steps were followed for all input files individually.  
**2. Labeled the datasets with descriptive variable names.** For the train and test feature datasets, I used the descriptions imported from the "features.txt" file as a starting point, and then I improved upon those names (before saving the final results) in order to make those names easier to read and understand. For the rest of the files I assigned my own descriptive names.  
**3. Added descriptive names to name the activities in the data set.** Used the activity descriptions imported from the "activity_labels.txt"   
 file.  Merged those descriptions with the exercise data joining by activity ID.  
**4. Integrated all the training and testing datasets into one master dataset.** Joined the subject, feature, and activity datasets column-wise. Then joined the resulting training and testing datasets row-wise. The result was a master dataset with 10299 rows x 564 columns.  
**5. Extracted the measurements on the mean and standard deviation for each measurement.**  Identified those measurement based on the descriptive variable names. Removed all the unnecesary columns from the dataset.  Kept only the grouping factors (subject & activity) plus the variables requested by the project instructions (mean & standard deviation metrics.)  The result was a master dataset with 10299 rown x  89 columns.  
**6. Created a second, independent tidy data set with the average of each variable for each activity and each subject.**  Aggregated the data by subject and activity (as grouping factors) and applied a mean function to all the remaining fields in the dataset.  
**7. Saved the result.**  The final deliverable was saved as "Second_Result_Averages.csv"   

***
