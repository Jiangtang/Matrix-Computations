  function B = Transpose(A,p)
% function B = Transpose(A,p)
% A is an order-d tensor and p is a permutation of 1:d
% B is the p-transpose of A.
% GVL4: Section 12.4.4
n = size(A);
N = prod(n);
A = Vec(A);
B = zeros(N,1);
for k=1:N
    j = inv_col(k,n);
    i = col(j(p),n(p));
    B(i) = A(k);
end
B = reshape(B,n(p));
