function eigplot(a)
% The command eigplot(A) will generate a plot of the  
% eigenvalues of the matrix A in the complex plane.  
%
% To zoom in on a particular eigenvalue move the mouse
% so that the pointer on the screen lines up with the
% eigenvalue and then click the left mouse button.
% Keep clicking the left button until you have zoomed in
% to your desired accuracy. You can zoom back out by 
% clicking on the right mouse button.
figure(1)
    ea=eig(a);
    plot(real(ea),imag(ea),'x')
    v=axis;
    v(1)=min(v(1),-1);
    v(2)=max(v(2),1);
    v(3)=min(v(3),-1);
    v(4)=max(v(4),1);
    axis=v;
    xd=(v(2)-v(1))/40;
    yd=(v(4)-v(3))/20;
    xpos=v(2)+xd;
    ypos=v(4)+yd;
    text('Position',[xpos 0],'String','Re')
    text('Position',[-xd,ypos],'String','Im')    
    hold on
    plot([v(1),v(2)],[0,0],'r',[0,0],[v(3),v(4)],'r')
    hold off
    xlabel('Click left mouse button to zoom in; right button to zoom out')
    zoom on
