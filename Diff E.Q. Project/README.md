My first major encounter with Matlab occured within my Differential Equations w/ Linear Algebra course. I was asked to create a basic image editor using matrix 
manipulation and Matlab. The project consisted of fifteen questions which each involved the implementation of various Linear Algebra techniques
within Matlab to adjust numerous aspects of an image. I list the summaries of twelve of these questions below (the three discarded questions were not immediately relevant to the coding aspect of the project). Image compression via a Discrete Sine Transform (DST) was also explored and implemented. There were two images
that the project required the program be able to manipulate: one rectangular (1000 x 750) image and one square (1024 x 1024) image. The PDF containing all the project information, as well as a more thorough explanation of the questions/requirements, can be found within this repository.

1)
Write a MATLAB function to read in an image file by name and return the double form of the grayscale matrix representing the picture
as well as the red, green, and blue color intensities. 

2)
Increase the exposure of a grayscaled image so that the resulting image appears more “whited out” than the original.

3)
Now change the colors in the color image. Remove all of the red by scalar multiplying the matrix containing the red intensities by 0. 
Leave the green intensities unchanged but increase the blue intensity by 80 units

4)
Find a matrix that will perform a horizontal shift of 306 pixels to the rectangular image.

5)
Apply transformations to the original matrix from rectangular.jpg that result in both a horizontal and vertical shift. Shift the image 306 pixels 
horizontally and 230 pixels vertically.

6)
Using what you learned about transformation matrices, determine what matrix would be required to flip an image upside down. Using that transformation, 
flip the rectangular image upside down.

7)
Transpose the rectangular image's pixel matrix

8)
Crop the rectangular image, meaning, change the color intensity of the pixels around the edge of the image to zero so that there appears to be a 
black border of some variable width 

9)
Write a function that returns the Discrete Sine Transform matrix of any given size (will be a square matrix)

10)
Verify that any Discrete Sine Transform matrix 'S' is equal to its inverse. That is, SS = I (identity matrix)

11)
Deterimine how an image, transformed by the Discrete Sine Transform, can be untransformed

12)
Compress the square image by removing values from the bottom right of the Discrete-Sine-Tranformed image












