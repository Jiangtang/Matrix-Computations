function [ A_out ] = laff_ger( alpha, x, y, A )

% laff_ger( alpha, x, y, A )
%    computes alpha * x * y' + A
%    but it is a bit tricky: x and y can be row or column vectors, in any
%    combination.

% Check parameters
if ~isscalar( alpha ) 
    disp( 'ger: alpha is not a scalar' )
    A_out = 'FAILED'
    return
end

% Check if x is a (row or column) vector
if ~isvector( x )
    disp( 'ger: x is not a vector' )
    A_out = 'FAILED'
    return
end

% Check if y is a (row or column) vector
if ~isvector( y )
    disp( 'ger: y is not a vector' )
    A_out = 'FAILED'
    return
end

[ m_A, n_A ] = size( A );
[ m_x, n_x ] = size( x );
[ m_y, n_y ] = size( y );

% Now we cheat a little: 
% if x is a row vector, we make it a column vector
if n_x ~= 1
    x = x';
    m_x = n_x;
end
% if y is a row vector, we make it a column vector
if n_y ~= 1
    y = y';
    m_y = n_y;
end

if m_A ~= m_x | n_A ~= m_y 
    disp( 'ger: sizes of A, x, and/or y do not match' )
    A_out = 'FAILED';
    return
else
    A_out = alpha * x * y' + A;
end

return
end

