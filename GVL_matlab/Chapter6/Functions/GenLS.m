  function x = GenLS(A,b,B)
% function x = GenLS(A,b,B)
% Generalized Least Squares
% A is mxn with rank(A) = n, b is mx1, and B is mxm nonsingular.
% x minimizes norm(inv(B)*(Ax-b))
% GVL4: Section 6.1.2
[m,n] = size(A);
[Q,R] = qr(A); 
R1 = R(1:n,1:n); Q1 = Q(:,1:n); Q2 = Q(:,n+1:m);      
F = (Q2'*B)'; F = F(:,m-n:-1:1); [Z,S] = qr(F);
S = S(m-n:-1:1,m-n:-1:1)';
Z2 = Z(:,m-n:-1:1);
u = S\(Q2'*b);
x = R1\(Q1'*(b - B*(Z2*u)));