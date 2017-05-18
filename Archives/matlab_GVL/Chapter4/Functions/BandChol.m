  function G = BandChol(A,p)
% function G = BandChol(A,p)
% Band Cholesky
% A is nxn is symmetric positive definite and has bandwidth p.
% G is nxn, lower triangular with lower bandwidth p and A = GG'.
% GVL4: Algorithm 4.3.1
[n,n] = size(A);
for j=1:n
    for k=max(1,j-p):j-1
        lambda = min(k+p,n);
        A(j:lambda,j) = A(j:lambda,j) - A(j,k)*A(j:lambda,k);
    end
    lambda = min(j+p,n);
    A(j:lambda,j) = A(j:lambda,j)/sqrt(A(j,j));
end
G = tril(A);