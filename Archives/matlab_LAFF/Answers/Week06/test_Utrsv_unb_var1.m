% Create an upper triangular matrixmatrix.  
% (This matrix was carefully chosen so that only integers
% are encountered during the process.)

U = [
     2     0     1     2
     0    -1     2     1
     0     0     1    -1
     0     0     0    -2

]

% Create a right-hand side.  We are going to solve U x = b

b = [
     2
     4
     3
     2

]

% Solve U x = b

x = Utrsv_unb_var1( U, b )

% Check that U x = b

b - U * x

