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

imagesc(uint8(rectImage))

%imagesc(rectImage)

%Question 5 end

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

