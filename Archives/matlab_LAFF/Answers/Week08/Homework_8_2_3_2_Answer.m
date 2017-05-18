% Start with a matrix and a matrix with two right-hand side vectors
A = [ -2  2 -5 
       2 -3  7 
      -4  3 -7 ]
  
B = [ -7   8
      11 -13
      -9   9 ]
  
% Create an appended matrix
A_appended = [ A  B ]

% Create the first Gauss transform to introduce zeros in the first column
G0 = [ 1  0  0
       1  1  0
      -2  0  1 ]
   
% Apply the Gauss transform to the appended system
A0 = G0 * A_appended

% Create the second Gauss transform to introduce zeros in the second column
G1 = [ 1  2  0
       0  1  0
       0 -1  1 ]
    
% Apply the Gauss transform to the appended system
A1 = G1 * A0

% Create the third Gauss transform to introduce zeros in the third column
G2 = [ 1  0  1
       0  1 -2
       0  0  1 ]
    
% Apply the Gauss transform to the appended system
A2 = G2 * A1

% Create a diagonal matrix to set the diagonal elements to one
D3 = [ -1/2  0  0
         0  -1  0
         0   0  1 ]
    
% Apply the diagonal matrix to the appended system
A3 = D3 * A2

% Extract the solutions vector from the appended column
X = A3( :, 4:5 )

% Check that the inverse was computed 
B - A * X

% The result should be a zero matrix of size 3 x 2




