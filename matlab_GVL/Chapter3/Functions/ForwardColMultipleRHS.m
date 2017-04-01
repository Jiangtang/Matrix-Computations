  function X = ForwardColMultipleRHS(L,B,r)
% function X = ForwardColMultipleRHS(L,B,r)
% Forward elimination for multiple right hand sides with blocking.
% L is nxn, lower triangular, and nonsingular and B is nxq.
% r is 1xN with r>0 and sum(r) = n. It defines a row blocking of L.
% X is nxq and solves LX = B.
% GVL4: Section 3.1.4
[n,q] = size(B);
N = length(r);
i = 1;
for j=1:N
    rows = i:i+r(j)-1;
    B(rows,:) = L(rows,rows)\B(rows,:);
    if j<N
       i = i+r(j);
       B(i:n,:) = B(i:n,:) - L(i:n,rows)*B(rows,:);
    end
end
X = B;