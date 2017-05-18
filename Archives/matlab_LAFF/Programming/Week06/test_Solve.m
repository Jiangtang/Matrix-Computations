% Create a matrix.  (This matrix was carefully chosen so that only integers
% are encountered during the process.)

A = [
     2     0     1     2 
    -2    -1     1    -1 
     4    -1     5     4 
    -4     1    -3    -8 
]

% Create a right-hand size vector b

b = [
     2
     2
    11
    -3
]

% Solve A x = b

[ LU, x ] = Solve( A, b ) 

% Check that A x = b

b - A * x
