function levels(n)
% Level n of the Coordinates Game (n=1,2,3,or 4)
% Two person game if n=5

% Modified by Emily Moore
%    If n=5, two person game entry boxes appear
%    If n=6, two person game vectors are drawn

global Cleararrowcount;
Cleararrowcount=0;
global FigureH;

h = findobj(gcf, 'Tag', 'storepairs');
set(h, 'String', '' )
h = findobj(gcf, 'Tag', 'enterpair' );
set(h, 'String', '' )

rand('seed',sum(100*clock))

w=2;ess=w/15;
z=[4*rand-2,4*rand-2];

if n==1
   x=[1 0];
   y=[0 1];
elseif n==2
  x=[cos(2*pi/3) sin(2*pi/3)];
  y=[cos(7*pi/6) sin(7*pi/6)];
elseif n==3
  x=[-.3 .4];
  y=[-.8 -.6];
elseif n==4
  x=[.1 -.4];
  y=[.8 -.1];
elseif n==5
  cla
  h = findobj( gcf, 'Tag', 'twoperson' );
  set( h, 'Visible', 'on' )
  title ('Two Person Game')
  return
elseif n==6
  h = sort( findobj( gcf, 'Tag', 'twoperson' ) );
  set( h, 'Visible', 'off' )
  ustr = get(h(4), 'String' );
  vstr = get(h(6), 'String' );
  tstr = get(h(8), 'String' );
  eval( ['x = [' ustr '];' ]);
  eval( ['y = [' vstr '];' ]);
  eval( ['z = [' tstr '];' ]);
  
%   disp('In the two person game you must enter the vectors u and v')
%   disp('and the target point X. All coordinates entered should be in')
%   disp('the range from -2 to 2. When you enter the vectors enclose')
%   disp('them in square brackets, e.g. [-1.2,1.8]')
%   x=input('Enter a vector u  ');
%   y=input('Enter a vector v  ');
%   z=input('Enter a target vector X ');
end
echo off
xlabel=x+ess*x/norm(x);
ylabel=y+ess*y/norm(y);
cla
h = plot(z(1),z(2),'bo');
set( h, 'linewidth', 1.5 )
hold on
h = drawvec(x,'r',w);
set( h, 'Tag', 'xvec', 'Userdata', x )
hold on
h = drawvec(y,'b',w);
set( h, 'Tag', 'yvec', 'Userdata', y )
text(xlabel(1),xlabel(2),'u');
text(ylabel(1),ylabel(2),'v');
if n==1
   title('Level 1')
elseif n==2
   title('Level 2')
elseif n==3
   title('Level 3')
elseif n==4
   title('Level 4')
elseif n==6
   title('Two Person Game')
end

hold off                

