  function ShowSymStorage()
% function ShowSymStorage()
% Illustrates the symmetric matrix data structure and a gaxpy
% computation that lives off of it.
% GVL4: Section 1.2.7
clc
n = 4;
A = randn(n,n); 
A = A + A';
disp('A = ')
fprintfM('  %6.3f',A)
y = randn(n,1); 
x = rand(n,1);
y1 = y + A*x;
S = MakeSym(A);
disp('S.vec = ')
fprintfM('  %6.3f',S.vec)
yConventional = y+A*x;
yViaSymGaxpy = SymGaxpy(y,S,x);
err = norm(yConventional - yViaSymGaxpy);
fprintf('\n\n|| yConventional - yViaSymGaxpy || = %6.1e\n',err)




  function y1 = SymGaxpy(y,A,x)
% Band Gaxpy
% A is (nxn) is symmetric and stored in symmetric format.  
% x is (nx1) and y is (nx1).
% y1 = y + A*x
n = A.n;
for j=1:n
    for i=1:j-1
        y(i) = y(i) + A.vec((i-1)*n - i*(i-1)/2 + j)*x(j);
    end
    for i=j:n
        y(i) = y(i) + A.vec((j-1)*n - j*(j-1)/2 + i)*x(j);
    end
end
y1 = y;


  function S = MakeSym(A)
% Stores a conventionally represented symmetric matrix in
% symmetric storage format.
% A is (nxn).

[n,n] = size(A);
S = struct('n',n,'vec',zeros(n*(n+1)/2,1));
for i=1:n
    for j=1:i
        S.vec((n-j/2)*(j-1)+i) = A(i,j);
    end
end