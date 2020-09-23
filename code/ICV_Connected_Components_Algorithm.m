%Description: Connected Components Algorithm implemented to count the
%number of moving objects in a video. Takes as input the video and a 3d
%matrix which holds the difference image between the frames and the
%background
function objectCountFrame = ICV_Connected_Components_Algorithm(vid,difference)
 for frame = 1:vid.NumFrames %For each frame in the video
     currentFrame = read(vid, frame);%Get current frame from Dataset B video
     
     
        d_image = difference(:,:,frame);%For this frame
        d_image = uint8(d_image);
        d_image = ICV_Pad_Image(d_image,1);%Pad image for padding = 1
        
        %Find white pixel 1, check 8 neighbors and if neighbors already
        %labelled then label it as neighbors label
        
        
        label_image = d_image; %zeros(size(d_image,1),size(d_image,2)) ;
        labelFound = 0; surroundCount = 0;ObjectCount = 0;
        %For each pixel in frame
        for r = 2:size(d_image,1)-1
          for c = 2:size(d_image,2)-1
             
                 if label_image(r,c) == 255 %If this pixel is white
                  labelFound = 0; surroundCount = 0;
                   
                     
                %Check 8 surrounding pixels
                 rCount = -1; %number to be added to row  goes from -1 to 1
                 for i = 1:3
                     cCount = -1;%number to be added to column goes from -1 to 1
                     for j = 1:3
                           rowD = r + rCount; colD = c + cCount;
                        if labelFound == 0
                           if ( (label_image(rowD,colD) ~= 0) && (label_image(rowD,colD) ~= 255))  %If pixel is black
                             %Part of existing object
                             %Assign label of neighbour
                             label = label_image(rowD,colD);
                             label_image(r,c) = label;
                             labelFound = 1;
                            
                           end
                         
                         if( (label_image(rowD,colD) == 0) || (label_image(rowD,colD) == 255))
                             %New object found?
                             surroundCount = surroundCount + 1;
                          
                         end
                          
                          
                        end
                        cCount = cCount + 1;
                     end
                     rCount = rCount + 1;
                 end
                      
                      
                      %If all surrounding pixels arent labelled or are 0
                      if surroundCount >=8 && labelFound == 0
                          %New object found
                          ObjectCount = ObjectCount + 1;
                          label_image(r,c) = ObjectCount;
                          
                      end
                     
                 end
          end
        end
        
        %Show video vs blockify difference with count of number of objects
        figure(1);
         subplot(2,1,1), imshow(currentFrame);
         subplot(2,1,2), imshow(difference(:,:,frame));
         title(strcat('Number of objects: ',num2str(ObjectCount)));
         objectCountFrame(frame) = ObjectCount;
         %pause(0.2);
end
end