  function ShowUnder()
% function ShowUnder()
% Illustrate two different methods for solving a full row rank
% underdetermined system.
clc
m = 3;
n = 5;
A = randn(m,n);
b = randn(m,1);
fprintf('Underdetermined System Solving\n\n')
xMethod1 = UnderQRpiv(A,b);
disp('xMethod1 =')
fprintfM('%20.15f',xMethod1)
fprintf('|| A*xMethod1 - b || = %10.3e\n\n',norm(A*xMethod1-b))
xMethod2 = UnderQR(A,b);
disp('xMethod2 =')
fprintfM('%20.15f',xMethod2)
fprintf('|| A*xMethod2 - b || = %10.3e\n',norm(A*xMethod2-b))


  function x = UnderQRpiv(A,b)
% function x = UnderQRpiv(A,b)
% Underdetermined system solver using AP=QR
% A is mxn with rank(A) = m and b is mx1.
% x is nx1 so Ax = b
% GVL4: Algorithm 5.6.1
[m,n] = size(A);
[Q,R,P] = qr(A);
z = R(1:m,1:m)\(Q'*b);
x = P*[z;zeros(n-m,1)];

  function x = UnderQR(A,b)
% function x = UnderQR(A,b)
% Underdetermined system solver using A'=QR
% A is mxn with rank(A) = m and b is mx1.
% x is nx1 so Ax = b.
% GVL4: Algorithm 5.6.2
[m,n] = size(A);
[Q,R] = qr(A',0);
z = R'\b;
x = Q*z;