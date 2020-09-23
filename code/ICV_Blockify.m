function d_image = ICV_Blockify(d_image, size)
 for i = 1:size
   d_image = ICV_Add_White(d_image); %Adds a white box around each white pixel
                 %i.e: Finds each white pixels and makes the surrounding 8 pixels white
 end
end