function powplot(A,u)  
% The function powplot(A) is used to demonstrate geometrically
% the effects of applying powers of a 2x2 matrix A to any 
% unit vector. This is done by plotting the image of the unit circle
% under the  transformations A^k, for k=1,...,25. If A has real 
% eigenvalues then an eigenvector of A is also plotted. If A has a 
% dominant eigenvalue then its eigenvector is the one that is plotted.
% 
% If a unit vector u is specified as a third input argument
% then the images of u under the powers of A are also plotted.

[X,D]=eig(A); 
d=diag(D);
t=0:0.1:6.3; 
x=cos(t); y=sin(t); C=[x;y];
[p,m]=max(abs(d));
s=ceil(max(max(C)));
z=X(:,m);
figure(1)
if imag(d(1))==0
   plot(x,y,[0,z(1)],[0,z(2)],'r')
   hold on
   t1=tip(z',s);
   fill(t1(1,:),t1(2,:),'r')
else
   plot(x,y)
end
hold on
if nargin==2
   plot([0,u(1)],[0,u(2)],'g')
   u1=tip(u',s);
   fill(u1(1,:),u1(2,:),'g')
end
axis('square')
axis([-2,2,-2,2])
xlabel('Press any key to see images under A^j, j=1,...,25')
pause
figure(1)
for j=1:25
    C=A*C; z=A*z; s=1.2*max(max(C)); t1=tip(z',s);
    if s>0.5
      s=ceil(s);
    end
    if imag(d(1))==0
       plot(C(1,:),C(2,:),[0,z(1)],[0,z(2)],'r')
       hold on
       t1=tip(z',s);
       fill(t1(1,:),t1(2,:),'r')
    else
       plot(C(1,:),C(2,:))
    end
    axis('square')
    axis([-s,s,-s,s])
    hold on
    if nargin==2
       u=A*u;
       plot([0,u(1)],[0,u(2)],'g')
       u1=tip(u',s);
       fill(u1(1,:),u1(2,:),'g')
    end
    hold off
    pause(0.1)
end
