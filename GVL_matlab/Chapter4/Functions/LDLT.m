  function [L,D] = LDLT(A)
% function [L,D] = LDLT(A)
% LDL-transpose factorization of a symmetric positive definite matrix.
% A is nxn and symmetric and positive definite.
% L is nxn unit lower triangular, D is nxn diagonal, and A = LDL'.
% GVL4: Algorithm 4.1.1.
n = length(A);
v = zeros(n,1);
for j=1:n
    for i=1:j-1
        v(i)= A(j,i)*A(i,i);
    end
    A(j,j)     = A(j,j) - A(j,1:j-1)*v(1:j-1);
    A(j+1:n,j) = (A(j+1:n,j) - A(j+1:n,1:j-1)*v(1:j-1))/A(j,j);
end
L = tril(A,-1)+eye(n,n);
D = diag(diag(A));