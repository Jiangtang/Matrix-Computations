  function ShowLSE(A,b,B,d)
% function ShowLSE(A,b,B,d)
% Showcases three methods to minimize ||Ax - b|| subject to Bx = d.
% Assumes that A is m1xn1, B is m2xn1, m1>=n1, rank(A) = n1, m2<=n1
% and rank(B) = n1. 
% A call of the form ShowLSE() generates a random example with m1=10,
% n1 = 6, and m2 = 3.
if nargin==0
    m1 = 10; n1 = 6; m2 = 3;
    A = randn(m1,n1); b = randn(m1,1);
    B = randn(m2,n1); d = randn(m2,1);
end
clc
fprintf('Least Squares with Equality Constraints\n\n')
xQR = LSE_QR(A,b,B,d);
xGSVD = LSE_GSVD(A,b,B,d);
fprintf('Using QR:                    Using GSVD: ')
fprintfM('       %20.15f',[xQR   xGSVD])
fprintf('|| xQR - xGSVD || = %10.3e\n',norm(xQR-xGSVD))
fprintf('\n\nUsing the method of weights...\n')
fprintf('\n   Lambda     || xWeight - xGSVD ||\n')
fprintf('-------------------------------------\n')
for lambda = logspace(1,15,15)
    xWeight = LSE_Weights(A,b,B,d,lambda);
    fprintf('  %7.0e          %10.3e\n',lambda,norm(xWeight-xGSVD))
end
fprintf('\n')
    
  function x = LSE_QR(A,b,B,d)
% function x = LSE_QR(A,b,B,d)
% Least squares with linear equality constraints.
% A is m1xn1, rank(A) = n1, b is m1x1, B is m2xn1, rank(B) = m2, d is m2x1
% x is n1x1 and minimizes norm(Ax-b) subject to Bx = d.
% GVL4: Algorithm 6.2.2
[m1,n1] = size(A);
[m2,n1] = size(B);
[Q,R] = qr(B');
y = R(1:m2,1:m2)'\d;
A = A*Q;
z = A(:,m2+1:n1)\(b-A(:,1:m2)*y);
x = Q(:,1:m2)*y + Q(:,m2+1:n1)*z;

  function x = LSE_Weights(A,b,B,d,lambda)
% function x = LSE_Weights(A,b,B,d)
% Least squares with linear equality constraints.
% A is m1xn1, rank(A) = n1, b is m1x1, B is m2xn1, rank(B) = m2, d is m2x1,
% and lambda>0.
% x is n1x1 approximately minimizes norm(Ax-b) subject to Bx = d.
% GVL4: Algorithm 6.2.6
x = [A;sqrt(lambda)*B]\[b;sqrt(lambda)*d];

  function x = LSE_GSVD(A,b,B,d)
% function x = LSE_GSVD(A,b,B,d)
% Least squares with linear equality constraints.
% A is m1xn1, rank(A) = n1, b is m1x1, B is m2xn1, rank(B) = m2, d is m2x1
% x is n1x1 and minimizes norm(Ax-b) subject to Bx = d.
% GVL4: Section 6.2.5
[m1,n1] = size(A);
[m2,n1] = size(B);
[U1,U2,Z,DA,DB] = gsvd(A,B);
btilde = U1'*b;
dtilde = U2'*d;
alfa = diag(DA);
beta = diag(DB);
x = Z'\[dtilde(1:m2)./beta ; (btilde(m2+1:n1)./alfa(m2+1:n1))];