  function ShowEigTool()
% function ShowEigTool()
% Screen snapshots of the eigtool windows associated with
% Figures 7.9.2, 7.9.3, and 7.9.4.
% GVL4: Section 7.8
% Full appreciation of this section requires playing with eigtool.
% To download this system, see
%         http://www.cs.ox.ac.uk/pseudospectra/eigtool/
close all
figure
imshow('Fig7_9_2.jpg')
pos = get(gcf,'position');
close
plot([],[])
axis([0 100 0 100])
text(20,60,'Eigtool Window','fontsize',36,'color','y')
text(20,50,'Kahan Example','fontsize',36,'color','y')
text(20,40,'Figure 7.9.2...','fontsize',36,'color','y')
axis  off
set(gcf,'color','k')
set(gcf,'position',pos)
pause(3)
imshow('Fig7_9_2.jpg')
pause(5)

figure
axis([0 100 0 100])
text(20,60,'Eigtool Window','fontsize',36,'color','y')
text(20,50,'Demmel Example','fontsize',36,'color','y')
text(20,40,'Figure 7.9.3...','fontsize',36,'color','y')
axis  off
set(gcf,'color','k')
set(gcf,'position',pos)
pause(3)
imshow('Fig7_9_3.jpg')
pause(5)


figure
axis([0 100 0 100])
text(20,60,'Eigtool Window','fontsize',36,'color','y')
text(20,50,'Gallery(5) Example','fontsize',36,'color','y')
text(20,40,'Figure 7.9.4...','fontsize',36,'color','y')
axis  off
set(gcf,'color','k')
set(gcf,'position',pos)
pause(3)
imshow('Fig7_9_4.jpg')
pause(5)


