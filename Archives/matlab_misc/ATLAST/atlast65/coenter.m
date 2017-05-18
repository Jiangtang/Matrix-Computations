
function coenter

% This function is the callback for the edit box that receives
% new values for the coordinates of a user's guess.
%
% By Emily Moore.

w=2;
h1 = findobj( gcf, 'Tag', 'enterpair' );
h2 = findobj( gcf, 'Tag', 'storepairs' );

str = get(h1, 'String');
strlist = get(h2, 'String');
eval( ['A = [' str '];' ] )                     % extra []'s don't hurt
%eval(['A = ' str ';'])   % extra []'s don't hurt
h = findobj( gcf, 'Tag', 'xvec' );
x = get( h, 'Userdata' );
h = findobj( gcf, 'Tag', 'yvec' );
y = get( h, 'Userdata' );
v = A(1)*x + A(2)*y;
hold on
h = drawvec(v, 'm', w);

newlist = str2mat( ['  ' str], strlist );
set( h2, 'String', newlist )
