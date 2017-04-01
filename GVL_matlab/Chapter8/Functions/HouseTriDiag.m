  function [U0,T] = HouseTriDiag(A)
% function [U0,T] = HouseTriDiag(A)
% Householder reduction of a symmetric matrix to tridiagonal form.
% A is nxn.
% U0 is nxn and orthogonal so that U0'*A*U0 = T is tridiagonal
% GVL4: Algorithm 8.3.1.

[n,n] = size(A);
for k=1:n-2
    [v,beta] = House(A(k+1:n,k));
    p = beta*(A(k+1:n,k+1:n)*v);
    w = p-(beta*(p'*v)/2)*v;
    A(k+1,k) = norm(A(k+1:n,k));
    A(k,k+1) = A(k+1,k);
    A(k+2:n,k) = v(2:n-k);
    A(k+1:n,k+1:n) = A(k+1:n,k+1:n) - v*w' - w*v';
end
T = tril(triu(A,-1),1);
U0 = eye(n,n);
U0(2:n,2:n) = BackAccum(A(2:n,1:n-1));

