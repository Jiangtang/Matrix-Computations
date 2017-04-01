function rollit(n,tt)
% The command ROLLIT(n) will generate a plot of
% a colored wheel.  Press any key and the wheel
% will roll across the screen for the distance
% n.  Initially the wheel is centered at the origin.
% The motion is simulated by a sequence of rotations 
% and translations. The wheel is successively rotated 
% in its initial position and then translated forward 
% to the proper position on the x-axis. To adjust the 
% speed of the motion include a second input argument t. 
% This makes the wheel pause for t seconds every time it 
% covers a distance of n/60.  The default pause for is
% 0.05 seconds.

clf
t = linspace(0,2*pi,16);
x = cos(t);
y = sin(t);             % forming a circle
T = [x;y;ones(1,16)];   % for the wheel
v1 = [1;0;1];
v2 = [1/2;sqrt(3)/2;1];
v3 = [-1/2;sqrt(3)/2;1];
v4 = [-1;0;1];
v5 = [-1/2;-sqrt(3)/2;1];
v6 = [1/2;-sqrt(3)/2;1];
z = [0;0;1];
T = [T,z,v1,z,v2,z,v3,z,v4,z,v5,z,v6];
M1 = [1 0 0; 0 1 0; 0 0 1]; % translation matrix from the origin
M = [1 0 n/60;0 1 0;0 0 1]; % translation forward
R = [cos(n/60),sin(n/60),0;-sin(n/60),cos(n/60),0;0 0 1];
plot([-1 n+1],[-1,-1],'r');
l(1) = line(T(1,1:16),T(2,1:16),'color','k','erasemode','xor');
l(2) = line(T(1,17:18),T(2,17:18),'color','r','erasemode','xor');
l(3) = line(T(1,19:20),T(2,19:20),'color','c','erasemode','xor');
l(4) = line(T(1,21:22),T(2,21:22),'color','m','erasemode','xor');
l(5) = line(T(1,23:24),T(2,23:24),'color','g','erasemode','xor');
l(6) = line(T(1,25:26),T(2,25:26),'color','r','erasemode','xor');
l(7) = line(T(1,27:28),T(2,27:28),'color','b','erasemode','xor');
figure(gcf)
axis([-1 n+1 -1 3]);
axis equal
xlabel('Press any key to start the wheel rolling')
pause
xlabel('')
for i = 1:60
	figure(gcf);
	T=R*T;        % Rotate about origin
	L=M*T;        % Translate horizontally
	M(1,3) = M(1,3) + n/60; % Increase horizontal translation
	set(l(1),'xdata',L(1,1:16),'ydata',L(2,1:16));
	set(l(2),'xdata',L(1,17:18),'ydata',L(2,17:18));
	set(l(3),'xdata',L(1,19:20),'ydata',L(2,19:20));
	set(l(4),'xdata',L(1,21:22),'ydata',L(2,21:22));
	set(l(5),'xdata',L(1,23:24),'ydata',L(2,23:24));
	set(l(6),'xdata',L(1,25:26),'ydata',L(2,25:26));
	set(l(7),'xdata',L(1,27:28),'ydata',L(2,27:28));
	if nargin == 1
		tt=0.05;
	end
    pause(tt);
end
