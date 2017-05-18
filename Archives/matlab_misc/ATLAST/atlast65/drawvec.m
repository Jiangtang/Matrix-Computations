function[ handle ] = drawvec(v,color,s);
% DRAWVEC(v,color,s) graphs the vector v using
% the color specified by the second input
% argument. If no second argument is specified
% the default color is red. The initial point 
% of the plot is the origin. An arrow is drawn 
% at the terminal point of the vector.
% Axis is set at [-s,s,-s,s]. If the third
% input argument s is not specified, its default
% value is 5.

% Modified by Emily Moore to return the handle of the
%   vector so we can set properties of Tag and Userdata.

if nargin==1
   color = 'r';
end
if nargin < 3
   s=5;
end
handle = plot([0,v(1)],[0,v(2)],color);
axis([-s,s,-s,s])
axis('square')
hold on
[m,n]=size(v);
if n==1  % Change to row vector
   v=v'; 
end
atip=tip(v,s);
fill(atip(1,:),atip(2,:),color)
hold off
