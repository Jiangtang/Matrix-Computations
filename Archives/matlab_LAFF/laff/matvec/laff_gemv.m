function [ y_out ] = laff_gemv( trans, alpha, A, x, beta, y )

% laff_gemv( trans, alpha, A, x, beta, y )
%    if trans = 'No transpose' returns alpha * A  * x + beta * y
%    if trans = 'Transpose'    returns alpha * A' * x + beta * y

% Check parameters

% Check if trans is 'No transpose' or 'Transpose'
if (~isequal( trans, 'No transpose' )) & (~isequal( trans, 'Transpose' ))
    disp( 'gemv: illegal trans parameter' )
    y_out = 'FAILED';
    return
end

% Check if alpha is a scalar
if ~isscalar( alpha ) 
    disp( 'gemv: alpha is not a scalar' )
    y_out = 'FAILED'
    return
end

% Check if beta is a scalar
if ~isscalar( beta )
    disp( 'gemv: beta is not a scalar' )
    y_out = 'FAILED'
    return
end

% Check if x is a (row or column) vector
if ~isvector( x )
    disp( 'gemv: x is not a vector' )
    y_out = 'FAILED'
    return
end

% Check if y is a (row or column) vector
if ~isvector( y )
    disp( 'gemv: y is not a vector' )
    y_out = 'FAILED'
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
% if y is a row vector, we make it a column vector (but remember what it
% was so that y_out is set to be a row or column vector, at the end)
if n_y ~= 1
    y = y';
    m_y = n_y;
    y_is_a_row = 1;
else
    y_is_a_row = 0;
end

if isequal( trans, 'No transpose' )
    if n_A ~= m_x | m_A ~= m_y 
        disp( 'gemv: sizes of A, x, and/or y do not match' )
        y_out = 'FAILED';
        return
    else
        y_out = alpha * A * x + beta * y;
    end
else
    if m_A ~= m_x | n_A ~= m_y 
        disp( 'gemv: sizes of A, x, and/or y do not match' )
        y_out = 'FAILED';
        return
    else
        y_out = alpha * A' * x + beta * y;
    end
end

if y_is_a_row
    y_out = y_out';
end

return
end

