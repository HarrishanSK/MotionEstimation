%Description:For each white pixel in image if more than 4 surrounding 
%pixels are black then make it black.
function d_image = ICV_Remove_White_Noise(d_image)
       d_image = ICV_Pad_Image(d_image,1);%Pad image with padding = 1 pixel length
        for r = 2:size(d_image,1)-1 % for each row in image
            for c = 2:size(d_image,2)-1%for each column in image
                countNB = 0;%Counter for number of surrounding black pixels
               if d_image(r,c) == 255%If this pixel is white
                   
                %Check 8 surrounding pixels using if statements
%                  if (d_image(r-1,c-1) == 0)countNB = countNB + 1;end%top left
%                  if (d_image(r-1,c) == 0)countNB = countNB + 1;end%top                
%                  if (d_image(r-1,c+1) == 0)countNB = countNB + 1;end%top right
%                  if (d_image(r,c+1) == 0) countNB = countNB + 1;end%right
%                  if (d_image(r+1,c+1) == 0)countNB = countNB + 1;end%bottom right
%                  if (d_image(r+1,c) == 0)countNB = countNB + 1;end%bottom
%                  if (d_image(r+1,c-1) == 0)countNB = countNB + 1;end%bottom left
%                  if (d_image(r,c-1) == 0)countNB = countNB + 1; end%left
                 
                 %Check 8 surrounding pixels forloop alternative
                 rCount = -1; %to be added to row -1 to 1
                 for i = 1:3
                     cCount = -1;%to be added to column -1 to 1
                     for j = 1:3
                         if (d_image(r + rCount,c + cCount) == 0)
                             countNB = countNB + 1;%Increment counter
                             if((r == r+rCount) && (c == c+cCount))
                              countNB = countNB - 1;%Decrement counter
                             end  
                         end
                         cCount = cCount + 1;%Increment for next column
                     end
                     rCount = rCount + 1;%Increment for next row
                 end
                 
                 %if more than half surrounding pixels are black make this pixel black
                 if countNB >4
                     d_image(r,c) = 0;
                 end
               end 
            end%end of col
        end%end of row
        
        %Remove padding
        d_image = d_image(2:size(d_image,1)-1,2:size(d_image,2)-1);
end%remove noise white end