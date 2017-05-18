% Create a matrix.  (This matrix was carefully chosen so that only integers
% are encountered during the process.)

A = [
     2     0     1     2 
    -2    -1     1    -1 
     4    -1     5     4 
    -4     1    -3    -8 
]

% Perform Gaussian elimination

LU = GaussianElimination( A ) 

% Create a right-hand side.  We are going to solve A x = b

b = [
     2
     2
    11
    -3
]

% Perform forward substitution

bhat = ForwardSubstitution( LU, b )

% Extract the upper triangular matrix from the matrix that resulted from
% Gaussian elminination:

U = triu( LU )

% Solve U x = bhat

x = U \ bhat  

% Check the answer

b - A * x 

