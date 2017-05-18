function [ A_out ] = laff_syr( uplo, alpha, x, A )

% laff_syr( uplo, alpha, x, A )
%    computes alpha * x * x' + A
%    but it is a bit tricky: x be a row vector.
%  
%    if uplo = 'Lower triangular', the lower triangular part of A is
%    updated.
%    if uplo = 'Upper triangular', the upper triangular part of A is
%    updated.

% Check parameters

% Check if uplo is 'Lower triangular' or 'Upper triangular'
if (~isequal( uplo, 'Lower triangular' )) & (~isequal( uplo, 'Upper triangular'))
    disp( 'syr: illegal uplo parameter' )
    A_out = 'FAILED';
    return
end

if ~isscalar( alpha ) 
    disp( 'syr: alpha is not a scalar' )
    A_out = 'FAILED'
    return
end

% Check if x is a (row or column) vector
if ~isvector( x )
    disp( 'syr: x is not a vector' )
    A_out = 'FAILED'
    return
end

[ m_A, n_A ] = size( A );
[ m_x, n_x ] = size( x );

% Now we cheat a little: 
% if x is a row vector, we make it a column vector
if n_x ~= 1
    x = x';
    m_x = n_x;
end

if m_A ~= n_A | n_A ~= m_x 
    disp( 'syr: sizes of A and/or x do not match' )
    A_out = 'FAILED';
    return
else
    if isequal( uplo, 'Lower triangular' )
        A_out = alpha * tril( x * x') + A;
    else
        A_out = alpha * triu( x * x') + A;
    end
end

return
end

