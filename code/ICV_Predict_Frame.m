function frameP = ICV_Predict_Frame(framei,dx,dy, windowSize, blockSize)
%Given frame i and motion vectors predict next frame
%For each block in frame i move each pixel by dy dx
      framei = ICV_Convert_To_Grayscale(framei);%Convert image to grayscale
      frameP = framei; %zeros(292,356);%frame to be predicted.%Uses frame i as base to overcome black lines/fractures in output
      rows = size(framei,1);
      columns = size(framei,2);
      
      %Initialise starting values
      blocksCounted = 0; 
      rowPixelStart =  1; rowPixelEnd = rowPixelStart + (blockSize-1); 
      colPixelStart = 1; colPixelEnd = colPixelStart + (blockSize-1);
      %For block i 
      blockRows =  rows/blockSize; blockColumns =  columns/blockSize;
      numBlocks = blockRows * blockColumns ;
      for br = 1: blockRows %For each block
          
          for bc = 1:blockColumns
              blocksCounted = blocksCounted+1; %Counts number of blocks as they are visited

               % block = framei(rowPixelStart:rowPixelEnd,colPixelStart:colPixelEnd, :); %Gets block from image

                for rowB = rowPixelStart:rowPixelEnd
                    for colB = colPixelStart:colPixelEnd
                        
                        pixel = framei(rowB, colB);
                        
                        %Move each pixel by dydx
                        
                        %Get new location of pixel
                        newX = colB + dx(blocksCounted,:);
                        newY = rowB + dy(blocksCounted,:);
                        
                        %Store pixel in new location
                        frameP(newY, newX)  = pixel;
                        
                    end
                    
                end
                
                
                 %Start new block col for next iteration
                colPixelStart = colPixelStart + blockSize;%New starting pixel location of next block column
                colPixelEnd = colPixelStart + (blockSize-1);%New ending pixel location of next block column  

          end
          if(blocksCounted ~= numBlocks)
              colPixelStart = 1;%New starting pixel location of next block column
              colPixelEnd = colPixelStart + (blockSize-1);%New ending pixel location of next block column
              rowPixelStart = rowPixelStart + blockSize;%New starting pixel location of next block row
              rowPixelEnd = rowPixelStart + (blockSize-1);%New ending pixel location of next block row
          end
      end
      
      figure(); imshow(uint8(frameP));title("Predicted Frame I + 1"); %Output predicted frame
      
end