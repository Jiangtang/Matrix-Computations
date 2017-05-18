function [ y_out ] = laff_copy( x, y )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

[ m_x, n_x ] = size( x );
[ m_y, n_y ] = size( y );

if ~isvector( x ) | ~isvector( y )
    disp( 'copy failed' );
    y_out = 'FAILED';
    return
end

if ~( m_x * n_x == m_y * n_y )
    disp( 'copy failed' );
    y_out = 'FAILED';
    return
end    

if n_x == 1 % x is a column
    if n_y == 1 % y is a column
        for i = 1:m_x
            y( i, 1 ) = x( i, 1 );
        end
    else % y is a row
        for i = 1:m_x
            y( 1, i ) = x( i, 1 );
        end
    end
else % x is a row
     if n_y == 1 % y is a column
        for i = 1:n_x
            y( i, 1 ) = x( 1, i );
        end
    else % y is a row
        for i = 1:n_x
            y( 1, i ) = x( 1, i );
        end
    end   
end

y_out = y;

return
end


