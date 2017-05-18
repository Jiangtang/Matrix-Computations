function trans( choice )
	% Modified by Emily H. Moore,  5/23/96
    % Modified by Steven Leon, 5/12/2002
	% declaring global variables
global   InImage  PvsImage  CurImage TarImage  PriorImage
global   Recent  Total
global   name  UndoFlag   FigH  LeftBotH  RightBotH
PriorImage = PvsImage;
PvsImage = CurImage;
h = sort( findobj( gcf, 'Style', 'edit' ));
M = eye(2);
if choice == 1                          % Rotation
   str = get(h(1), 'String' );
   if ~isempty(str)
      degrees = str2num( str );
      Radians = degrees * pi/180;
      M = [cos(Radians),-sin(Radians);sin(Radians),cos(Radians)];
   end
elseif choice == 2
   str = get(h(2), 'String' );
   if ~isempty(str)
      degrees = str2num( str );
      Radians = 2 * degrees * pi/180;
      M = [cos(Radians), sin(Radians); sin(Radians),-cos(Radians)];
   end
elseif choice == 3
   str = get(h(3), 'String' );
   if ~isempty(str)
      eval([ 'D = [ ' str '];' ])
      M = diag( D );
   end
elseif choice == 4
   str = get(h(4), 'String' );
   if ~isempty(str)
       eval([ 'M = [ ' str '];' ])
       % if prod( size(M) == [1 4] )
       if size(M) == [1 4] 
	  M = (reshape( M, 2, 2 ))';
       end
   end
end
CurImage = M * CurImage;
Recent = M;
Total = M * Total;
UndoFlag = 0;
axes(LeftBotH);
PlotImag(LeftBotH,PvsImage,name);
axes(RightBotH);
PlotImag(RightBotH,CurImage,name);