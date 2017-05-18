% Create a unit lower triangular matrixmatrix.  
% (This matrix was carefully chosen so that only integers
% are encountered during the process.)

L = [
     1     0     0     0
    -1     1     0     0
     2     1     1     0
    -2    -1     1     1
]

% Create a right-hand side.  We are going to solve L x = b

b = [
     2
     2
    11
    -3
]

% Solve L x = b

x = Ltrsv_unb_var2( L, b )

% Check that L x = b

b - L * x

