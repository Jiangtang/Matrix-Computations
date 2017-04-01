function stretch
% This function checks the images and sets the four axes so they
% are the same, and are able to display the largest image.
%
% Written by Emily H. Moore, Grinnell College, 5/23/96
hh = sort(findobj(gcf, 'type', 'axes'));
num = 1;
for j = 1:4                                     % Find max redius of images
 hc  = get(hh(j), 'child' );
 types=get(hc,'type');
 for i=1:length(hc)
    if types{i}(1)=='p';
       vx = get(hc(i), 'xdata');
       vy = get(hc(i), 'ydata');
       m  = sqrt( max(vx.^2 + vy.^2))*1.2;
       if m > num
	      num = m;
       end
    end
   end
end
vec = [-num, num, -num, num];
for i = 1:4                                     % Set all four axes
   axes(hh(i))
   axis(vec)
end