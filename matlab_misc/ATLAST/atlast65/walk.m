function walk(steps,ss)
% The command walk(steps) will generate a plot
% of a stick figure. Press any key and stick figure
% will walk across the screen. The input
% argument, steps, determines how far it walks.
% The movement of the upper body is a successions
% of horizontal translations. The leg movements
% are rotations about the origin followed by
% horizontal translations so that the legs keep
% up with the body. (A desirable property for walking.)
% A second input argument t will cause the figure to pause
% t seconds after each incremental movement. If no second
% input argument is included, the default pause is 0.05. 
clf
leg1=[-.3,-.5;-2.7,-2.8;1,1];
leg2=[.5,.7,.5;-2.8,-2.7,-2.8;1,1,1];
z=[0;0;1];
body=[0,-.4,-.5,-.4,0,.5,.6,.5,0,0;1.5,1.2,1,1.2,1.5,1.6,1.8,1.6,1.5,2;1,1,1,1,1,1,1,1,1,1];
v=-1.6:0.1:4.7;
head=[0.3*cos(v);0.3*sin(v)+2.3;ones(size(v))];
F=[leg1 z leg2 z body head];
u=max(size(F));
t=pi/180;
R1=[cos(t) -sin(t) 0; sin(t) cos(t) 0;0 0 1];
R2=inv(R1);
M=[1 0 .1;0 1 0; 0 0 1];
l = line(F(1,:),F(2,:),'erasemode','background');
axis([-2,steps+2,-3,3])
steps=ceil(steps/2);
figure(gcf)
xlabel('press any key to start')
pause
if nargin==1
   ss=0.05;
end
xlabel('')
for k=1:steps
  for j=1:10
     z=M*z;
     leg1=R1*leg1;
     leg2=R2*leg2;
     m1=[1 0 z(1);0 1 0;0 0 1];
     F(:,1:2)= m1*leg1;
     F(:,3)=z;
     F(:,4:6)= m1*leg2;
     F(:,7:u)=M*F(:,7:u);
     set(l,'xdata',F(1,:),'ydata',F(2,:));
  	 pause(ss)
  end
  for j=1:10
     z=M*z;
     leg1=R2*leg1;
     leg2=R1*leg2;
     m1=[1 0 z(1);0 1 0;0 0 1];
     F(:,1:2)= m1*leg1;
     F(:,3)=z;
     F(:,4:6)= m1*leg2;
     F(:,7:u)=M*F(:,7:u);
     set(l,'xdata',F(1,:),'ydata',F(2,:));
	 pause(ss)
   end
end
pause on
