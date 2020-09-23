function class = ICV_ClassifierNN(trainData,testData,windowSize)
% Train 2 images Classify 4
% Comment: Images used in train are being classified also as advised by demonstrators
% in the lab. But ofcourse these images would be perfectly classified (These images are labelled in black in the output figure).
% (Red labelled images are test images classified by this function.

%Total number of images
totalNumberOfImages = size(testData,4) + size(trainData,4);
lastVal = 1;
%Store all images in array to be classified
for a = 1: size(testData,4)
    classifyData(:,:,:,a) = testData(:,:,:,a);
    lastVal = lastVal+1;
end
for a = 1: size(trainData,4)
    classifyData(:,:,:,lastVal) = trainData(:,:,:,a);  
    lastVal = lastVal+1;
end

%Search Space:-------------------------------------------------------------
for i = 1:totalNumberOfImages %For each image to be classified
    td = uint8(classifyData(:,:,:,i));%Get image
    imagesGlobalHistogram = ICV_Get_Global_LBP_Histogram(td, windowSize);%Get global histogram of image
    D = [inf,inf;inf,inf;]; %Initialise distance matrix to store euclidean distances between global histograms of images

    if size(trainData,4) >=2%If there are 2 or more train images

        %car train image 1
        carTrainGlobal1 = ICV_Get_Global_LBP_Histogram(trainData(:,:,:,1), windowSize);%Get global histogram of train image
        Dcar1x1 = sqrt( sum( ((imagesGlobalHistogram - carTrainGlobal1).^2)));%Compare both and get euclidean distance
        D(1,1) = Dcar1x1; %Store in distance matrix

        %face train image 1
        faceTrainGlobal1 = ICV_Get_Global_LBP_Histogram(trainData(:,:,:,2), windowSize);%Get global histogram of train image
        Dface1x1 = sqrt( sum( ((imagesGlobalHistogram - faceTrainGlobal1).^2)));%Compare both and get euclidean distance
        D(2,1) = Dface1x1;%Store in distance matrix

    end

    if size(trainData,4) == 4% If there are 4 train images
        %car train image 2
        carTrainGlobal2 = ICV_Get_Global_LBP_Histogram(trainData(:,:,:,3), windowSize);%Get global histogram of train image
        Dcar2x2 = sqrt( sum( ((imagesGlobalHistogram-carTrainGlobal2).^2)));%Compare both and get euclidean distance
        D(1,2) = Dcar2x2;%Store in distance matrix

        %face train image 2
        faceTrainGlobal2 = ICV_Get_Global_LBP_Histogram(trainData(:,:,:,4), windowSize);%Get global histogram of train image
        Dface2x2 = sqrt( sum( ((imagesGlobalHistogram-faceTrainGlobal2).^2)));%Compare both and get euclidean distance
        D(2,2) = Dface2x2;%Store in distance matrix
    end
    % end of search space -------------------------------------------------


    %Now classify to class of nearest neighbour with shortest euclidean distance
    minD = inf;
    class(i) = "x";
    for r = 1 : size(D,1)
        for c =1: size(D,2)
            if D(r,c) < minD
                minD = D(r,c);
                if r == 1
                    class(i) = "car";
                else
                    class(i) = "face";
                end
            end
        end
    end
end

classifyData = uint8(classifyData);%Convert images to uint8 to be visualised

%Output classification, for visualisation..
figure(); 
%If train is 2 and test is 4
if size(testData,4) == 4
    subplot(2,3,1);imshow(classifyData(:,:,:,1)); title('\color{red}' + class(1)); 
    subplot(2,3,2);imshow(classifyData(:,:,:,2)); title('\color{red}' + class(2));
    subplot(2,3,4);imshow(classifyData(:,:,:,3)); title('\color{red}' + class(3));
    subplot(2,3,5);imshow(classifyData(:,:,:,4)); title('\color{red}' + class(4));
    subplot(2,3,3);imshow(classifyData(:,:,:,5)); title(class(5));
    subplot(2,3,6);imshow(classifyData(:,:,:,6)); title(class(6));
elseif size(testData,4) == 2 %else if test is 2 and train is 4
    subplot(2,3,1);imshow(classifyData(:,:,:,3)); title(class(3));
    subplot(2,3,2);imshow(classifyData(:,:,:,5)); title(class(5));
    subplot(2,3,4);imshow(classifyData(:,:,:,4)); title(class(4));
    subplot(2,3,5);imshow(classifyData(:,:,:,6)); title(class(6));
    subplot(2,3,3);imshow(classifyData(:,:,:,1)); title('\color{red}' + class(1));
    subplot(2,3,6);imshow(classifyData(:,:,:,2)); title('\color{red}' + class(2));
end

%For generic test and data sizes
%for each test image classify red
% for a = 1: size(testData,4)
%     subplot(2,3,a);imshow(classifyData(:,:,:,a)); title('\color{red}' + class(a));   
% end
% lastVal = a + 1;
% for b = 1:size(trainData,4)
%     subplot(2,3,lastVal);imshow(classifyData(:,:,:,lastVal)); title(class(lastVal));
%     lastVal = lastVal + 1;
% end

end
