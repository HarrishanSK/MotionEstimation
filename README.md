# Motion Estimation, Predicting the next frame of a video and Counting the number of moving vehicles in a video

This is a computer vision project to fulfill the requirements which can be found in the report. For this project i wrote 22 MatLab functions from scratch. 
My code can be found in the './code' directory along with a 'README.txt' file which explains how to run each cell in MatLab.

Overview:
Motion Estimation
Below we have a frame from a video where the previous frame and the current frame are used with block matching to calculate the motion vectors of the moving objects in the image. Arrows are then super imposed onto the image showing the direction each moving block had moved between both frames. Thereby estimating the motion of the vehicles in the video.
<img src="https://github.com/HarrishanSK/MotionEstimation/blob/master/images/motionField.jpg" alt="alt text" width ="400" height ="400">

Predicting the next frame of a video
Using the calculated motion vectors the next frame in the video can be predicted by moving the blocks in the direction of the motion vectors. Below we can see the actual consecutive frame on the left and the predicted frame by my code on the right. It is clear the prediction is accurate with some minor distortions.
<img src="https://github.com/HarrishanSK/MotionEstimation/blob/master/images/predictedFrame.png" alt="alt text">

Counting the number of moving vehicles in a video
Below is an example of counting the number of moving objects in a video. The image below on the left is what the program sees after using the blockify algorithm which i implemented to easily segment the objects and count them using the connected components algorithm.
<img src="https://github.com/HarrishanSK/MotionEstimation/blob/master/images/counting.png" alt="alt text">
