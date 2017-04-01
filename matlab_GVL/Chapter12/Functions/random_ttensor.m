  function A = random_ttensor(n,r,noise)
% function A = random_ttensor(n,r,noise)
% n and r are length-d integer vectors that satisfy 1<=r<=n
% noise is a nonnegative real.
% A = A0 + E where A0 = MultilinearProd(randn(r),U), U is a length-d cell
% array where U{k} is a random n(k)-by-r(k) matrix with orthonormal
% columns, and abs(E)<=noise*abs(A0)
d = length(n);
U = cell(d,1);
for k=1:d
    [U{k},R] = qr(randn(n(k),r(k)),0);
end
S = randn(r);
a = Vec(MultiLinProd(S,U));
a = a + a.*(-1+2*rand(prod(n),1))*noise;
A = reshape(a,n);