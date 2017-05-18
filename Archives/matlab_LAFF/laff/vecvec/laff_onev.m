function [ x_out ] = laff_onev( x )

% x_out = laff_onev( x ) sets the elements of vector x to one
%   Vector x a column or row vector.  In other words, x can be 
%   a n x 1 or 1 x n array.  However, one size must equal 1 and the 
%   other size equal n.  

if ~isvector( x )
    x_out = 'FAILED';
    return
end

% Now we cheat a little, and use the MATLAB intrinsic function zeros().

x_out = ones( size( x ) );

return
end


