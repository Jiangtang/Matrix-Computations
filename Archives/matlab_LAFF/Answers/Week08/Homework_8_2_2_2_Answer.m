% Start with a matrix and right-hand side vector
A = [ -2  2 -5 
       2 -3  7 
      -4  3 -7 ]
  
b = [ -7
      11
      -9 ]
  
% Create an appended matrix
A_appended = [ A  b ]

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

% Extract the solution vector from the appended column
x = A3( :, 4 )

% Check that the inverse was computed 
b - A * x

% The result should be a zero vector of size 3




