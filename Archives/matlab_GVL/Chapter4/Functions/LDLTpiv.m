  function [L,D,P] = LDLTpiv(A)
% function [L,D,P] = LDLTpiv(A)
% LDL-transpose factorization of a symmetric positive definite matrix
%    with diagonal pivoting.
% A is nxn and symmetric and positive definite.
% L is nxn unit lower triangular, D is nxn diagonal, P is nxn permutation,
%    and PAP' = LDL'.
% GVL4: Algorithm 4.2.2.
n = length(A);
P = eye(n,n);
for k=1:n
    [m,alfa] = max(diag(A(k:n,k:n)));
    j = alfa+k-1; 
    P([k j],:) = P([j k],:);
    A([k j],:) = A([j k],:);
    A(:,[k j]) = A(:,[j k]);
    alfa = A(k,k);
    rows = k+1:n;
    v = A(rows,k);
    A(rows,k) = v/alfa;
    A(rows,rows) = A(rows,rows) - v*v'/alfa;
end
L = tril(A,-1)+eye(n,n);
D = diag(diag(A));