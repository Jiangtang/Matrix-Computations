function [ x ] = laff_trsv( uplo, trans, diag, A, y )

% laff_trsv( uplo, trans, diag, A, y )
%    laff_trsv( 'Lower triangular', 'No transpose', 'Nonunit diag', A, y )
%        solves tril( A ) x = y
%    laff_trsv( 'Upper triangular', 'Transpose', 'Nonunit diag', A, y )
%        solves triu( A )' x = y
%    laff_trsv( 'Lower triangular', 'No transpose', 'Unit diag', A, y )
%        solves tril( A ) x = y except with (implicitly) ones on the
%        diagonal.  In other words, it solves 
%                  ( tril( A,-1 ) + eye( size( A ) ) x = y

% Check parameters

% Check if uplo is 'Lower triangular' or 'Upper triangular'
if (~isequal( uplo, 'Lower triangular' )) & (~isequal( uplo, 'Upper triangular'))
    disp( 'trsv: illegal uplo parameter' )
    x = 'FAILED';
    return
end

% Check if trans is 'No transpose' or 'Transpose'
if (~isequal( trans, 'No transpose' )) & (~isequal( trans, 'Transpose' ))
    disp( 'trsv: illegal trans parameter' )
    x = 'FAILED';
    return
end

% Check if diag is 'Nonunit diag' or 'Unit diag'
if (~isequal( diag, 'Nonunit diag' )) & (~isequal( diag, 'Unit diag'))
    disp( 'trsv: illegal diag parameter' )
    x = 'FAILED';
    return
end

% Check if y is a (row or column) vector
if ~isvector( y )
    disp( 'trsv: y is not a vector' )
    x = 'FAILED'
    return
end

[ m_A, n_A ] = size( A );
[ m_y, n_y ] = size( y );

% Now we cheat a little: 
% if y is a row vector, we make it a column vector (but remember what it
% was so that x is set to be a column or row vector, at the end)
if n_y ~= 1
    y = y';
    m_y = n_y;
    y_is_a_row = 1;
else
    y_is_a_row = 0;
end

% Check that A is square and th size of (the updated) y is the same as the
% size of A.
if m_A ~= n_A | m_A ~= m_y
    disp( 'trsv: A and/or y do not have same size' )
    x = 'FAILED';
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

% Now use matlab's intrinsic method for solving A x = y
x = A \ y;

% And fix the return to be consistent with y
if y_is_a_row
    x = x';
end

return
end

