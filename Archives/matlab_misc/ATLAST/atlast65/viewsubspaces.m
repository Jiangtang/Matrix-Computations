function viewsubspaces(u,v,w,color1,color2)
% viewsubspaces(u,v,w,color1,color2) is a utility for viewing both
% Span(u) and Span(v,w) in 3-space. The utility draws the 3-tuples 
% u, v, w as vectors with their tails at the origin. It draws u in color1
% (with default color blue), and it draws v, w, and the 
% parallelogram formed by v and w in color2 (with default color red).
% The last two input arguments are optional.
if nargin < 4
   color1 = 'b';
end
if nargin < 5
   color2 = 'r';
end
s = max([max(abs(u)),max(abs(v)),max(abs(w))]);
plot3([0,u(1)],[0,u(2)],[0,u(3)],color1)
axis([-s,s,-s,s,-s,s])
axis('square')
hold on
fill3([0,v(1),v(1)+w(1),w(1)],[0,v(2),v(2)+w(2),w(2)],[0,v(3),v(3)+w(3),w(3)],color2)
hold off
      
