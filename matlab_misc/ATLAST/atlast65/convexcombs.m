function convexcombs(x,y,h)
% The function convexcombs(x,y,h) plots convex
% combinations of x and y
%     (1-t)x+ty
% for t=0, h, 2h, ..., 1
% The default value for h is 0.01 when only two
% input arguments are used.
if nargin==2
    h=0.01;
end    
for t=0:h:1
    q=(1-t)*x+t*y;
    plot(q(1),q(2),'.')
    hold on
end
