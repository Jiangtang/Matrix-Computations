function [ x_out ] = laff_scal( alpha, x )

% x_out = laff_scal( alpha, x ) scales vector x by alpha
%   Vector x a column or row vector.  In other words, x can be 
%   a n x 1 or 1 x n array.  However, one size must equal 1 and the 
%   other size equal n.  

% For convenience, we treat x as a m x n matrix where either m or n
% equals 1, making it a row or column vector.

% Extract the row and column sizes of alpha and x
[ m_alpha, n_alpha ] = size( alpha );
[ m_x, n_x ] = size( x );

if ( m_x ~= 1 & n_x ~= 1 )
    x_out = 'FAILED';
    return
end
% check if alpha is a scalar (is 1 x 1 )
if ( m_alpha ~= 1 | n_alpha ~= 1 ) % alpha is not 1 x 1 
    x_out = 'FAILED';
    return
end

if ( n_x == 1 )     % x is a column vector
    
    % Scale the elements of x
    for i=1:m_x   
        x( i,1 ) = alpha * x( i,1 );
    end
       
elseif ( m_x == 1 )     % x is a row vector
        
    % Scale the elements of x_out
    for i=1:n_x   
        x( 1,i ) = alpha * x( 1,i );
    end
            
else     % x is neither a row nor a column vector

    x_out = 'FAILED';
    return
      
end

x_out = x;

return
end

