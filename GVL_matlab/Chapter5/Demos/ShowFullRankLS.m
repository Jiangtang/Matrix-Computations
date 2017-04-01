  function ShowFullRankLS()
% function ShowFullRankLS()
% Compares the Householder QR, Normal Equation, CGS, and MGS methods
% for solving full rank LS problem.
clc
m = 10;
n = 5;
fprintf('Comparison of Least Square Methods\n\n')
fprintf('On Small Residual Problems...\n')
m = 10; n = 5; 
for kappa = [10^2 10^4 10^6 10^8 ]
    A = gallery('randsvd', [m,n],kappa,3);
    x0 = ones(n,1);
    b = A*x0 + eps*randn(m,1);
    fprintf('\n+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n')
    fprintf('\nCondition = %10.3e   xExact = ones(n,1)  Type: Zero Residual\n\n',kappa)
   
    fprintf('       xHouse           xNormal           xCGS            xMGS')
    xHouse  = HouseLS(A,b);
    xNormal = NormalEqnLS(A,b);
    xCGS    = CGSLS(A,b);
    xMGS    = MGSLS(A,b);
    fprintfM('  %15.12f',[xHouse     xNormal  xCGS        xMGS])
    fprintf('res: ')
    fprintf('%10.3e       ',[norm(A*xHouse - b) norm(A*xNormal-b) norm(A*xCGS - b) norm(A*xMGS - b)])
    fprintf('\n')
end
fprintf('\n\n+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n')
fprintf('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n')
       
fprintf('\n\nOn Large Residual Problems...\n')
m = 10; n = 5; 
for kappa = [10^2 10^4 10^6 10^8 ]
    A = gallery('randsvd', [m,n],kappa,3);
    x0 = ones(n,1);
    [U,S,V] = svd(A);
    b = A*x0 + U(:,m);
    fprintf('\n+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n')
    fprintf('\nCondition = %10.3e   xExact = ones(n,1)  Type: Large Residual\n\n',kappa)
    fprintf('       xHouse           xNormal           xCGS            xMGS')
    xHouse  = HouseLS(A,b);
    xNormal = NormalEqnLS(A,b);
    xCGS    = CGSLS(A,b);
    xMGS    = MGSLS(A,b);
    fprintfM('  %15.12f',[xHouse     xNormal  xCGS        xMGS])
    fprintf('\n')
end
    
  function xLS = NormalEqnLS(A,b)
% function xLS = NormalEqnLS(A,b)
% Full-rank LS solution via normal equations.
% A is mxn, rank(A) = n.
% b is mx1. 
% xLS is nx1 and minimizes norm(Ax-b).
% GVL4: Algorithm 5.3.1
C = A'*A;
d = A'*b;
G = chol(C,'lower');
xLS = G'\(G\d);

  function xLS = HouseLS(A,b)
% function xLS = HouseLS(A,b)
% Full-rank LS solution via Householder QR.
% A is mxn, rank(A) = n.
% b is mx1. 
% xLS is nx1 and minimizes norm(Ax-b).
% GVL4: Algorithm 5.3.2
[m,n] = size(A);
% QR factorization with Q in factored form...
[Q,R] = HouseQR(A);
Q = BackAccum(Q,'thin');
xLS = R(1:n,1:n)\(Q'*b);

  function xLS = CGSLS(A,b)
% function xLS = GGSLS(A,b)
% Full-rank LS solution via classical Gram-Schmidt.
% A is mxn, rank(A) = n.
% b is mx1. 
% xLS is nx1 and minimizes norm(Ax-b).
% GVL4: Section 5.2.7 
[Q,R] = CGS(A);
xLS = R\(Q'*b);

  function xLS = MGSLS(A,b)
% function xLS = MGSLS(A,b)
% Full-rank LS solution via modified Gram-Schmidt.
% A is mxn, rank(A) = n.
% b is mx1. 
% xLS is nx1 and minimizes norm(Ax-b).
% GVL4: Section 5.3.5
[Q,R] = MGS(A);
xLS = R\(Q'*b);
