## Explanation how the skript run_analysis.R works

The raw data can be obtained from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones and should be stored in the working directory.

The skript ``run_analysis.R`` performs the following steps: 

1. Loading and cleaning of the labels of the carried out activities
2. Loading and cleaning of the labels of the features
3. Loading the test and training data and concatenating it with the activity code and the activity 
4. Merging the test and training data and concatenating them with the subject; Creating a file ``tidy_data.txt``
5. Creating a second data set with the average of each variable for each activity and each subject and saving this as ``tidy_data2.txt``

Step 1: The activity labels are lowercased and underscores are removed.

Step 2: Based on the raw features labels features.txt the columns containing the relevant data (mean and std) are determined. Afterwards, the labels are lowercased and brackets are removed to improve readability.

Step 3: Based on step 2, the relevant columns are extracted from the test and training data (mean and std).  Afterwards, a data frame is created containing the activity ID (1-5) and the activity, e.g. standing for all 10,299 rows. 

Step 4: The vector for the subject, the data frame, the training and the test data are merged. This leads to a 10,299 X 68 data frame which is saved as ``tidy_data.txt``. 

Step 5: Using the reshape2 package, the mean per subject and activity is calculated. For this purpose, the data are melted utilizing subject and activity as ids and all other variables as measure variables. Afterwards, the melted data frame is used to calculate the mean for each subject and each activity.   
Since the mean is now the grand mean, the labels are adjusted. The resulting data frame is save as ``tidy_data.2.txt``.  
  
      
