function gersch(a,eigplot,color)
% The command gersch(A) will plot the Gerschgorin circles
% of A in the complex plane. The command gersch(A,eigplot) 
% will plot the Gerschgorin circles and if eigplot equals 1 it will 
% also plot the eigenvalues of A. One can specify a color for 
% the plot by including as a third argument a string specifying
% the color.  For example the command gersch(magic(5),1,'b') will 
% generate a plot of the eigenvalues and Gerschgorin circles of 
% a $5\times 5$ magic square and the plot will be drawn in blue.
if nargin==1  
   eigplot=0;
end
if eigplot
   e=eig(a);
else
   e=[];
end
c=diag(a);
r=sum(abs(a-diag(c))');
t=0:0.1:6.3;
x=real(c)*ones(1,length(t))+r'*cos(t);
y=imag(c)*ones(1,length(t))+r'*sin(t);
if nargin == 3
   plot(x',y',color,real(e),imag(e),[color,'*'])
else
   plot(x',y',real(e),imag(e),'*')
end
axis equal