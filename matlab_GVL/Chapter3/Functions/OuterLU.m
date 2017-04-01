  function [L,U] = OuterLU(A)
% function [L,U] = OuterLU(A)
% Outer product LU without pivoting.
% A is nxn and has an LU factorization.
% L is nxn and unit lower triangular.
% U is nxn and upper triangular.
% A = LU
% GVL4: Algorithm 3.2.1.
[n,n] = size(A);
for k=1:n-1
    rho = k+1:n;
    % Compute L(k+1:n,k)...
    A(rho,k)   = A(rho,k)/A(k,k);
    % The outer product update...
    A(rho,rho) = A(rho,rho) - A(rho,k)*A(k,rho);
end
L = eye(n,n) + tril(A,-1);
U = triu(A);
