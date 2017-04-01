  function [Q,R] = CGS(A)
% function [Q,R] = CGS(A)
% Classical Gram-Schmidt computation of the thin QR factorization A = QR.
% A is mxn. Assume m>=n and full rank.
% Q is mxn with orthonormal columns.
% R is nxn upper triangular with positive diagonal entries.
% GVL4: Section 5.2.7
[m,n] = size(A);
R = zeros(n,n);
Q = zeros(m,n);
R(1,1) = norm(A(:,1));
Q(:,1) = A(:,1)/R(1,1);
for k=2:n
    R(1:k-1,k) = Q(:,1:k-1)'*A(:,k);
    z = A(:,k) - Q(:,1:k-1)*R(1:k-1,k);
    R(k,k) = norm(z);
    Q(:,k) = z/R(k,k);
end