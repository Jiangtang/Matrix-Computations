  function I = eye6(m,n)
% function I = eye6(m,n)
% I is the first n columns of eye(m,m) in 6-digit FP format.
for i=1:m
    for j=1:n
        if i==j
            I(i,j) = fl6(1);
        else
            I(i,j) = fl6(0);
        end
    end
end
[m1,n1] = size(I);
if m1~=m || n1~=n
    I = I';
end
    