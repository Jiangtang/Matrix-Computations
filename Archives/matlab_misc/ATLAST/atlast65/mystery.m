function mystery(n)
% helper function for the Transformer4 version.
% Generates the callback strings for the 'Mystery Game' menu
	% declaring global variables
global   InImage  PvsImage  CurImage TarImage  PriorImage
global   Recent  Total   name  UndoFlag
global   RightUpH  LeftBotH  RightBotH  FreezeH
	% initializing the variables and windows for the	% mystery game.
CurImage = InImage;
PvsImage = InImage;
PriorImage = InImage;
UndoFlag = 0;
Recent = eye(2);
Total = eye(2);
rand('seed',sum(100*clock))
	% drawing the starting picture:
axes(LeftBotH);
PlotImag(LeftBotH,PvsImage,name);
axes(RightBotH);
PlotImag(RightBotH,CurImage,name);
	% generate the matrices of mystery transformations:
S = [1   0   1   0   2   0   2   0   1/2  0  1/2  0;
     0  1/2  0   2   0  1/2  0   1    0   1   0   2];
j1=round(rand*5)+1;
D=S(:,2*j1-1:2*j1);
if rand<0.5
   t= floor(7*rand+1)*pi/4;
else
   t=floor(5*rand+1)*pi/3;
end
% deg=t*180/pi
c=cos(t);
s=sin(t);
cf=cos(2*t);
sf=sin(2*t);
R=[c -s;s c];
F=[cf sf;sf -cf];
w1=round(rand); 
Z=w1*R+(1-w1)*F;
if n==1
   w=3*rand;
   if w<2
      M=Z;
   else
     M=D;
   end
end
if n==2
   w=rand;
   M=D*Z;
   if w>0.5
     M=M';
   end
end
if n==3
  w=3*rand;
  if w<=1
     j2=round(rand*5)+1;
     D1=S(:,2*j2-1:2*j2);
     M=D*Z*D1;
     disp('Hint: Start with diagonal matrix') 
     scale_factors=diag(D1)
  else
    if rand<0.5
       td= floor(7*rand+1)/4;
    else
       td=floor(5*rand+1)/3;
    end
    t1=td*pi;
    c=cos(t1);
    s=sin(t1);
    cf=cos(2*t1);
    sf=sin(2*t1);
  end
  if w>1 & w<2
     R1=[c -s;s c];
     M=Z*D*R1;
     disp('Hint: Start with a rotation') 
     degrees = round(td*180)
  end
  if w>=2
     F1=[cf sf;sf -cf];
     M=Z*D*F1;
     disp('Hint: Start with reflection') 
     degrees = round(td*180)
  end
end
if n<4 %Start  Mystery Game
	set(FreezeH, 'CallBack','');
	TarImage = M*InImage;
	axes(RightUpH);
	PlotImag(RightUpH,TarImage,name);
else %Quit Mystery Game
	set(FreezeH, 'CallBack','options(3)');
		PvsImage = InImage;
	axes(RightUpH);
	cla;
end;