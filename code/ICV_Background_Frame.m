function average = ICV_Background_Frame(vid)
    for frame = 1:vid.NumFrames %For each frame in the video
        currentFrame = read(vid, frame);%read image
        %currentFrame= ICV_Convert_To_Grayscale(currentFrame);%convert image to grayscale
        
        if frame == 1
            sum = double(currentFrame);
        else
            sum = sum + double(currentFrame);
        end
    end 
    average = sum/frame; %weighted temporal average
    average = uint8(average);
    
end