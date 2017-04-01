function eigsvdshow(arg)
%eigsvdshow Graphical demonstration of eigenvalues and singular values.
%
%   This is the same MATLAB's eigshow utility, except that more information
%   is displayed on the screen.
%
%   eigsvdshow presents a graphical experiment showing the effect on the
%   the unit circle of the mapping induced by various 2-by-2 matrices.
%   A pushbutton allows the choice of "eig" mode or "svd" mode.
%
%   In eig mode, the mouse can be used to move the vector x around the
%   unit circle.  The resulting trajectory of Ax is plotted.  The object
%   is to find vectors x so that Ax is parallel to x.  Each such x is an
%   eigenvector of A.  The length of Ax is the corresponding eigenvalue.
%
%   In svd mode, the mouse moves two perpendicular unit vectors, x and y.
%   The resulting Ax and Ay are plotted.  When Ax is perpendicular to
%   Ay, then x and y are right singular vectors, Ax and Ay are
%   multiples of left singular vectors, and the lengths of Ax and Ay
%   are the corresponding singular values.
%
%   The figure title is a menu of selected matrices, including some
%   with fewer than two real eigenvectors.  eigsvdshow(A) inserts A,
%   which must be 2-by-2, in the menu.
%
%   Here are some questions to consider:
%      Which matrices are singular?
%      Which matrices have complex eigenvalues?
%      Which matrices have double eigenvalues?
%      Which matrices have eigenvalues equal to singular values?
%      Which matrices have nondiagonal Jordan canonical forms?

%   Copyright (c) 1984-98 by The MathWorks, Inc.
%   $Revision: 1.2 $  $Date: 1997/11/21 23:25:37 $


set(gcf,'Color','w')

if nargin == 0;
   initialize
elseif arg == 0
   action
elseif arg < 0
   setmode(arg)
else
   initialize(arg);
end

%------------------

function initialize(arg)

if nargin == 0
   arg = 6;
end

if isequal(get(gcf,'tag'),'eigsvdshow');
   h = get(gcf,'userdata');
   mats = h.mats;
else
   set(gcf,'numbertitle','off','menubar','none')
   h.svd = 0;
   mats = {
      '[5/4 0; 0 3/4]'
      '[5/4 0; 0 -3/4]'
      '[1 0; 0 1]'
      '[0 1; 1 0]'
      '[0 1; -1 0]'
      '[1 3; 4 2]/4'
      '[1 3; 2 4]/4'
      '[3 1; 4 2]/4'
      '[3 1; -2 4]/4'
      '[2 4; 2 4]/4'
      '[2 4; -1 -2]/4'
      '[6 4; -1 2]/4'
      'randn(2,2)'};
end

if all(size(arg)==1)
   if (arg < length(mats))
      mindex = arg;
      A = eval(mats{mindex});
   else
      A = randn(2,2);
      S = ['[' sprintf('%4.2f %4.2f; %4.2f %4.2f',A) ']'];
      mindex = length(mats);
      mats = [mats(1:mindex-1); {S}; mats(mindex)];
   end
else
   A = arg;
   if isstr(A)
      S = A;
      A = eval(A);
   else
      S = ['[' sprintf('%4.2f %4.2f; %4.2f %4.2f',A') ']'];
   end
   if any(size(A) ~= 2)
      error('Matrix must be 2-by-2')
   end
   mats = [{S};  mats];
   mindex = 1;
end

clf
if h.svd, t = 'svd / (eig)';
    else, t = 'eig / (svd)';
end
uicontrol(...
   'style','pushbutton', ...
   'units','normalized', ...
   'position',[.86 .60 .12 .06], ...
   'string',t, ...
   'value',h.svd, ...
   'callback','eigsvdshow(-1)');
uicontrol(...
   'style','pushbutton', ...
   'units','normalized', ...
   'position',[.86 .50 .12 .06], ...
   'string','help', ...
   'callback','helpwin eigsvdshow')
uicontrol(...
   'style','pushbutton', ...
   'units','normalized', ...
   'position',[.86 .40 .12 .06], ...
   'string','close', ...
   'callback','close(gcf)')
uicontrol(...
   'style','popup', ...
   'units','normalized', ...
   'position',[.28 .92 .48 .08], ...
   'string',mats, ...
   'tag','mats', ...
   'fontname','courier', ...
   'fontweight','bold', ...
   'fontsize',14, ...
   'value',mindex, ...
   'callback','eigsvdshow(get(gco,''value''))');

s = 1.1*max(1,norm(A));
axis([-s s -s s])
axis square
xcolor = [0 .6 0];
Axcolor = [0 0 .8];
h.A = A;
h.mats = mats;
%x=[1 0]';
%ax=A*x;
xstr=sprintf( '[ % 6.3f % 6.3f ]''', 1, 0 );
Axstr=sprintf( '[ % 6.3f % 6.3f ]''', A(1,1), A(2,1) );
normstr=sprintf( '%6.3f''', norm(A(:,1)));
txt.xstr=xstr;
txt.axstr=Axstr;
txt.normstr=normstr;
h.xtext = text( -1.68*s, .9*s, txt.xstr,'erase','xor','fontweight','bold','VerticalAlignment', 'bottom', ...
      'Color', xcolor );
h.axtext = text( -1.05 * s, .6*s, txt.axstr,'erase','xor', 'fontweight','bold','HorizontalAlignment', 'right', ...
      'VerticalAlignment', 'bottom', 'Color', Axcolor);
h.normtext = text(-1.42 * s, .3*s, txt.normstr, 'erase','xor','fontweight','bold','HorizontalAlignment', 'right', ...
      'VerticalAlignment', 'top', 'Color', Axcolor );
h.x = initv([1 0]','x',xcolor);
h.Ax = initv(A(:,1),'Ax',Axcolor);
 
if h.svd
   %y=[0 1]';
   %ay=A*y;
   ycolor = xcolor;
   aycolor = Axcolor;
   ystr=sprintf( '[ % 6.3f % 6.3f ]''', 0, 1 );
   txt.ystr=ystr;
   Aystr=sprintf( '[ % 6.3f % 6.3f ]''', A(1,2), A(2,2) );
   txt.aystr=Aystr;
   ynormstr=sprintf( '%6.3f', norm(A(:,2)));
   txt.ynormstr=ynormstr;
   [theta,pt]=getangle([1 0]',A(:,1),[0 1]',A(:,2));
   txt.theta=sprintf('%4.1f',theta,'k');   
   h.textangle=text(pt(1),pt(2),txt.theta,'erase','xor');
   h.ytext = text( -1.68*s, -.3*s, txt.ystr,'erase','xor','fontweight','bold','VerticalAlignment', 'bottom', ...
      'Color', xcolor );
   h.aytext = text( -1.05* s, -.6*s, txt.aystr,'erase','xor', 'fontweight','bold','HorizontalAlignment', 'right', ...
      'VerticalAlignment', 'bottom', 'Color', Axcolor);
   h.ynormtext = text(-1.42 * s,-.9*s, txt.ynormstr, 'erase','xor','fontweight','bold','HorizontalAlignment', 'right', ...
      'VerticalAlignment', 'top', 'Color', Axcolor );
   h.y = initv([0 1]','y',ycolor);
   h.Ay = initv(A(:,2),'Ay',aycolor);
   xlabel('Make Ax perpendicular to Ay','fontweight','bold')
   set(gcf,'name','svdshow')
else
   xlabel('Make Ax parallel to x','fontweight','bold')
   set(gcf,'name','eigsvdshow')
end
set(gcf,'tag','eigsvdshow', ...
   'userdata',h, ...
   'windowbuttondownfcn', ...
      'eigsvdshow(0); set(gcf,''windowbuttonmotionfcn'',''eigsvdshow(0)'')', ...
   'windowbuttonupfcn', ...
   'set(gcf,''windowbuttonmotionfcn'','''')')
text( -1.66 * s,.98* s, 'x = ', 'fontweight','bold','VerticalAlignment', 'bottom', 'Color', xcolor );
text( -1.48 * s, .68 * s, 'Ax = ', 'fontweight','bold','HorizontalAlignment', 'right', ...
      'VerticalAlignment', 'bottom', 'Color', Axcolor);
text( -1.25*s, .38*s, 'x''Ax =', 'fontweight','bold','HorizontalAlignment', 'right', ...
   'VerticalAlignment', 'top', 'Color', Axcolor );  
   % Modified by S. J. Leon 8-4-02
if h.svd
   text( -1.66 * s,-.22* s, 'y = ', 'fontweight','bold','VerticalAlignment', 'bottom', 'Color', xcolor );
   text( -1.48 * s, -.52 * s, 'Ay = ', 'fontweight','bold','HorizontalAlignment', 'right', ...
      'VerticalAlignment', 'bottom', 'Color', Axcolor);
   text( -1.25*s, -.82*s, 'y''Ay =', 'fontweight','bold','HorizontalAlignment', 'right', ...
      'VerticalAlignment', 'top', 'Color', Axcolor ); 
   % Modified by S. J. Leon, 8-4-02
end
drawtext(h,txt); 
%------------------

function h = initv(v,t,color)
h.mark = line(v(1),v(2),'marker','.','erase','none','color',color);
h.line = line([0 v(1)],[0 v(2)],'erase','xor','color',color);
h.text = text(v(1)/2,v(2)/2,t,'fontsize',12,'erase','xor','color',color);

%------------------

function action
h = get(gcf,'userdata');
pt = get(gca,'currentpoint');
x = pt(1,1:2)';
x = x/norm(x);
A = h.A;
s = 1.1*max(1,norm(A));
ax=A*x;
movev(h.x,x);
movev(h.Ax,A*x);
xstr=sprintf( '[ % 6.3f % 6.3f ]''', x(1), x(2) );
txt.xstr=xstr;
Axstr=sprintf( '[ % 6.3f % 6.3f ]''', ax(1), ax(2) );
txt.axstr=Axstr;
normstr=sprintf( '%6.3f', x'*A*x); % Modified by S. J. Leon, 8-4-02
txt.normstr=normstr;

if h.svd
   y = [-x(2); x(1)];
   ay=A*y;
   movev(h.y,y);
   movev(h.Ay,A*y);
   ystr=sprintf( '[ % 6.3f % 6.3f ]''', y(1), y(2) );
   txt.ystr=ystr;
   Aystr=sprintf( '[ % 6.3f % 6.3f ]''', ay(1), ay(2) );
   txt.aystr=Aystr;
   ynormstr=sprintf( '%6.3f', y'*A*y); % Modified by S. J. Leon, 8-4-02
   txt.ynormstr=ynormstr;
   [theta,pt]=getangle(x,A*x,y,A*y);
   txt.theta=sprintf('%4.1f',theta);
end
drawtext(h,txt);
%------------------

function movev(h,v)
set(h.mark,'xdata',v(1),'ydata',v(2));
set(h.line,'xdata',[0 v(1)],'ydata',[0 v(2)]);
set(h.text,'pos',v/2);


%------------------
function drawtext(h,txt)
   set( h.xtext, 'String', txt.xstr );  %Modified by Lila Roberts
   set( h.axtext, 'String', txt.axstr);   %Modified by Lila Roberts
   set(h.normtext,'String', txt.normstr);
if h.svd
   set( h.ytext, 'String', txt.ystr );  %Modified by Lila Roberts
   set( h.aytext, 'String', txt.aystr);   %Modified by Lila Roberts
   set(h.ynormtext,'String', txt.ynormstr);
   set(h.textangle,'string',txt.theta);
end
   
%------------------

function setmode(arg)
h = get(gcf,'userdata');
h.svd = ~h.svd;
set(gcf,'userdata',h)
initialize(get(findobj(gcf,'tag','mats'),'value'))

function [theta,pt]=getangle(x,Ax,y,Ay)
theta = (180/pi)*acos((Ax)'*Ay/(norm(Ax)*norm(Ay)));
pt = -(x+y)/5 - [.05 0]';
