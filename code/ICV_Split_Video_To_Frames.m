function ICV_Split_Video_To_Frames(vid)%Splits video to frames/images to be stored
    for frame = 1:vid.NumberOfFrames %For each frame in the video
        currentFrame = read(vid, frame);%Get current frame from Dataset C video
        mkdir DatasetCFrames;%Create folder if it doesnt exist 
        nameOfFile=strcat('DatasetCFrames/DatasetCFrame',num2str(frame),'.jpg');%Generates name of file
        imwrite(currentFrame,nameOfFile);%Saves current frame as an image in created directory
    end
end 