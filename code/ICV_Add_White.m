%Description: Used by blockify function to add a block of white pixels
%around existing white pixels to highlight them when bordering black pixels
function d_image = ICV_Add_White(d_image)
        d_image = ICV_Pad_Image(d_image,1);
        d_image2 = d_image;
        for r = 2:size(d_image,1)-1
            for c = 2:size(d_image,2)-1
               if d_image(r,c) == 255%If this pixel is white
                %Make 8 surrounding pixels white
                 if (d_image(r-1,c-1) == 0)d_image2(r-1,c-1) = 255;end%top left
                 if (d_image(r-1,c) == 0)d_image2(r-1,c) = 255;end%top                
                 if (d_image(r-1,c+1) == 0)d_image2(r-1,c+1) = 255;end%top right
                 if (d_image(r,c+1) == 0) d_image2(r,c+1) = 255;end%right
                 if (d_image(r+1,c+1) == 0)d_image2(r+1,c+1) = 255;end%bottom right
                 if (d_image(r+1,c) == 0)d_image2(r+1,c) = 255;end%bottom
                 if (d_image(r+1,c-1) == 0)d_image2(r+1,c-1) = 255;end%bottom left
                 if (d_image(r,c-1) == 0)d_image2(r,c-1) = 255; end%left
               end 
           end
        end
        
        %Remove padding
        d_image = d_image2;
        d_image = d_image(2:size(d_image,1)-1,2:size(d_image,2)-1);
end