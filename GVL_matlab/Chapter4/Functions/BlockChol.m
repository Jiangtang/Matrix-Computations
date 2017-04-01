  function G = BlockChol(A,r)
% function G = BlockChol(A,r)
% Block Cholesky factorization of a symmetric positive definite matrix.
% A is nxn symmetric and positive definite and r is the block size. It 
%   is assumed that n/r = N is an integer.
% G is nxn lower triangular and A = GG'.
% GVL4: Algorithm 4.2.4
n = length(A);
G = zeros(n,n);
N = n/r;
for j=1:N
    jdx = 1+(j-1)*r:j*r;
    for i=j:N
        idx = 1+(i-1)*r:i*r;
        S = A(idx,jdx);
        for k=1:j-1
            kdx = 1+(k-1)*r:k*r;
            S = S - G(idx,kdx)*G(jdx,kdx)';
        end
        if i==j
            G(jdx,jdx) = chol(S,'lower');
        else
            G(idx,jdx) = (G(jdx,jdx)\S')';
        end   
    end
end