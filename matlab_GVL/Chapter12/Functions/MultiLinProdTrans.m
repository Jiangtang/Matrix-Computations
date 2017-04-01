  function A = MultilinearProdTranspose(S,M)
% function A = MultilinearProdTranspose(S,M)
% S is an m(1)-by- ... -by-m(d)  tensor
% M is a length-d cell array of matrices with the property that
%   M{k} is m(k)-by-n(k), k=1:d
% A is the multilinear product S x1 M{1}' x2 M{2}' ... xd M{d}' i.e.,
% A is the n(1)-by- ... -by-n{d} tensor defined by 
% vec(A) = (M{d}' x M{d-1}' x ... x M{1})'*vec(S)

% Key parameters...
m = size(S);
d = length(m);
n = zeros(1,d);
for k=1:d
    [m(k),n(k)] = size(M{k});
end

% The modal products...
A = S;
for k=1:d
    r = [k];
    c = [1:(k-1) (k+1):d];
    Amat = TenToMat(A,r,c);
    Amat = M{k}'*Amat;
    A = MatToTen(Amat,r,c,[n(1:k) m(k+1:d)]);
end
 