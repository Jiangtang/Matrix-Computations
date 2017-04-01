  function [L,U,rowpiv,colpiv] = OuterLU_RP(A)
% function [L,U,rowpiv,colpiv] = OuterLU_RP(A)
% Outer product LU with rook pivoting
% A is nxn 
% L is nxn and unit lower triangular
% U is nxn and upper triangular
% rowpiv(1:n-1) houses the pivot row indices
% colpiv(1:n-1) houses the pivot column indices
% PAQ' = LU where P = P_{n-1}...P_{1} and P_{k} is the identity with
% rows k and rowpiv(k) interchanged and Q = Q_{n-1}...Q_{1} and Q_{k}
% is the identity with rows k and colpiv(k) interchanged.
% GVL4: Section 3.4.7
[n,n] = size(A);
rowpiv = 1:n-1;
colpiv = 1:n-1;
for k=1:n-1
    % Determine A(mu,lambda), an entry in |A(k:n,k:n)| that is maximal in
    % both its row and column...
    mu=k; lambda = k; rho = abs(A(k,k)); s=0;
    while rho < max(abs(A(k:n,lambda))) || rho < max(abs(A(mu,k:n)))
        if mod(s,2)==0
            [m,tau] = max(abs(A(k:n,lambda)));
            mu = tau+k-1;
        else
            [m,tau] = max(abs(A(mu,k:n)));
            lambda = tau+k-1;
        end
        rho = abs(A(mu,lambda));
        s = s+1;
    end
    rowpiv(k) = mu;
    colpiv(k) = lambda;
    % Permute...
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