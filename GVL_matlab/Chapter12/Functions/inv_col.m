  function i = inv_col(k,n)
% function i = inv_col(k,n)
% n is a d-vector with positive integer entries
% k is an integer that satisfies 1<=k<=prod(n)
% i is a d-vector with positive integer entries so
% k = i(1) + (i(2)-1)n(1) + (i(3)-1)n(1)n(2) + ... + (i(d)-1)n(1)...n(d-1)
% GVL4: Section 12.4.5
d = length(n);
i = zeros(d,1);
N = prod(n);
k = k-1;
for j=d:-1:1
    N = N/n(j);
    f = floor(k/N);
    k = k-N*f;
    i(j) = f+1;   
end