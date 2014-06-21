Codebook for run_analysis.R script.

1. subject: The person in the experiment, given an id number 1-30

2. activity: One of six activities. This is a factor variable.
  1. WALKING
  2. WALKING_UPSTAIRS
  3. WALKING_DOWNSTAIRS
  4. SITTING
  5. STANDING
  6. LAYING

Note: For the remainder of the features, Features are normalized and bounded within [-1,1]. So there are no "units" per se.

3-8. tBodyAcc.(mean/stddev).(XYZ) -- mean of the means and std deviations in the X-Y-Z direction for body linear acceleration in the time domain.

9-14. tGravityAcc.(mean/stddev).(XYZ) -- mean of the means and std deviations in the X-Y-Z direction for gravity acceleration in the time domain.

15-20. tBodyAccJerk.(mean/stddev).(XYZ) -- mean of the means and std deviations in the X-Y-Z direction for body acceleration jerk in the time domain (this is the derivative of the body linear acceleration).

21-26. tBodyGyro.(mean/stddev).(XYZ) -- mean of the means and std deviations in the X-Y-Z direction for the body angular acceleration in the time domain.

27-32. tBodyGyroJerk.(mean/stddev).(XYZ) -- mean of the means and std deviations in the X-Y-Z direction for the body angular acceleration jerk in the time domain (derivative of 21-26).

33-34. tBodyAccMag.(mean/stddev) -- mean of the means and std deviations for the magnitude of the body linear acceleration in the time domain (variable columns 3-8).

35-36. tGravityAccMag.(mean/stddev) --  mean of the means and std deviations for the magnitude of the total gravity acceleration in the time domain (variable columns 9-14).

37-38. tBodyAccJerkMag.(mean/stddev) --  mean of the means and std deviations for the magnitude of the linear body acceleration jerk in the time domain (variable columns 15-20).

39-40. tBodyGyroMag.(mean/stddev) --  mean of the means and std deviations for the magnitude of the body angular acceleration measurements in the time domain (variable columns 21-26).

41-42. tBodyGyroJerkMag.(mean/stddev) -- mean of the means and std deviations for the magnitude of the body angular acceleration jerk measurements (variable columns 27-32).

43-48. fBodyAcc.(mean/stddev).(XYZ) -- mean of the means and std deviations in the X-Y-Z direction for body linear acceleration in the frequency domain (from an FFT).

49-54. fBodyAccJerk.(mean/stddev).(XYZ) -- mean of the means and std deviations in the X-Y-Z direction for body linear acceleration jerk in the frequency domain (from an FFT).

55-60. fBodyGyro.(mean/stddev).(XYZ) -- mean of the means and std deviations in the X-Y-Z direction for body angular acceleration in the frequency domain (from an FFT).

61-62. fBodyAccMag.(mean/stddev) -- mean of the mean and std deviation for the magnitude of linear body acceleration (variable columns 43-48) in the frequency domain (from an FFT).

63-64. fBodyAccJerkMag.(mean/stddev) -- mean of the mean and std deviation for the magnitude of linear body acceleration jerk (variable columns 49-54) in the frequency domain (from an FFT).

65-66. fBodyBodyGyroMag.(mean/stddev) -- mean of the mean and std deviation for the magnitude of body angular acceleration (variable columns 55-60) in the frequency domain (from an FFT).

67-68. fBodyBodyGyroJerkMag.(mean/stddev) -- mean of the mean and std deviation for the magnitude of body angular acceleration jerk in the frequency domain (from an FFT).
