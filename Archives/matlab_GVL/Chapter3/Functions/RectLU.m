  function [L,U] = RectLU(A)
% function [L,U] = RectLU(A)
% Outer product LU for tall rectangular matrices without pivoting
% A is nxr and has an LU factorization, n>=r.
% L is nxr and unit lower triangular.
% U is rxr and upper triangular.
% A = LU
% GVL4: Section 3.2.10
[n,r] = size(A);
for k=1:r
    rho = k+1:n;
    % Compute L(k+1:n,k)...
    A(rho,k) = A(rho,k)/A(k,k);
    if k<r
        % The outer product update...
        mu = k+1:r;
        A(rho,mu) = A(rho,mu) - A(rho,k)*A(k,mu);
    end
end
L = tril(A);
for k=1:r
    L(k,k) = 1;
end
U = triu(A(1:r,1:r));