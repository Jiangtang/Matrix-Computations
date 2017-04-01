function plotline(a,b,c,s)
% PLOTLINE(a,b,c,s) plots the line ax + by = c 
% with axis set to [-s,s,-s,s].
% If the last input arguments is omitted, its
% default value is taken to be 5.
if nargin == 3
   s=5;
end
if (a == 0 & b == 0 & c ~= 0)
    error('No such line exists')
end
if  b == 0
    x = c/a;
    plot([x,x],[-s,s])
else
    y1 = (c+a*s)/b; y2 = (c-a*s)/b;
    plot([-s,s],[y1,y2])
end
axis([-s,s,-s,s])
ds = 0.2*s; 
set(gca,'XTick',[-s:ds:s])
set(gca,'YTick',[-s:ds:s])
