function [ alpha ] = laff_norm2( x )

% alpha = laff_norm2( x ) computes the (Euclidean) length of vector x
%   Vector x a column or row vector.  In other words, x can be 
%   a n x 1 or 1 x n array.  However, one size must equal 1 and the 
%   other size equal n.  

% For convenience, we treat x as a m x n matrix where either m or n
% equals 1, making it a row or column vector.

% Extract the row and column sizes x
[ m_x, n_x ] = size( x );

% Make sure x is a (row or column) vector
if ( m_x ~= 1 & n_x ~= 1 )
    alpha = 'FAILED';
    return
end

xmax = 0.0
for i=1:m_x
    if abs( x( i ) > xmax ) 
        xmax = abs( x( i ) );
    end
end

x = laff_scal( 1/xmax, x );

% Use laff_dot to compute the length of x as sqrt( x' * x )
alpha = sqrt( laff_dot( x, x ) );

alpha = alpha * xmax;

return
end

