  function ShowRayleigh()
% function ShowRayleigh()
% Illustrates the Rayleigh Quotient iteration when it is
% used to compute the smallest eigenvalue of a symmetric matrix.
% GVL4: Section 8.2.3
n = 20;
I = eye(n,n);
% Generate a random symmetric matrix...
A = randn(n,n); A = (A+A')/2; [Q,D] = schur(A);
% See if the method finds the eigenvalue closest to zero.
% Initial vector obtained by one inverse power method step.
x = randn(n,1); x = A\x; x = x/norm(x);
% The Rayleigh quotient iteration...
itMax = 100;
k = 0;
y = A*x;
mu = x'*y;
while k<itMax && norm(y - mu*x)>10^-12
    z = (A - mu*I)\x;
    x = z/norm(z);
    y = A*x;  
    mu = x'*y;
    k = k+1;
end
clc
fprintf('Rayleigh Quotient Iteration\n\n')
fprintf('      eig(A)    \n')
fprintf('-------------------\n')
d = diag(D); [v,j] = min(abs(d));
for i=1:n
    if i==j
       fprintf('%20.15f  <----- finds this in %1d iterations\n',d(i),k)
    else
       fprintf('%20.15f  \n',d(i))
    end
end


