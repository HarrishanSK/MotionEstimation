function difference = ICV_Get_Segments2(vid,threshold,blockify)
%Uses It-1 as reference image, removes noise and performs blockify to
%obtain segments
    for frame = 1:vid.NumFrames %For each fram in the video
         if frame == 1
             referenceImage = read(vid, frame);%read image
             referenceImage = ICV_Convert_To_Grayscale(referenceImage);%convert image to grayscale
         end
        currentFrame = read(vid, frame);%Get current frame from Dataset B video
        currentFrame = ICV_Convert_To_Grayscale(currentFrame);%Convert image to grayscale
        d_image = abs(referenceImage - currentFrame);%Get difference image
        
         if threshold>0
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
        
         %Remove white noise: for each white pixel if surrounded by more than 4 black pixels then make it black
         d_image = ICV_Remove_White_Noise(d_image);%d_image = ICV_Remove_White_Noise(d_image);d_image = ICV_Remove_White_Noise(d_image);
         %Remove black noise: for each black pixel if surrounded by more than 4 white pixels then make it white
         d_image = ICV_Remove_Black_Noise(d_image);
         %Add white boxes around white pixels surrounded by black
         %i.e enhances white areas using boxes with certain magnitute
         d_image = ICV_Blockify(d_image,blockify);
            
        difference(:,:,frame) = uint8(d_image);%Save this difference image 
        %figure(1);imshow(uint8(difference(:,:,frame)));%Show this difference image
        
        referenceImage = currentFrame;
    end
end
