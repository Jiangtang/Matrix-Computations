function movefig(F,M,steps,speed,ax)
% The command movefig(F,M,n) will plot the graph of a
% figure F and then transform the figure by applying
% a matrix M to F. The transformed figure replaces
% the original figure. This procedure is iterated
% n times. The effect is that the figure appears to be
% moving across the screen. If a fourth input argument
% t is included then there will be a pause of t seconds
% between plots, otherwise the default pause is 0.05
% seconds. A fifth input argument of a 1 x 4 vector can 
% be used to set the axis scaling. Otherwise the default 
% scaling is axis([-10,10,-10,10]).
if nargin<5
   ax=[-10,10,-10,10];
end
if nargin==3
  speed=0.05;
end
clf
p=line(F(1,:),F(2,:),'erasemode','xor');
figure(gcf)  
axis(ax)
xlabel('Press any key to start animation')
pause
xlabel('')
figure(gcf)
for j=1:steps
   F=M*F;
   set(p,'xdata',F(1,:),'ydata',F(2,:));
   if speed~='off'
      pause(speed)
   end
end
pause on
