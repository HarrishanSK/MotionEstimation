# Motion Estimation, Predicting the next frame of a video and Counting the number of moving vehicles in a video

This is a computer vision project to fulfill the requirements which can be found in the report (report.pdf). For this project i wrote 22 MatLab functions from scratch. Three of the main acheivements in this project include motion estimation of a moving object, predicting the next frame of a video using block matching & motion vectors and counting the number of moving objects in a video using segmentation with the implementation of a connected components algorithm.

My code can be found in the directory './code/' and is explained with annotations in the code and a text file can be found at './code/README.txt' which explains how to run the code in MatLab. My report can be found at 'report.pdf' in this directory. This report includes all the requirements and a detailed explanation of the implementation and results with screenshots of the final outcomes.

## Overview:
#### Motion Estimation
Below we have a frame from a video where the previous frame and the current frame are used with block matching to calculate the motion vectors of the moving objects in the image. Arrows are then super imposed onto the image showing the direction each moving block had moved between both frames. Thereby estimating the motion of the vehicles in the video.

<img src="https://github.com/HarrishanSK/MotionEstimation/blob/master/images/motionField.jpg" alt="alt text" width ="390" height ="270">

#### Predicting the next frame of a video
Using the calculated motion vectors the next frame in the video can be predicted by moving the blocks in the direction of the motion vectors. Below we can see the actual consecutive frame on the left and the predicted frame by my code on the right. It is clear the prediction is accurate with some minor distortions.
<img src="https://github.com/HarrishanSK/MotionEstimation/blob/master/images/predictedFrame.png" alt="alt text">

#### Counting the number of moving vehicles in a video
Below is an example of counting the number of moving objects in a video. The image below on the left is what the program sees after using the blockify algorithm which i implemented to easily segment the objects and count them using the connected components algorithm.
<img src="https://github.com/HarrishanSK/MotionEstimation/blob/master/images/counting.png" alt="alt text">
