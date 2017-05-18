  function G = BlockChol_Recur(A,r)
% function G = BlockChol_Recur(A,r)
% Block Cholesky factorization of a symmetric positive definite matrix.
% Recursive version
% A is nxn symmetric and positive definite and r is the block size.
% G is nxn lower triangular and A = GG'.
% GVL4: Algorithm 4.2.3
n = length(A);
if n<=r
    G = chol(A,'lower');
else
    G11 = chol(A(1:r,1:r),'lower');
    G21 = (G11\A(r+1:n,1:r)')';
    G22 = BlockChol_Recur(A(r+1:n,r+1:n)- G21*G21',r);
    G = [G11 zeros(r,n-r); G21 G22];
end