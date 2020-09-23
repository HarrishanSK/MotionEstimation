-README FILE-----------------------------------------------------------------------------------------------------------------------------------------------
Introduction to Computer Vision (ICV) - Queen Mary University of London
Mini Project on Motion Estimation, Predicting the next frame of a video and Counting the number of moving vehicles in a video %%%%%%%%%%%%%%%%%%%%%%%%%

Author: Harrishan Sureshkumar

For this project I have organized my code in the form of MatLab code sections.
The code can be found in the file main.m

I have made a total of 22 matlab functions which are used in the file main.m.
Please make sure all the functions used are in the same directory as main.m before
running the code. All code and functions have been annotated and documented appropriately 
in the code after the "%" symbol.


Instructions:
Each code section can be run by clicking it and pressing CTRL+Enter once the code 
section is highlighted in yellow.Each Code section is named and these names will be referred to 
when referencing each code section. Each name is written at the start of each code 
section after the the "%%" symbol. 
Please be aware that all code sections must be run in order starting from top to bottom for code 
to be run properly. Note: Datasets A,B and C provided on the QMplus website for this module must be present in the
/code folder for the code to work.

Run the cell named "Clear Workspace" if the workspace is not already clear.

Task 1:
1a)- First run the cell named "Task 1a Get Dataset". Wait till execution is complete.
	-This will load the video from Dataset C into the variable "vid"
	-It will also split each frame in the video and store them seperately in the current 
	 directory in the folder called DatasetCFrames to be used later
   - Secondly run the cell named "Task 1a Motion Estimation"
	-This should output the answer to Task 1a

1b)-Run the code section named "Task 1b Predict Image using motion vectors"
	-This should output the answer to Task 1b. 
        -Outputs frame i + 1 and its predicted frame in 2 seperate figures for
	 comparison

1c)-Each of the following code sections will output each part of the answer for different block sizes
   -Run the code section named "Task 1c Block size 4, Window size 16"
   -Run the code section named "Task 1c Block size 8, Window size 16"
   -Run the code section named "Task 1c Block size 16, Window size 16"

1d)-Each of the following code sections will output each part of the answer for different window sizes
   -Run the code section named "Task 1d Block size 8, Window size 8"
   -Run the code section named "Task 1d Block size 8, Window size 16"
   -Run the code section named "Task 1d Block size 8, Window size 32"

1e)-Run the code section named "Task 1e Graph Plots"
	-This should output 2 graphs in 2 different figures.


Task 2:
2a)-Run the code section named "Task 2a Frame Differencing without threshold" to see difference video
   -Run the code section named "Task 2a Selected Frames without threshold" to see outputs in report
   -Run the code section named "Task 2a Frame Differencing with threshold" to see difference video
   -Run the code section named "Task 2a Selected Frames with threshold" to see outputs in report

2b)-Run the code section named "Task 2b Frame Differencing without threshold" to see difference video
   -Run the code section named "Task 2b Selected Frames without threshold"  to see outputs in report
   -Run the code section named "Task 2b Frame Differencing with threshold where reference image is previous 
    frame"  to see difference video
   -Run the code section named "Task 2b Selected Frames with threshold" to see outputs in report

2c)-Run the code section named "Task 2c Background" to get the background image.

2d)-Run the code section named "Task 2d Count Moving Objects in Video"
	- Uses background calculated from 2c as reference image
	-Performs Connected Components Algorithm to count moving objects in video
	-Outputs live video of original video and differnced output with live count of objects per frame
	 and a barplot after the video is completed.

    -(Optional)Run the code section named "2d Count Moving Objects in Video 2"
	- Uses previous frame as reference image
	-Performs Connected Components Algorithm to count moving objects in video
 	-Gives an alternative counting result
	-Outputs live video of original video and differnced output with live count of objects per frame
	 and a barplot after the video is completed.

-THE END----------------------------------------------------------------------------------------------------------------------------------------------------