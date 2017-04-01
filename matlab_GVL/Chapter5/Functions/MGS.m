  function [Q,R] = MGS(A)
% function [Q,R] = MGS(A)
% Modified Gram-Schmidt computation of the thin QR factorization A = QR
% A is mxn.   Assume m>=n and full rank.
% Q is mxn with orthonormal columns.
% R is nxn upper triangular with positive diagonal entries.
% GVL4: Section 5.2.8
[m,n] = size(A);
R = zeros(n,n);
Q = zeros(m,n);
for k=1:n
    R(k,k) = norm(A(:,k));
    Q(:,k) = A(:,k)/R(k,k);
    R(k,k+1:n) = Q(:,k)'*A(:,k+1:n);
    A(:,k+1:n) = A(:,k+1:n) - Q(:,k)*R(k,k+1:n);
end