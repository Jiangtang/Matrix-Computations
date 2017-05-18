  function [L,U] = BlockLU(A,r)
% function [L,U] = BlockLU(A,r)
% Block LU without pivoting.
% A is nxn and has an LU factorization.
% L is nxn and unit lower triangular.
% U is nxn and upper triangular.
% r is the block size and n/r = N is an integer.
% A = LU
% GVL4: Algorithm 3.2.3
[n,n] = size(A); L = zeros(n,n); U = zeros(n,n);
N = n/r;
for k=1:N
    i = (k-1)*r;
    cols = i+1:i+r;
    if k<N
       [L(i+1:n,cols),U(cols,cols)] = RectLU(A(i+1:n,cols));
       alfa = i+r+1:n;
       U(cols,alfa) = L(cols,cols)\A(cols,alfa);
       A(alfa,alfa) = A(alfa,alfa)-L(alfa,cols)*U(cols,alfa);
    else
        [L(cols,cols),U(cols,cols)] = RectLU(A(cols,cols));
    end
end