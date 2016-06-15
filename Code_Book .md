#Code Book

To avoid redundancy, the following passages only include the amendments to the original code book. Furthermore, the units of the variables are provided. For more detailed information, please refer to http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones or the ``readme.txt`` file. 

###Variables
* Subject (integer): The identifier of the subject which ranges from 1 to 30
* Activity (character): The carried out activity: “laying”, “sitting”, “standing”, “walking”, “walkingdownstairs”, and “walkingupstairs”  
* tbodyacc-xyz
* tgravityacc-xyz
* tbodyaccjerk-xyz
* tbodygyro-xyz
* tbodygyrojerk-xyz
* tbodyaccmag
* tgravityaccmag
* tbodyaccjerkmag
* tbodygyromag
* tbodygyrojerkmag
* fbodyacc-xyz
* fbodyaccjerk-xyz
* fbodygyro-xyz
* fbodyaccmag
* fbodyaccjerkmag
* fbodygyromag
* fbodygyrojerkmag

Note: 
* '-xyz' is used to denote 3-axial signals in the X, Y and Z directions. 
* The acceleration variables (containing “acc” in the label) are measured in gravity units, i.e. in relation to 9.81 m/s^2.
* The gyroscopic variables (containing “gyro” in the label) are measured in radian per second.

For all the 33 numeric variables, the mean and the standard deviation are extracted. The file ``tidy_data.txt`` consists of 10,299 observations. This file is consolidated by taking the average of each variable for each activity and each subject. This lead to the file ``tidy_data2.txt`` containing 180 rows (5 activities for 30 subjects each).
  



