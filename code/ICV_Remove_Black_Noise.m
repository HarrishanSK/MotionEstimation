%Description:For each black pixel in image if more than 4 surrounding 
%pixels are white then make it white.
function d_image = ICV_Remove_Black_Noise(d_image)
        d_image = ICV_Pad_Image(d_image,1);%Pad image with padding = 1 pixel length
        for r = 2:size(d_image,1)-1
            for c = 2:size(d_image,2)-1
                countNW = 0;%Counter for number of surroudning white pixels
               if d_image(r,c) == 0%If this pixel is black
                %Check 8 surrounding pixels
                 if (d_image(r-1,c-1) == 255)countNW = countNW + 1;end%top left
                 if (d_image(r-1,c) == 255)countNW = countNW + 1;end%top                
                 if (d_image(r-1,c+1) == 255)countNW = countNW + 1;end%top right
                 if (d_image(r,c+1) == 255) countNW = countNW + 1;end%right
                 if (d_image(r+1,c+1) == 255)countNW = countNW + 1;end%bottom right
                 if (d_image(r+1,c) == 255)countNW = countNW + 1;end%bottom
                 if (d_image(r+1,c-1) == 255)countNW = countNW + 1;end%bottom left
                 if (d_image(r,c-1) == 255)countNW = countNW + 1; end%left
                 
                 %if more than half surrounding pixels are white make this pixel white
                 if countNW >4
                     d_image(r,c) = 255;
                 end
               end 
           end
        end%remove noise white end
        
        %Remove padding
        d_image = d_image(2:size(d_image,1)-1,2:size(d_image,2)-1);
end