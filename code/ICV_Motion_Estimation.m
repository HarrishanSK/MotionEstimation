function [x,y,dx,dy] = ICV_Motion_Estimation(framei, frameiplus1,blockSize, windowSize)
    %Extract dimensions
    rows = size(framei,1);columns = size(framei,2);          
    originalFrameiplus1 = frameiplus1;
    
    %Convert to grayscale
    framei = ICV_Convert_To_Grayscale(framei);
    frameiplus1 = ICV_Convert_To_Grayscale(frameiplus1);
    
    %Pad the 2 frames
    padding = (windowSize-blockSize)/2;
    framei = ICV_Pad_Image(framei, padding);
    frameiplus1 = ICV_Pad_Image(frameiplus1,padding);
    
    %Initialise number of blocks
    blockRows = rows/blockSize; blockColumns = columns/blockSize;
    numBlocks = blockRows * blockColumns;
    motionVector = zeros(rows,columns);
    %Task: Find block i from frame i in window in frame i + 1
      %Initialise starting values
      blocksCounted = 0; smallestMAE = inf;
      rowPixelStart = padding + 1; rowPixelEnd = rowPixelStart + (blockSize-1); 
      colPixelStart = padding + 1; colPixelEnd = colPixelStart + (blockSize-1);
      x = zeros(numBlocks,1);
      y = zeros(numBlocks,1);
      dx =zeros(numBlocks,1);
      dy= zeros(numBlocks,1);
      %For block i 
      for br = 1: blockRows %For each block
          
          for bc = 1:blockColumns
              blocksCounted = blocksCounted+1; %Counts number of blocks as they are visited

                block = framei(rowPixelStart:rowPixelEnd,colPixelStart:colPixelEnd, :); %Gets block from image

                %Find this block in the next frame
                gap = windowSize - blockSize;
                rowWindowStart = rowPixelStart - padding -1; %So we start from 0,0
                colWindowStart = colPixelStart - padding - 1;%So we start from 0,0
                colWSOriginal = colWindowStart + 1; %Start from column 1
                smallestMAE = +inf;
                
                % for each overlapping block in the window
                windowCount = 0;
                 for wr = 1:(gap+1)
                      rowWindowStart = rowWindowStart + 1;
                      colWindowStart = colWSOriginal;
                      rowWindowEnd = rowWindowStart + (blockSize-1);
                      colWindowEnd = colWindowStart + (blockSize-1);
                     for wc = 1:(gap+1)%So we start from 0,0
                         windowCount = windowCount+1;
                          temp_block = frameiplus1(rowWindowStart:rowWindowEnd ,colWindowStart:colWindowEnd, :);
                             
                            %Calculate error between block and temp_block
                            MAE = sum(sum(abs(double(block) - double(temp_block)).^2));
                            if MAE < smallestMAE
                                smallestMAE = MAE;
                                tempBlockRowStartingPixel = rowWindowStart;
                                tempBlockColStartingPixel = colWindowStart;
                            end
                            
                            colWindowStart = colWindowStart + 1;
                            colWindowEnd = colWindowStart+(blockSize-1);
                     end
                      
                 end%End of Finding block match in window
                 
                 %Found corresponding block in framei+1 with smallest MAE
                  found_block = frameiplus1(tempBlockRowStartingPixel:(tempBlockRowStartingPixel+blockSize-1),tempBlockColStartingPixel:(tempBlockColStartingPixel+blockSize-1), :);

                  %Get mid point of block i in framei
                  y1 = rowPixelStart + (blockSize/2);
                  x1 = colPixelStart + (blockSize/2);
                  %Get midpoint of block i in framei+1
                  y2 = tempBlockRowStartingPixel + (blockSize/2);
                  x2 = tempBlockColStartingPixel + (blockSize/2);
                  
                  %Calculate motion vector
                  x(blocksCounted,:) = x1;
                  y(blocksCounted,:) = y1;
                  dx(blocksCounted,:) = x2 - x1;
                  dy(blocksCounted,:) = y2-y1;
                  

                %Start new block col for next iteration
                colPixelStart = colPixelStart + blockSize;%New starting pixel location of next block column
                colPixelEnd = colPixelStart + (blockSize-1);%New ending pixel location of next block column  
          end
          if(blocksCounted ~= numBlocks)
              colPixelStart = padding + 1;%New starting pixel location of next block column
              colPixelEnd = colPixelStart + (blockSize-1);%New ending pixel location of next block column
              rowPixelStart = rowPixelStart + blockSize;%New starting pixel location of next block row
              rowPixelEnd = rowPixelStart + (blockSize-1);%New ending pixel location of next block row
          end
      end
      
      %Remove padding
      rMax = size(frameiplus1,1); cMax = size(frameiplus1,2);
      frameiplus1 = frameiplus1(padding+1:rMax-padding, padding+1:cMax-padding-1);
      rMax = size(framei,1); cMax = size(framei,2);
      framei = framei(padding+1:rMax-padding, padding+1:cMax-padding-1);  
      for a = 1: size(x,1) %adjust midpoints by padding reduction         
              x(a,:) = x(a,:) - padding;
              y(a,:) = y(a,:) - padding;
      end
      
      
     
      
%Show image with superimposed arrows with motion estimation
figure(); imshow(originalFrameiplus1); hold on; 
quiv = quiver(x,y,dx,dy);
col = quiv.Color;
quiv.Color = 'cyan'; title("Motion Estimation");

end