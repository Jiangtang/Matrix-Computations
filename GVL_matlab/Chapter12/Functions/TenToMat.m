  function A_rxc = TenToMat(A,r,c)
% function A_rxc = TenToMat(A,r,c)
% A is an n(1)x...xn(d) tensor.
% r and c are integer vectors with the property that [r c] is a 
% permutation of 1:d.
% A_rxc is a matrix with prod(n(r)) rows and prod(n(c)) columns defined by
% A_rxc(col(i(r),n(r)),col(i(c),n(c)) = A(i) for all i that satisfy
% 1<=i<=n. That is, A_rxc is the r-by-c unfolding of A.
% GV4: Section 12.4.6

% The key parameters...
n = size(A);
d = length(n);
i = zeros(1,d);
nr = n(r);
nRows = prod(nr);
nc = n(c);
nCols = prod(nc);
A_rxc = zeros(nRows,nCols);
a = Vec(A);
% Set up the unfolding...
for p=1:nRows
    for q=1:nCols
        i(r) = inv_col(p,n(r));
        i(c) = inv_col(q,n(c));
        A_rxc(p,q) = a(col(i,n));
    end
end

