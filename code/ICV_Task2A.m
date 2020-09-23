%Description: Gets difference images  for threshold and by using frame 1 as
%reference image for frame I
function difference = ICV_5a(vid,threshold)
    
    %difference = zeros(288,352,140);
    for frame = 1:vid.NumFrames %For each fram in the video
        
        if frame == 1
            referenceImage = read(vid, frame);%read image
            referenceImage = ICV_Convert_To_Grayscale(referenceImage);%convert image to grayscale
        end
        
        currentFrame = read(vid, frame);%Get current frame from Dataset B video
        currentFrame = ICV_Convert_To_Grayscale(currentFrame);%Convert image to grayscale
        d_image = abs(referenceImage - currentFrame);%Get difference image
        
        if threshold > 0
        for r = 1:size(currentFrame,1)
            for c = 1:size(currentFrame,2)
               if d_image(r,c) < threshold %If less than threshold
                   d_image(r,c) = 0;
               else %If more than threshold
                   d_image(r,c) = 255;
               end
               
            end
        end
        end
        
        difference(:,:,frame) = uint8(d_image);%Save this difference image 
        figure(1);imshow(uint8(d_image));%Show this difference image
    end
    
end