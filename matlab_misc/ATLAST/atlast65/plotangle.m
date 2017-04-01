function [s,t]=plotangle(x,y)
% The command s = plotangle(x,y) will determine the
% angle s in radians between nonzero vectors x and y. If
% both vectors are in 2-space, the angle will be 
% plotted. The plot will show the two vectors in red
% and unit vectors in the same directions in blue.
% 
% If x and y are vectors in n-space (n>2), then they span
% a two dimensional subspace of n-space. A two dimensional 
% subspace can be modeled as a plane. For this planar 
% representation of the subspace we plot the angle between 
% the vectors. In this case it is assumed that the vectors 
% have been rotated by a fixed angle so that one of the vectors 
% points in the direction of the positive x-axis of the plane.
%
% When no output arguments are used, only the graph
% is plotted. If two output arguments are used
%      [s,t] = plotangle(x,y) 
% the s equals the radian measure of the angle and t equals the 
% degree measure. 
[m,n]=size(x);
if m==1
    x=x';
end    
[j,k]=size(y);
if j==1
    y=y';
end 
if ([m,n]~=[j,k])
    error('Vectors don"t match in size')
end 
if (norm(x)==0)|(norm(y)==0)
    error('Input vectors must be nonzero')
end    
nx=norm(x);
ny=norm(y);
aa=max(nx,ny)+1;
u=x/nx;
v=y/ny;
s=acos(u'*v);    
t=s*180/pi;
anglestr=sprintf( '%6.3f', t);
if max([m,n])>2
   x=[nx;0];
   u=[1;0];
   v=[cos(s);sin(s)];
   y=norm(y)*v;
end   
drawvec(x,'r'); hold on
drawvec(y,'r'); hold on
drawvec(u,'b'); hold on
drawvec(v,'b'); hold on
A=u;
mm=max(abs(v-[cos(s),-sin(s);sin(s),cos(s)]*u));
if mm<100*eps
     ss=1;
else
     ss=-1;
end    
for w=.1:.1:1
     z=[cos(w*s),-ss*sin(w*s);ss*sin(w*s),cos(w*s)]*u;
     A=[A z];
end   
plot(A(1,:),A(2,:))
hold off
axis([-aa,aa,-aa,aa])
xlabel(['The angle between the vectors is ' anglestr ' degrees'])
   