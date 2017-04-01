function clrarrow

% Deletes all but the last magenta vector/arrowhead.
% M-file created by Emily Moore

global Cleararrowcount;

h = sort( findobj( gca, 'color', [1 0 1]));             % vectors
if Cleararrowcount==0
   len = length(h);
   h = h(1:len-1);
end   
delete(h)

h = sort( findobj( gca, 'facecolor', [1 0 1]));         % arrowheads
if Cleararrowcount==0
   len = length(h);
   h = h(1:len-1);
end   
delete(h)
Cleararrowcount=1;