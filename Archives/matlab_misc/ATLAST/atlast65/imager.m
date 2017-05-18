function imager(n)
	%Function to generate the image coordinates for	%the Transformer.	% Modified by Emily H. Moore,  May 23, 1996echo off	% making global variables:global   InImage  PvsImage  CurImage TarImage  PriorImageglobal   name  UndoFlag   Recent  Totalglobal   FigH  LeftUpH  RightUpH  LeftBotH  RightBotHh = findobj( gcf, 'Style', 'edit' );for i = 1:length(h)   set(h(i), 'String', '' )end
h = findobj( gcf, 'Tag', 'total' );
set( h, 'Visible', 'off' )
if n == 1                % create the polygon with sections
	t=0:pi/3:2*pi;
	x=cos(t);
	y=sin(t);
	name='poly';
elseif n == 2    % create the star with four leaves
	x=[.25,0,-.25,-1,-.25,0,.25,1];
	y=[.25,1,.25,0,-.25,-1,-.25,0];
	name='star';
elseif n == 3   % create pumpkin face
	t=0:0.02:6.28;
	xf=cos(t); yf=sin(t);
	xn=-0.3:0.01:0.3; yn=-abs(xn);
	xre=0.1*xf-0.5; yre=0.1*yf+0.2;
	xle=0.1*xf+0.5; yle=0.1*yf+0.2;
	xm=-0.5:.01:0.5; ym=0.5*xm.^2-0.7;
	x=[xf,xn,xre,xle,xm];
	y=[yf,yn,yre,yle,ym];
	name='pump';
elseif n == 4    % prompt for student's picture coordinates
	disp('Make up your own picture you wish to transform')
	x=input('Enter the x-coordinate vector in the form [a,b,...] ')
	y=input('Enter the y-coordinate vector in the form [c,d,...] ')
	name='made';
end;
	% initializing the variables:
Recent = eye(2);
Total = eye(2);
UndoFlag = 0;
	% storing initial coordinates:
InImage = [x;y];
PvsImage = InImage;
CurImage = InImage;
TarImage = InImage;
PriorImage = InImage;
	% drawing the starting picture:
axes(LeftUpH);
PlotImag(LeftUpH,InImage,name);
axes(RightUpH);
cla;
axes(LeftBotH);
PlotImag(LeftBotH,PvsImage,name);
axes(RightBotH);
PlotImag(RightBotH,CurImage,name);
echo on