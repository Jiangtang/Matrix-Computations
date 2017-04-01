  function ShowVandermonde()
% function ShowVandermonde()
% Illustrates Vandermonde system solving.
clc
n = 4;
x = [-2 -1 1 2 3];
V = Vandermonde(x);
fprintf('Vandermonde System Solving\n\n')
fprintf('V = ')
fprintfM('%4d',V)
f = randn(n+1,1);
% Solve V'a = f ...'
aTrue = V'\f;
a = VTsolve(x,f);
fprintf('|| VTSolve(x,f) - V''\\f || = %10.3e\n\n',norm(aTrue - a))
% Solve Vz = b ...'
b = randn(n+1,1);
zTrue = V\b;
z = Vsolve(x,b);
fprintf('|| VSolve(x,b) - V\\b||    = %10.3e\n\n',norm(zTrue - z))


  function V = Vandermonde(x)
% x is 1x(n+1) and has distinct entries.
% V is the (n+1)x(n+1) Vandermonde matrix with V(i,j) = x(j()^{i-1}
n = length(x)-1;
V = ones(n+1,n+1);
for i=2:n+1
   V(i,:)  = V(i-1,:).*x;
end
       
  function a = VTsolve(x,f)
% x is 1x(n+1) has distinct entries
% f is (n+1)x1
% a is (n+1)x1 and solves V'a = f where V = Vandermonde(x)
% GVL4: Algorithm 4.6.1  (with subscripting from 1)
n = length(f)-1;
for k=0:n-1
   for i=n:-1:k+1
      f(i+1) = (f(i+1)-f(i))/(x(i+1)-x(i-k));
   end
end
for k=n-1:-1:0
   for i = k:n-1
      f(i+1) = f(i+1) - f(i+2)*x(k+1);
   end
end
a = f;
        
  function z = Vsolve(x,b)
% x is 1x(n+1) has distinct entries
% f is (n+1)x1
% a is (n+1)x1 and solves V'a = f where V = Vandermonde(x)
% GVL4: Algorithm 4.6.2  (with subscripting from 1)                
n = length(b)-1;
for k=0:n-1
   for i = n:-1:k+1
      b(i+1) = b(i+1) - x(k+1)*b(i);
   end
end
for k=n-1:-1:0
   for i=k+1:n
      b(i+1) = b(i+1)/(x(i+1)-x(i-k));
   end
   for i=k:n-1
      b(i+1) = b(i+1)- b(i+2);
   end
end
z = b;
      
        