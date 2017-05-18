function noreturn=grfhd(arg1, arg2, arg3);
% grfhd :  This program handles graph interface for fractal - an ATLAST
%   workshop project: 2D/3D Fractal Pictures of a Fern and Other Fractal Images!
% This project is developed by: Victor, Daniel, Henry, Herb, Zhang
%    -- szhang@math.udel.edu
 
global sli_1 sli_1cur sli_2 sli_2cur fig cb_box popcol cpop tf np nv cm
global edp x pct sttxt

se='Style'; sg='String'; pn='Position'; ck='CallBack';ve='Value';
ut='Unit'; nd='normalized'; 
 
if (nargin == 0 ),
   % Assign a handle to the figure window and clear it
   cm=['yyccbbkkmmrrggyyccbbkkmmrrggyy'];
fig=figure('MenuBar', 'none', 'NumberTitle','off',...
   'Name', 'ATLAST Project: Fractal Images Demos',...
   'Units', 'normalized'); clf;
ax=axes('Box','on','NextPlot','add',pn,[0.22 0.25 0.76 0.73]);
edp=uicontrol(fig, se,'edit',sg, {['tf=[' gettf(1)];
   ['    ' gettf(2)];  ['    ' gettf(3)];  ['    ' gettf(4)];  ['    ' gettf(5) '];']},...
   'HorizontalAlignment', 'left',...
   ut,nd, pn,[0.2 0.02 0.79 0.18],'BackgroundColor',[0.99 0.9 0.7], 'Max',8, ...
   ck, 'eval(char(get(edp,''String''))'')' );
set(fig,'WindowButtonDownfcn',['pct=get(gca,''CurrentPoint'');'...
      'fpara(''ctr'',''1'')'] );
np=8; nv=500;
%Create a push button and a push button for value of a slider
sttxt=uicontrol(fig, se,'text',ut,nd,pn,           [0.005 0.01 .16 .09], ... 
                'BackgroundColor','red');
pbstart=uicontrol(fig,se,'push',ut,nd,pn,[.01 .02 .15 .05], sg, 'Plot Now!', ...
   ck, 'grfhd(0)');
uicontrol(fig,se,'push',ut,nd,pn,[0.01 0.9  .15 .045],sg,'Project Info',ck,'fwin(1)');
uicontrol(fig,se,'push',ut,nd,pn,[0.01 0.85 .15 .045],sg,'Theory',ck,'fwin(2)');
uicontrol(fig,se,'push',ut,nd,pn,[0.01 0.8  .15 .045],sg,'Tech Support',ck,'fwin(3)');
uicontrol(fig,se,'push',ut,nd,pn,[0.01 0.75  .15 .045],sg,'Help',ck,'fwin(4)');
uicontrol(fig,se,'push',ut,nd,pn,[0.01 0.70 .15 .045],sg,'Exit',...
    'ForegroundColor','red', ck,'close');

 %pbgetval=uicontrol(fig,'Style','push','Position',[120 10 120 25],...
 %  'String', 'Get Slider Value',...
 % 'CallBack', 'disp(get(sli_1,''value''))');
uicontrol(fig, se,'text',ut,nd,pn,[0.005 0.38 .16 .15],sg,{'Click mouse to', 'center the graph'}, 'BackgroundColor',[0.2 1.0 1.0]);
uicontrol(fig, se, 'push', sg,' Zoom In ', ut,nd,pn,[0.01 0.39 .15 .045],...
    ve,1,ck,'fpara(''zin'',''1'')');
uicontrol(fig, se, 'push', sg,' Zoom Out', ut,nd,pn,[0.01 0.425 .15 .045],...
   ve,1,ck,'fpara(''zout'',''1'')');
%define sli_1 slider and its text

uicontrol(fig, se,'text',ut,nd,pn,           [0.005 0.18 .16 .19], ... 
                'BackgroundColor','yellow');

sli_1=uicontrol(fig, se, 'slider',ut,nd, pn, [0.01 0.19 0.15 0.05],...
  'Min', 100, 'Max', 1000, ve, 500, ck,[...
  'set(sli_1cur,''String'',[int2str(fix(get(sli_1,''Value''))) ''pts per level'']),'...
  'fpara(''nv'',int2str(fix(get(sli_1,''Value''))))'] );

sli_1cur=uicontrol(fig,se,'text',ut,nd,'Pos', [0.01 0.235 0.15 0.03],...
   'String',[int2str(fix(get(sli_1,'Value'))) 'pts per level'] );

sli_2=uicontrol(fig, se, 'slider',ut,nd, pn, [0.01 0.28 0.15 0.05],...
  'Min', 2, 'Max', 16, ve, 8, ck,[...
  'set(sli_2cur,''String'',[int2str(fix(get(sli_2,''Value''))) '' levels '']),'...
  'fpara(''np'',int2str(fix(get(sli_2,''Value''))))'] );

sli_2cur=uicontrol(fig,se,'text',ut,nd,'Pos', [0.01 0.325 0.15 0.03],...
   'String',[int2str(fix(get(sli_2,'Value'))) ' levels '] );

%create check boxes
% txt_1=uicontrol(fig,se,'text', pn, [400 10 100 40], sg, 'check box test');
%cb_box=uicontrol(fig,se,'checkbox',pn, [400 10 100 25],...
%  sg, 'Box=on/off', ck, [  'set(gca,''Box'',''off''),'...
 % 'if get(cb_box,''Value'')==1, set(gca,''Box'',''on''),end' ]);

%create a pop-up menu
uicontrol(fig, se,'text',ut,nd,pn,           [0.005 0.54 .16 .14], ... 
              'BackgroundColor', [1 .8 .8], 'String','Select a demo');
 
popcol=uicontrol(fig, se,'popup',ut,nd,pn,[.01 .6 .15 .05],...
   sg, 'converge pt|fern leaf|tree|dog|cherry|fern|dense fern|snow twig|triangle|diamond|jump dog|window|twig|snow flake| flake|old true|footprints', ...
   ve,6,ck, ['fpara(''tf'',[''tf'' int2str(get(popcol,''value''))]);' ...
             'grfhd(''edp'')' ] ); 
cpop=uicontrol(fig, se,'popup',ut,nd,pn,[.01 .55 .15 .05],...
   sg, 'Color|Yellow|Black|Blue|Green|Red', ...
   ve,1,ck,'fpara(''cm'',[''cm'' int2str(get(cpop,''value''))])'); 
  grfhd(0)
  return
end
if(arg1==0),
%Draw now
 k=1; a1=[tf(k,1:2);tf(k,3:4)]; y(:,k)=tf(k,5:6)'; p(k)=tf(k,7);
 k=2; a2=[tf(k,1:2);tf(k,3:4)]; y(:,k)=tf(k,5:6)'; p(k)=tf(k,7)+p(k-1);
 k=3; a3=[tf(k,1:2);tf(k,3:4)]; y(:,k)=tf(k,5:6)'; p(k)=tf(k,7)+p(k-1);
 k=4; a4=[tf(k,1:2);tf(k,3:4)]; y(:,k)=tf(k,5:6)'; p(k)=tf(k,7)+p(k-1);
 k=5; a5=[tf(k,1:2);tf(k,3:4)]; y(:,k)=tf(k,5:6)'; p(k)=tf(k,7)+p(k-1);
   cla; x=[0 0]'; plot(x,'.'); hold on; axis('equal') 
   for n=1:np, q=rand(nv,1); clear yy; for m=nv:-1:1; 
         if     q(m)<p(1), x=a1*x+y(:,1);
         elseif q(m)<p(2), x=a2*x+y(:,2);
         elseif q(m)<p(3), x=a3*x+y(:,3);
         elseif q(m)<p(4), x=a4*x+y(:,4);
         else              x=a5*x+y(:,5); end
         yy(m,:)=x'; end,   
      plot(yy(:,1),yy(:,2),[cm(n) '.']); drawnow; 
      if nv==1, if n==np,
            text(yy(1), yy(2), [' pt:' int2str(n) '(done)']); 
         else text(yy(1), yy(2), [' pt:' int2str(n) ]); end
         pause(2); end
      set(sttxt, sg, ['  Level:   ' int2str(n)]);
   end; hold off; 
   set(sttxt, sg, ['  Done ']);
end
 if (arg1=='edp'),
   set(edp, sg,{['tf=[' gettf(1)]; ...
      ['    ' gettf(2)];  ['    ' gettf(3)]; ...
      ['    ' gettf(4)];  ['    ' gettf(5) ']; '] } );
 end
