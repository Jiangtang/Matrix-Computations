  function A = random_ktensor(n,r,noise)
% function A = random_ktensor(n,r,noise)
% n is a positive length-d integer vector
% r is a positive integer
% noise is a nonnegative real.
% A = A0 + E where A0 is the sum of r rank-1 tensors and abs(E)<=noise*abs(A0)
d = length(n);
N = prod(n);
a = zeros(N,1);
for k=1:d 
    X{k} = randn(n(k),r);  
end
for i=1:r
    v = X{1}(:,i);
    for j=2:d
        v = kron(X{j}(:,i),v);
    end
    a = a + v;
end
a = a + a.*(-1+2*rand(prod(n),1))*noise;
A = reshape(a,n);