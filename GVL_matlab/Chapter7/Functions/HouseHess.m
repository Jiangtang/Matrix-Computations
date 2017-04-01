  function [U0,H] = HouseHess(A)
% function [U0,H] = HouseHess(A)
% Householder reduction to Hessenberg form.
% A is nxn.
% U0 is nxn and orthogonal so that U0'*A*U0 = H is upper Hessenberg
% GVL4: Algorithm 7.4.2.

[n,n] = size(A);
for k=1:n-2
    [v,beta] = House(A(k+1:n,k));
    A(k+1:n,k:n) = A(k+1:n,k:n) - (beta*v)*(v'*A(k+1:n,k:n));
    A(:,k+1:n) = A(:,k+1:n) - (A(:,k+1:n)*v)*(beta*v)';
    A(k+2:n,k) = v(2:n-k);
end
H = triu(A,-1);
U0 = eye(n,n);
U0(2:n,2:n) = BackAccum(A(2:n,1:n-1));

