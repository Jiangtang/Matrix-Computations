  function A = MatToTen(A_rxc,r,c,n)
% function A = MatToTen(A_rxc,r,c,n)
% A_rxc is a matrix.
% n is a positive integer d-vector
% r and c are integer vectors with the property that [r c] is a 
% permutation of 1:d.
% A_rxc is a matrix with prod(n(r)) rows and prod(n(c)) columns.
% A is an n(1)-by- ... -by-n(d) tensor where 
%       A_rxc(col(i(r),n(r)),col(i(c),n(c)) = A(i) 
% for all i that satisfy 1<=i<=n
% GV4: Section 12.4.6

% The key parameters..
d = length(n);
i = zeros(1,d);
nr = n(r);
nc = n(c);
[nRows,nCols] = size(A_rxc);
% Compute Vec(A)...
A = zeros(prod(n),1);
for p=1:nRows
    for q=1:nCols
        ir = inv_col(p,nr);
        ic = inv_col(q,nc);
        i(r) = ir;
        i(c) = ic;
        k = col(i,n);
        A(k) = A_rxc(p,q);
    end  
end
% Reshape into an order-d tensor...
A = reshape(A,n);
    
    