  function [L,U,rowpiv,colpiv] = OuterLU_CP(A)
% function [L,U,rowpiv,colpiv] = OuterLU_CP(A)
% Outer product LU with complete pivoting
% A is nxn. 
% L is nxn and unit lower triangular.
% U is nxn and upper triangular.
% rowpiv(1:n-1) houses the pivot row indices.
% colpiv(1:n-1) houses the pivot column indices.
% PAQ' = LU where P = P_{n-1}...P_{1} and P_{k} is the identity with
% rows k and rowpiv(k) interchanged and Q = Q_{n-1}...Q_{1} and Q_{k}
% is the identity with rows k and colpiv(k) interchanged
% GVL4: Algorithm 3.4.3
[n,n] = size(A);
rowpiv = 1:n-1;
colpiv = 1:n-1;
for k=1:n-1
    % Scan |A(k:n,k)| for its largest value and permute...
    [mcol,mucol] = max(abs(A(k:n,k:n))); 
    [m , tau] = max(mcol);
    colpiv(k) = tau+k-1;
    rowpiv(k) = mucol(tau)+k-1;
    A([rowpiv(k) k],:) = A([k rowpiv(k)],:);
    A(:,[colpiv(k) k]) = A(:,[k colpiv(k)]);
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