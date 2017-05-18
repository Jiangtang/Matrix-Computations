function kp = other(jp,n)
% OTHER(jp,n) contains the indices remaining in 1,2,...,n
% when the indices in jp are removed.
x = 1:n;
x(jp) = zeros(1,length(jp));
kp = x(find(x));
