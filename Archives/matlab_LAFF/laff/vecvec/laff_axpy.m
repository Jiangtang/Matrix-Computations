function [ y_out ] = laff_axpy( alpha, x, y )

% y_out = laff_axpy( alpha, x, y ) computes y_out = alpha * x + y.
%   Vectors x and y can be a mixture of column and/or row vector.  In other
%   words, x and y can be n x 1 or 1 x n arrays.  However, one size must 
%   equal 1 and the other size equal n.  
% 
%   The reason y is an input parameter is that the input y indicates 
%   whether the output, y_out, is a column or row vector.

% For convenience, we treat each vector as a m x n matrix where either m 
% or n equals 1, making it a row or column vector.

% Extract the row and column sizes of alpha, x, and y
[ m_alpha, n_alpha ] = size( alpha );
[ m_x, n_x ] = size( x );
[ m_y, n_y ] = size( y );

% check if alpha is a scalar (is 1 x 1 )
if ( m_alpha ~= 1 | n_alpha ~= 1 ) % alpha is not 1 x 1 
    disp( 'error in laff_scal: alpha is not a scalar' )
    return
end

if ( n_x == 1 )     % x is a column vector

    if ( n_y == 1 )     % y is a column vector
    
        if ( m_x == m_y )     % the sizes of the vectors match
            
            % Scale the elements of x and add to corresponding element of y
            for i=1:m_x   
                y( i,1 ) = alpha * x( i,1 ) + y( i,1 );
            end
        
        else     % The sizes of the vectors don't match
            
            y_out = 'failed';
            return
        
        end
        
    elseif ( m_y == 1 )     % y is a row vector
        
        if ( m_x == n_y )     % the sizes of the vectors match

            % Scale the elements of x and add to corresponding element of y
            for i=1:m_x   
                y( 1,i ) = alpha * x( i,1 ) + y( 1,i );
            end
            
        else     % The sizes of the vectors don't match

            y_out = 'failed';
            return
        
        end
    
    else     % One of the sizes of y must equal 1.  Display error and return.
    
        y_out = 'failed';
        return
    
    end

elseif ( m_x == 1 )     % x is a row vector
    
    if ( n_y == 1 )     % y is a column vector

        if ( n_x == m_y )     % the sizes of the vectors match

            % Scale the elements of x and add to corresponding element of y
            for i=1:n_x   
                y( i,1 ) = alpha * x( 1,i ) + y( i,1 );
            end
        
        else     % The sizes of the vectors don't match
            
            y_out = 'failed';
            return
        
        end
    
    elseif ( m_y == 1 )     % y is a row vector
        
        if ( n_x == n_y )     % the sizes of the vectors match

            % Scale the elements of x and add to corresponding element of y
            for i=1:n_x   
                y( 1,i ) = alpha * x( 1,i ) + y( 1,i );
            end
        
        else     % The sizes of the vectors don't match
            
            y_out = 'failed';
            return
        
        end
    
    else     % One of the sizes of y must equal 1.  Display error and return.
        
        y_out = 'failed';
        return
    
    end

else     % One of the sizes of x must equal 1.  Display error and return.
    
    y_out = 'failed';
    return

end

y_out = y;

return
end
