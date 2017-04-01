  function k = col(i,n)
% function k = col(i,n)
% i and n are integer d-vectors with 1<=i<=n
% k = i(1) + (i(2)-1)n(1) + (i(3)-1)n(1)n(2) + ... + (i(d)-1)n(1)...n(d-1)
% GVL4: Section 12.4.5
d = length(n);
k = i(d)-1;
for j=d-1:-1:1
   k = n(j)*k + i(j)-1;
end
k = k+1;