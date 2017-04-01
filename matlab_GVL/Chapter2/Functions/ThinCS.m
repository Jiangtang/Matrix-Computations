  function [U1,U2,V,C,S] = ThinCS(Q1,Q2)
% function [U1,U2,V,C,S] = ThinCS(Q1,Q2)
% Q1 is m1xn1 with m1>=n1, Q2 is m2xn1 with m1+m2>=n1.
% U1 (m2xm2) is orthogonal, U2 (m1xm1) is orthogonal, V (n1xn1) is
% orthogonal, C (m1xn1) is diagonal with decreasing nonnegative diagonal
% entries, S (m2xn1) has the form [zeros(m2,max(0,n1-m2)) S1]
% where S1 is diagonal with non-increasing diagonal entries.
% GVL4: Theorem 2.5.2 but with the constraint m2>=n1 replaced by
% the more flexible m1+m2>=n1.
[m1,n1] = size(Q1);
[m2,n1] = size(Q2);
% Call the Matlab GSVD function...
[U1,U2,V,C,S] = gsvd(Q1,Q2);
% U1'Q1*V = C and U2'Q2*V = S, are both diagonal with the C(i,i) 
% nonincreasing. Have to do some flipping to achieve our canonical form...
if m2>=n1
    U1(:,1:n1) = U1(:,n1:-1:1);
    U2(:,1:n1) = U2(:,n1:-1:1);
    V  = V(:,n1:-1:1);
    C(1:n1,1:n1) = C(n1:-1:1,n1:-1:1);
    S(1:n1,1:n1) = S(n1:-1:1,n1:-1:1);
else
    U1(:,1:n1) = U1(:,n1:-1:1);
    U2 = U2(:,m2:-1:1);
    V  = V(:,n1:-1:1);
    C(1:n1,1:n1) = C(n1:-1:1,n1:-1:1);
    S = S(m2:-1:1,n1:-1:1);
end

