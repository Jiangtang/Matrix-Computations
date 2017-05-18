function options(n)	% helper function for the OptsMenu	% Modified by Emily H. Moore,  5/23/96	% declaring global variablesglobal   InImage  PvsImage  CurImage TarImage  PriorImageglobal   name  UndoFlag   Recent  Totalglobal   FigH  LeftUpH  RightUpH  LeftBotH  RightBotHif (n == 1) & (UndoFlag == 0)                   % Undo the last action
	CurImage = PvsImage;
	PvsImage = PriorImage;
	Total = inv(Recent) * Total;
	Recent = eye(2);                % consider if user tries to undo
	UndoFlag = 1;                   % more than once
	axes(LeftBotH);
	PlotImag(LeftBotH,PvsImage,name);
	axes(RightBotH);
	PlotImag(RightBotH,CurImage,name);
elseif n == 2                                   % Restart
	PvsImage = InImage;
	CurImage = InImage;
	PriorImage = InImage;
	UndoFlag = 0;
	Recent = eye(2);
	Total = eye(2);
						    % Draw starting picture:
	axes(LeftBotH);
	PlotImag(LeftBotH,PvsImage,name);
	axes(RightBotH);
	PlotImag(RightBotH,CurImage,name);
	h = findobj( gcf, 'Style', 'edit' );
	for i = 1:length(h)
	   set(h(i), 'String', '')
	end
	h = findobj( gcf, 'Tag', 'total' );
	set( h, 'Visible', 'off' )
elseif n == 3                                   % Freeze the image
	TarImage = CurImage;
	axes(RightUpH)
	PlotImag(RightUpH,TarImage,name);
elseif n == 4                                   % Current Transformation?
	h = sort(findobj( gcf, 'Tag', 'total' ));
	A = Total;
	str1 = [ '[ ' sprintf('%7.4f', A(1,1)) ' ' sprintf('%7.4f', A(1,2)) '; ' ];
	str2 = [ sprintf('%7.4f', A(2,1)) ' ' sprintf('%7.4f', A(2,2)) ' ]' ];
	set( h(1), 'String', str1, 'Visible', 'on' )
	set( h(2), 'String', str2, 'Visible', 'on' )
elseif n == 5                                   % Hide current transaction
	h = findobj( gcf, 'Tag', 'total' );
	set( h, 'Visible', 'off' )
elseif n == 6                                   % Quit
	close(FigH);
	clc;
end
echo on