  function [L,U] = BandLU(A,p,q)
% function [L,U] = BandLU(A,p,q)
% Band LU without pivoting.
% A is nxn and has an LU factorization. It has lower bandwidth p and
%    upper bandwidth q.
% L is unit lower triangular with lower bandwidth p, U is upper
%    triangular with bandwidth q, and A = LU.
% GVL4: Algorithm 4.3.1
n = length(A); 
for k=1:n-1
    for i=k+1:min(k+p,n)
        A(i,k) = A(i,k)/A(k,k);
    end
    for j=k+1:min(k+q,n)
        for i=k+1:min(k+p,n)
           A(i,j) = A(i,j) - A(i,k)*A(k,j);
        end
    end
end
L = tril(A,-1)+eye(n,n);
U = triu(A);
