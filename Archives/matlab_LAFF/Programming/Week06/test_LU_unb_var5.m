% Create a matrix.  (This matrix was carefully chosen so that only integers
% are encountered during the process.)

A = [
     2     0     1     2 
    -2    -1     1    -1 
     4    -1     5     4 
    -4     1    -3    -8 
]

% Perform LU factorization

LU = LU_unb_var5( A ) 

% Extract the unit lower triangular matrix

L = tril( LU, -1 ) + eye( size( LU ) )

% Extract the upper triangular matrix

U = triu( LU )

% Check that A = L * U 

A - L * U
