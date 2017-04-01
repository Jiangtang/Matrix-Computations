  function Z = zeros6(m,n)
% function Z = zeros6(m,n)
% Z is the mxn zeros matrix in 6-digit FP format.
for i=1:m
    for j=1:n
        Z(i,j) = fl6(0);
    end
end
[m1,n1] = size(Z);
if m1~=m || n1~=n
    Z = Z';
end
