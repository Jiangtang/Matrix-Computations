  function [L,U,piv] = OuterLU_PP(A)
% function [L,U,piv] = OuterLU_PP(A)
% Outer product LU with partial pivoting.
% A is nxn.
% L is nxn and unit lower triangular.
% U is nxn and upper triangular
% piv(1:n-1) houses the pivot row indices.
% PA = LU where P = P_{n-1}...P_{1} and P_{k} is the identity with
% rows k and piv(k) interchanged.
% GVL4: Algorithm 3.4.1
[n,n] = size(A);
piv = 1:n-1;
for k=1:n-1
    % Scan |A(k:n,k)| for its largest value and permute...
    [m,mu] = max(abs(A(k:n,k))); 
    mu = k-1+mu; 
    piv(k) = mu; 
    A([k mu],:) = A([mu k],:);
    % Update...
    if A(k,k)~=0
       rho = k+1:n;
       % Compute L(k+1:n,k)...
       A(rho,k) = A(rho,k)/A(k,k);
       % The outer product update...
       A(rho,rho) = A(rho,rho) - A(rho,k)*A(k,rho);
    end
end
L = eye(n,n) + tril(A,-1);
U = triu(A);