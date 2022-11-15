My first major encounter with Matlab occured within my Differential Equations w/ Linear Algebra course. I was asked to create a basic image editor using matrix 
manipulation and Matlab. The project consisted of fifteen questions (listed below) which each involved the implementation of various Linear Algebra techniques
within Matlab to adjust numerous aspects of an image. Image compression via a Discrete Sine Transform (DST) was also explored and implemented. There were two images
that the project required the program be able to manipulate: one rectangular (1000 x 750) image and one square (1024 x 1024) image.

1)
Write a MATLAB function to read in an image file by name and return the double form of the grayscale matrix representing the picture
as well as the red, green, and blue color intensities. 

2)
Increase the exposure of a grayscaled image so that the resulting image appears more “whited out” than the original.

3)
Now change the colors in the color image. Remove all of the red by scalar multiplying the matrix containing the red intensities by 0. 
Leave the green intensities unchanged but increase the blue intensity by 80 units

4)
Given an image that is 4 pixels by 4 pixels, so that the grayscale representation of the image is a 4 ×4 matrix called A, what matrix E would you 
multiply A by in order to switch the leftmost column of pixels with the rightmost column of pixels?

5)
Find a matrix that will perform a horizontal shift of 306 pixels to the rectangular image.

6)
Apply transformations to the original matrix from rectangular.jpg that result in both a horizontal and vertical shift. Shift the image 306 pixels 
horizontally and 230 pixels vertically.

7)
Using what you learned about transformation matrices, determine what matrix would be required to flip an image upside down. Using that transformation, 
flip the rectangular image upside down.

8)
Transpose the rectangular image's pixel matrix

9)
Crop the rectangular image, meaning, change the color intensity of the pixels around the edge of the image to zero so that there appears to be a 
black border of some variable width 

10)
Write a function that returns the Discrete Sine Transform matrix of any given size (will be a square matrix)

11)
Verify that any Discrete Sine Transform matrix 'S' is equal to its inverse. That is, SS = I (identity matrix)













