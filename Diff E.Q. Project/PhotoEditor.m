%Matlab Code for project 2
%Each question will have its own section and
%its own lines of code. Repeated methods (methods that
%are called multiple times within different question \
%sections, like the imagesc method, will be commented
%out in questions that are not currently being
%worked on/tested

%-------------------------------------------------------------

%Question 1 begin

%reads the rectangle.jpg image from the project's directory
%and creates both the color/grayscale data for the image
[imageColor, imageGray] = readImage('Butterfly.jpg');

%Methods to print either the grayscale or color version of the image

%imagesc(uint8(imageGray))
colormap('gray')
%imagesc(uint8(imageGray))


%Question 1 end

%-------------------------------------------------------------

%Question 2 begin

%Utilizes the 'exposure' method to alter the exposure of the
%grayscale image

%imagesc(uint8(exposure(imageGray, 100))) %Boosts exposure by 100

%Question 2 end

%-------------------------------------------------------------

%Question 3 begin

%Decreases the red channel intensity to 0 and adds 80 to the blue channel

recoloredImage = imageColor;
recoloredImage(:,:,1) = recoloredImage(:,:,1) * 0;
recoloredImage(:,:,3) = recoloredImage(:,:,3) + 80.0;
%imagesc(uint8(recoloredImage))

%Question 3 end

%-------------------------------------------------------------

%Question 4 begin

%Matrix which will switch the left-most column of a 4x4 matrix with its 
%right-most column
shiftMatrix = [0, 0, 0, 1; 0, 1, 0, 0; 0, 0, 1, 0; 1, 0, 0, 0];

%Test 4x4 matrix
testMatrix = [1, 2, 3, 4; 1, 2, 3, 4; 1, 2, 3, 4; 1, 2, 3, 4];

%The shift matrix must be on the right side of the multiplication in order
%to switch the columns around. Should the shift matrix be on the left side
%of the multiplications, the rows would be switched instead
newMatrix = testMatrix * shiftMatrix;
%disp(newMatrix)

%Question 4 end

%-------------------------------------------------------------

%Question 5 begin

rectImage = double(imread("Butterfly.jpg"));

%height, width, color dimensions
[h, w, c] = size(rectImage);

shift = 306; %Shifting the image by 306 pixels

rectIdentity = eye(w); %Identity matrix that has the dimension w x w
rectShift = zeros(w); %Matrix which will create the shift transformation in the image
rectShift(1:shift,:) = rectIdentity(w - (shift - 1):w,:); %rectShift(rows 1 to 'shift', columns (all))
rectShift(shift + 1:w,:) = rectIdentity(1:w - shift,:);%This line and the previous one apply the offset to the identity matrix

rectImage(:,:,1) = rectImage(:,:,1) * rectShift;
rectImage(:,:,2) = rectImage(:,:,2) * rectShift;
rectImage(:,:,3) = rectImage(:,:,3) * rectShift;

%imagesc(uint8(rectImage))

%imagesc(rectImage)

%Question 5 end

%-------------------------------------------------------------

%Question 6 begin

rectImage = double(imread("Butterfly.jpg"));

%height, width, color dimensions
[h, w, c] = size(rectImage);

shiftHoriz = 306; %Shifting the image by 306 pixels horizontally
shiftVert = 230; %Shifting the image by 230 pixels vertically

rectIdentityHoriz = eye(w); %Identity matrix that has the dimension w x w
rectShiftHoriz = zeros(w); %Matrix which will create the horizontal shift transformation in the image
rectShiftHoriz(1:shiftHoriz,:) = rectIdentityHoriz(w - (shiftHoriz - 1):w,:); %rectShift(rows 1 to 'shift', columns (all))
rectShiftHoriz(shiftHoriz + 1:w,:) = rectIdentityHoriz(1:w - shiftHoriz,:);%This line and the previous one apply the offset to the identity matrix

rectIdentityVert = eye(h); %Identity matrix that has the dimension h x h
rectShiftVert = zeros(h); %Matrix which will create the vertical shift transformation in the image
rectShiftVert(1:shiftVert,:) = rectIdentityVert(h - (shiftVert - 1):h,:); %rectShift(rows 1 to 'shift', columns (all))
rectShiftVert(shiftVert + 1:h,:) = rectIdentityVert(1:h - shiftVert,:);%This line and the previous one apply the offset to the identity matrix

rectImage(:,:,1) = rectShiftVert * rectImage(:,:,1) * rectShiftHoriz;
rectImage(:,:,2) = rectShiftVert * rectImage(:,:,2) * rectShiftHoriz;
rectImage(:,:,3) = rectShiftVert * rectImage(:,:,3) * rectShiftHoriz;

%imagesc(uint8(rectImage))

%Question 6 end

%-------------------------------------------------------------

%Question 7 begin

flippedImage = double(imread("Butterfly.jpg"));

%height, width, color dimensions
[h, w, c] = size(flippedImage);

%Code below creates a flipped identity matrix which can be multiplied by
%the rectangular image to flip it upside down
flipMatrix = zeros(h, h);

tracker = h;
for i = 1:h
    flipMatrix(i, tracker) = 1;
    tracker = tracker - 1;
end

flippedImage(:,:,1) = flipMatrix * flippedImage(:,:,1);
flippedImage(:,:,2) = flipMatrix * flippedImage(:,:,2);
flippedImage(:,:,3) = flipMatrix * flippedImage(:,:,3); 

%imagesc(uint8(flippedImage));

%Question 7 end


%-------------------------------------------------------------

%Question 8 begin

preTransposedImage = double(imread("Butterfly.jpg"));

[h, w, c] = size(preTransposedImage);

transposedMatrix = zeros(w, h, c);

transposedMatrix(:,:,1) = transpose(preTransposedImage(:,:,1));
transposedMatrix(:,:,2) = transpose(preTransposedImage(:,:,2));
transposedMatrix(:,:,3) = transpose(preTransposedImage(:,:,3)); 

%imagesc(uint8(transposedMatrix))

%Question 8 end

%-------------------------------------------------------------

%Question 9 begin

borderWidth = 100;

croppedImage = double(imread("Butterfly.jpg"));
[h, w, c] = size(croppedImage);

horizCrop = zeros(w); %Will become the identity matrix to crop the sides
vertCrop = zeros(h);

for i = borderWidth:(w - borderWidth)
    horizCrop(i, i) = 1;
end

for i = borderWidth:(h - borderWidth)
    vertCrop(i, i) = 1;
end

croppedImage(:,:,1) = vertCrop * croppedImage(:,:,1) * horizCrop;
croppedImage(:,:,2) = vertCrop * croppedImage(:,:,2) * horizCrop;
croppedImage(:,:,3) = vertCrop * croppedImage(:,:,3) * horizCrop;

%imagesc(uint8(croppedImage))

%Question 9 end

%-------------------------------------------------------------

%Question 10 begin

%Returns a Discrete Sine Transform matrix of size 'size' x 'size'
%Actual function is located at the bottom of the program

%function dst = createDST(size) %Creates DST matrix (size x size)
%    for i = 1:size
%        for j = 1:size
%            dst(i, j) = sqrt(2 / size) * sin(   (pi * (i - 1/2) * (j - 1/2) ) / size);
%        end
%    end
%end

%Quetion 10 end

%-------------------------------------------------------------

%Question 11 begin

DSTSize = 5;
DST1 = createDST(DSTSize);
DST2 = createDST(DSTSize);

Product = DST1 * DST2;

%This nested for-loop adjusts for strange rounding errors -
%numbers that were supposed to be '0' were calculated to 
%something like -5.5511e-17, for example
for i = 1:DSTSize 
    for j = 1:DSTSize
        if(Product(i, j) < 0.000001)
            Product(i, j) = 0;
        end
    end
end

%disp(Product(3, 4))

%spy(Product)

%Question 11 end

%-------------------------------------------------------------

%Question 12 begin

compressionTest = double(imread("Turkey.jpg"));

[h, w, c] = size(compressionTest);

compTestDST = createDST(h);

%DST application
compressionTest(:,:,1) = compTestDST * compressionTest(:,:,1) * compTestDST;
compressionTest(:,:,2) = compTestDST * compressionTest(:,:,2) * compTestDST;
compressionTest(:,:,3) = compTestDST * compressionTest(:,:,3) * compTestDST;

%DST restoration
compressionTest(:,:,1) = compTestDST * compressionTest(:,:,1) * compTestDST;
compressionTest(:,:,2) = compTestDST * compressionTest(:,:,2) * compTestDST;
compressionTest(:,:,3) = compTestDST * compressionTest(:,:,3) * compTestDST;

%To undo a DST, simply reapply the DST to the image

%imagesc(uint8(compressionTest))

%Question 12 end

%-------------------------------------------------------------

%Question 13 begin

compressImage = double(imread("Turkey.jpg"));

[h, w, c] = size(compressImage);

dst = createDST(h);

compressImage(:,:,1) = dst * compressImage(:,:,1) * dst;
compressImage(:,:,2) = dst * compressImage(:,:,2) * dst;
compressImage(:,:,3) = dst * compressImage(:,:,3) * dst;

%Drops 'p'% of the compressed data
p = 0.1;

redChannel = compressImage(:,:,1);
greenChannel = compressImage(:,:,2);
blueChannel = compressImage(:,:,3);
for i = 1:h
    for j = 1:h
        if (i+j > p*2*h)
            redChannel(i,j) = 0;
            greenChannel(i,j) = 0;
            blueChannel(i,j) = 0;
        end
    end
end

compressImage(:,:,1) = redChannel;
compressImage(:,:,2) = greenChannel;
compressImage(:,:,3) = blueChannel;

compressImage(:,:,1) = dst * compressImage(:,:,1) * dst;
compressImage(:,:,2) = dst * compressImage(:,:,2) * dst;
compressImage(:,:,3) = dst * compressImage(:,:,3) * dst;

imagesc(uint8(compressImage))

%Question 13 end

%-------------------------------------------------------------

%Image read function for question 1

%Function returns both a color and a grayscale version of a
%selected image. 
function [imgColor, imgGray] = readImage(path)
    imgColor = double(imread(path));
    imgGray = grayScale(imgColor);
end

%-------------------------------------------------------------

%Exposure function for question 2
function newImage = exposure(img, value)
    if(value < -255)
        multiplier = -255;
    elseif(value > 255)
        multiplier = 255;
    else
        multiplier = value;
    end
    
    newImage = (img(:,:,1) + multiplier);
end

%-------------------------------------------------------------

%Universal functions (used by entire program)

%Returns a grayscale image
function newImage = grayScale(img)
    newImage = (img(:,:,1)/3.0 + img(:,:,2)/3.0 + img(:,:,3)/3.0);
end

%Creates a DST matrix of size 'size' x 'size'
function dst = createDST(size) %Creates DST matrix (size x size)
    for i = 1:size
        for j = 1:size
            dst(i, j) = (sqrt(2.0 / double(size))) * sin(   ((pi * (double(i) - 0.5)) * (double(j) - 0.5) ) / double(size));
        end
    end
end


