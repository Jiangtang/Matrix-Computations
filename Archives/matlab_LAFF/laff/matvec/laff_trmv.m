function [ y ] = laff_trmv( uplo, trans, diag, A, x )

% laff_trmv( uplo, trans, diag, A, y )
%    laff_trmv( 'Lower triangular', 'No transpose', 'Nonunit diag', A, y )
%        computes y := tril( A ) * x
%    laff_trmv( 'Upper triangular', 'Transpose', 'Nonunit diag', A, y )
%        computes y = triu( A )' * x 
%    laff_trmv( 'Lower triangular', 'No transpose', 'Unit diag', A, y )
%        computes y = tril( A ) * x except with (implicitly) ones on the
%        diagonal.  

% Check parameters

% Check if uplo is 'Lower triangular' or 'Upper triangular'
if (~isequal( uplo, 'Lower triangular' )) & (~isequal( uplo, 'Upper triangular'))
    disp( 'trmv: illegal uplo parameter' )
    y = 'FAILED';
    return
end

% Check if trans is 'No transpose' or 'Transpose'
if (~isequal( trans, 'No transpose' )) & (~isequal( trans, 'Transpose' ))
    disp( 'trmv: illegal trans parameter' )
    y = 'FAILED';
    return
end

% Check if diag is 'Nonunit diag' or 'Unit diag'
if (~isequal( diag, 'Nonunit diag' )) & (~isequal( diag, 'Unit diag'))
    disp( 'trmv: illegal diag parameter' )
    y = 'FAILED';
    return
end

% Check if x is a (row or column) vector
if ~isvector( x )
    disp( 'trmv: x is not a vector' )
    y = 'FAILED'
    return
end

[ m_A, n_A ] = size( A );
[ m_x, n_x ] = size( x );

% Now we cheat a little: 
% if x is a row vector, we make it a column vector (but remember what it
% was so that x is set to be a column or row vector, at the end)
if n_x ~= 1
    x = x';
    m_x = n_x;
    x_is_a_row = 1;
else
    x_is_a_row = 0;
end

% Check that A is square and th size of (the updated) x is the same as the
% size of A.
if m_A ~= n_A | m_A ~= m_x
    disp( 'trmv: A and/or x do not have same size' )
    y = 'FAILED';
    return
end

% Now lets fix A
if isequal( uplo, 'Lower triangular' )
    if isequal( diag, 'Nonunit diag' )
        A = tril( A );
    else
        A = tril( A, -1 ) + eye( size( A ) );
    end
else
    if isequal( diag, 'Nonunit diag' )
        A = triu( A );
    else
        A = triu( A, 1 ) + eye( size( A ) );
    end
end

if isequal( trans, 'Transpose' )
    A = A';
end

% Now use matlab's intrinsic method for computing y = A x 
y = A * x;

% And fix the return to be consistent with y
if x_is_a_row
    y = y';
end

return
end

