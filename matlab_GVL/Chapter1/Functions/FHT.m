  function y = FHT(x)
% function y = FHT(x)
% fast Haar transform
% GVL4: Algorithm 1.4.4
% x is a column vector whose length is a power of two.
% y is its Haar transform
n = length(x);
if round(log2(n))~=log2(n)
    error('n = length(x) must be a power of two.')
end
if n==1
    y = x;
else
    m = n/2;
    y = zeros(n,1);
    z = FHT(x(1:m));
    y(1:2:n) = z + x(m+1:n);
    y(2:2:n) = z - x(m+1:n);
end