%% Introduction to Computer Vision (ICV) - Mini Project on Motion Estimation, Predicting the next frame of a video and Counting the number of moving vehicles in a video %%%%%%%%%%%%%%%%%%%%%%%%%
%%Author: Harrishan Sureshkumar
%%University: QMUL
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Clear Workspace
close all;clear; clc ;
%% Motion Estimation
    vid = VideoReader('DatasetC.mpg');%Store video in variable vid
    ICV_Split_Video_To_Frames(vid);%Split each frame from the video and store each frame in a folder
%% Task 1a Motion Estimation
%Set Block Size and window size
blockSize = 16; windowSize = 20;             
                
%Load frames
framei = imread('DatasetCFrames/DatasetCFrame17.jpg');%Load image from Dataset C
frameiplus1 = imread('DatasetCFrames/DatasetCFrame18.jpg');%Load image from Dataset C
    
[x,y,dx,dy] = ICV_Motion_Estimation(framei, frameiplus1,blockSize, windowSize);

%% Task 1b Predict Image using motion vectors
%Prediction Frame
frameP = ICV_Predict_Frame(framei,dx,dy, windowSize, blockSize);
 
%Actual Frame
f = uint8(ICV_Convert_To_Grayscale(frameiplus1));
figure(); imshow(f); title("Frame I + 1");
 
%Calculate error between predicted and actual frame
MAE = sum(sum(abs(double((ICV_Convert_To_Grayscale(frameiplus1))) - double(frameP)).^2));
%% Task 1c Block size 4, Window size 16
tic;
%Set Block Size and window size
blockSize = 4; windowSize = 16;             
                
%Load frames
framei = imread('DatasetCFrames/DatasetCFrame17.jpg');%Load image from Dataset C
frameiplus1 = imread('DatasetCFrames/DatasetCFrame18.jpg');%Load image from Dataset C

%Motion Estimation    
[x,y,dx,dy] = ICV_Motion_Estimation(framei, frameiplus1,blockSize, windowSize);

%Prediction
frameP = ICV_Predict_Frame(framei,dx,dy, windowSize, blockSize);
toc;
%Actual Frame
f = uint8(ICV_Convert_To_Grayscale(frameiplus1));
figure(); imshow(f); title("Frame I + 1");

%Calculate error between predicted and actual frame
MAE = sum(sum(abs(double((ICV_Convert_To_Grayscale(frameiplus1))) - double(frameP)).^2));
%% Task 1c Block size 8, Window size 16
tic;
%Set Block Size and window size
blockSize = 8; windowSize = 16;             
                
%Load frames
framei = imread('DatasetCFrames/DatasetCFrame17.jpg');%Load image from Dataset C
frameiplus1 = imread('DatasetCFrames/DatasetCFrame18.jpg');%Load image from Dataset C

%Motion Estimation
[x,y,dx,dy] = ICV_Motion_Estimation(framei, frameiplus1,blockSize, windowSize);

%Prediction Frame
frameP = ICV_Predict_Frame(framei,dx,dy, windowSize, blockSize);
toc;
%Actual Frame
f = uint8(ICV_Convert_To_Grayscale(frameiplus1));
figure(); imshow(f); title("Frame I + 1");

%Calculate error between predicted and actual frame
MAE = sum(sum(abs(double((ICV_Convert_To_Grayscale(frameiplus1))) - double(frameP)).^2));
%% Task 1c Block size 16, Window size 16
tic;
%Set Block Size and window size
blockSize = 16; windowSize = 16;             
                
%Load frames
framei = imread('DatasetCFrames/DatasetCFrame17.jpg');%Load image from Dataset C
frameiplus1 = imread('DatasetCFrames/DatasetCFrame18.jpg');%Load image from Dataset C

%Motion Estimation
[x,y,dx,dy] = ICV_Motion_Estimation(framei, frameiplus1,blockSize, windowSize);

%Prediction Frame
frameP = ICV_Predict_Frame(framei,dx,dy, windowSize, blockSize);
toc;

%Actual Frame
f = uint8(ICV_Convert_To_Grayscale(frameiplus1));
figure(); imshow(f); title("Frame I + 1");

%Calculate error between predicted and actual frame
MAE = sum(sum(abs(double((ICV_Convert_To_Grayscale(frameiplus1))) - double(frameP)).^2));

%% Task 1d Block size 8, Window size 8
tic;
%Set Block Size and window size
blockSize = 8; windowSize = 8;             
                
%Load frames
framei = imread('DatasetCFrames/DatasetCFrame17.jpg');%Load image from Dataset C
frameiplus1 = imread('DatasetCFrames/DatasetCFrame18.jpg');%Load image from Dataset C

%Motion Estimation
[x,y,dx,dy] = ICV_Motion_Estimation(framei, frameiplus1,blockSize, windowSize);

%Prediction Frame
frameP = ICV_Predict_Frame(framei,dx,dy, windowSize, blockSize);
toc;
%Actual Frame
f = uint8(ICV_Convert_To_Grayscale(frameiplus1));
figure(); imshow(f); title("Frame I + 1");

%Calculate error between predicted and actual frame
MAE = sum(sum(abs(double((ICV_Convert_To_Grayscale(frameiplus1))) - double(frameP)).^2));

%% Task 1d Block size 8, Window size 16
tic;
%Set Block Size and window size
blockSize = 8; windowSize = 16;             
                
%Load frames
framei = imread('DatasetCFrames/DatasetCFrame17.jpg');%Load image from Dataset C
frameiplus1 = imread('DatasetCFrames/DatasetCFrame18.jpg');%Load image from Dataset C

%Motion Estimation
[x,y,dx,dy] = ICV_Motion_Estimation(framei, frameiplus1,blockSize, windowSize);

%Prediction Frame
frameP = ICV_Predict_Frame(framei,dx,dy, windowSize, blockSize);
toc;
%Actual Frame
f = uint8(ICV_Convert_To_Grayscale(frameiplus1));
figure(); imshow(f); title("Frame I + 1");

%Calculate error between predicted and actual frame
MAE = sum(sum(abs(double((ICV_Convert_To_Grayscale(frameiplus1))) - double(frameP)).^2));

%% Task 1d Block size 8, Window size 32
tic;
%Set Block Size and window size
blockSize = 8; windowSize = 32;             
                
%Load frames
framei = imread('DatasetCFrames/DatasetCFrame17.jpg');%Load image from Dataset C
frameiplus1 = imread('DatasetCFrames/DatasetCFrame18.jpg');%Load image from Dataset C

%Motion Estimation
[x,y,dx,dy] = ICV_Motion_Estimation(framei, frameiplus1,blockSize, windowSize);

%Prediction Frame
frameP = ICV_Predict_Frame(framei,dx,dy, windowSize, blockSize);
toc;

%Actual Frame
f = uint8(ICV_Convert_To_Grayscale(frameiplus1));
figure(); imshow(f); title("Frame I + 1");

%Calculate error between predicted and actual frame
MAE = sum(sum(abs(double((ICV_Convert_To_Grayscale(frameiplus1))) - double(frameP)).^2));

%% Task 1e
%For window size 16x16
y_axis = [2.257681,1.182999,0.644236];
x_axis = [4,8,16];
figure();
plot(x_axis,y_axis);
xlabel('Block Size') ;
ylabel('Execution Time') ;
%title("For Window Size 16x16");

%For block size 8x8
y_axis = [0.367121 ,0.548471 ,1.742362 ];
x_axis = [8,16,32];
figure();
plot(x_axis,y_axis);
xlabel('Window Size') ;
ylabel('Execution Time') ;
%% Task 2a Frame Differencing without threshold
    close all;clear; clc ;
    threshold = 0;
    vid = VideoReader('DatasetC.mpg');%Store video in variable vid
    difference = ICV_Task2A(vid,threshold);
    
%% Task 2a Selected Frames without threshold
    figure(1);imshow(difference(:,:,12));
    figure(2);imshow(difference(:,:,24));
%% Task 2a Frame Differencing with threshold
    threshold = 50;
    vid = VideoReader('DatasetC.mpg');%Store video in variable vid
    difference = ICV_Task2A(vid,threshold);
 %% Task 2a Selected Frames with threshold   
    figure(1);imshow(difference(:,:,12));
    figure(2);imshow(difference(:,:,24));
%% Task 2b Frame Differencing without threshold
    close all;clear; clc ;
    threshold = 0;
    vid = VideoReader('DatasetC.mpg');%Store video in variable vid
    difference = ICV_Task2B(vid,threshold);

%% Task 2b Selected Frames without threshold
    figure(1);imshow(difference(:,:,12));
    figure(2);imshow(difference(:,:,24));
    
%% Task 2b with threshold
    close all;clear; clc ;
    threshold = 30;
    vid = VideoReader('DatasetC.mpg');%Store video in variable vid
    difference = ICV_Task2B(vid,threshold);
    
 %% Task 2b Selected Frames with threshold   
    figure(1);imshow(difference(:,:,12));
    figure(2);imshow(difference(:,:,24));
%% Task 2c
%Get difference between all images in frame and get average
    vid = VideoReader('DatasetC.mpg');%Store video in variable vid
    background = ICV_Background_Frame(vid);
    figure();imshow(uint8(background ));
 %% Task 2d   
    %Need right balance for threshold and blockify
    threshold = 92;blockifyMagnitude = 16; %92:14
    vid = VideoReader('DatasetC.mpg');%Store video in variable vid
    background = ICV_Background_Frame(vid);
    grayBackground = ICV_Convert_To_Grayscale(background);%Convert background to grayscale
    difference = ICV_Get_Segments(vid,threshold,grayBackground,blockifyMagnitude);  
    ObjectCount= ICV_Connected_Components_Algorithm(vid,difference);
    figure(2);bar(1:size(ObjectCount,2),ObjectCount);xlabel('Frames');ylabel('Number of Moving Objects') ;
    