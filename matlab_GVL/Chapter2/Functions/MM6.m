  function C = MM6(A,B)
% function C = MM6(A,B)
% C is the 6-digit FP product of the 6-digit FP matrices A and B.
[m,p] = size(A);
[p,n] = size(B);
for i=1:m
    for j=1:n
        C(i,j) = Dot6(A(i,:),B(:,j));
    end
end
