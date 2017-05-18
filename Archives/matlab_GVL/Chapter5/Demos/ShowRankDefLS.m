  function ShowRankDefLS()
% function ShowRankDefLS()
% Compares three different approaches to the rank deficient LS
% problem: QR with column pivoting, SVD, and Golub-Klema-Stewart
% subset selection.

clc
fprintf('Compare Rank Deficient LS Solvers\n')
m = 10;
n = 6;
b = randn(m,1);
kappa = 10^6;
        
for mode = 1:5
   A = gallery('randsvd', [m,n],10^6,mode);
   sv = svd(A);
   for tol = [.00001  .000001 ]
      fprintf('\n\n++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n')
      fprintf('tol = %10.3e\n',tol)
      fprintf('\nThe Singular Values:\n')
      fprintfM('%20.15f',sv)
      xBasic = LS_Basic(A,b,tol);
      rBasic = norm(A*xBasic-b);
      xLS = LS_MinNorm(A,b,tol);
      rLS = norm(A*xLS-b);
      xGKS = LS_GKS(A,b,tol);
      rGKS  = norm(A*xLS-b);
      fprintf('              xBasic                 xLS                xGKS')
      fprintfM('  %20.6f',[xBasic     xLS    xGKS])
      fprintf('res: ')
      fprintf('%15.3e       ',[rBasic  rLS  rGKS ])
      fprintf('\n')
   end
end

  function xBasic = LS_Basic(A,b,tol)
% function xBasic = LS_Basic(A,b,tol)
% Basic least squares solution.
% A is mxn, b is mx1, and tol satisfies 0<=tol<1. 
% xBasic is an approximate minimizer of norm(Ax-b) obtained by taking
% and optimal combination of the first r columns of AP where
% AP = QR is the QR with column pivoting factorization and r is the 
% number of R(j,j) greater than or equal to tol*R(1,1).
% GVL4: Section 5.5.5
[m,n] = size(A);
[Q,R,P] = HouseQRpiv(A);
Q = BackAccum(Q,'thin');
r = sum(diag(R)>tol*R(1,1));
xBasic = P*[R(1:r,1:r)\(Q(:,1:r)'*b);zeros(n-r,1)];

  function xLS = LS_MinNorm(A,b,tol)
% function xLS = LS_MinNorm(A,b,tol)
% Minimum norm least squares solution.
% A is mxn, b is mx1, and tol satisfies 0<=tol<1. 
% xLS is an approximate minimizer of norm(Ax-b) obtained by taking
% and optimal combination of the first r columns of V where
% A = USV' is the SVD and r is the number of S(j,j) greater than 
% or equal to tol*S(1,1).
% GVL4: Section 5.5.4
[U,S,V] = svd(A,0);
r = sum(diag(S)>tol*S(1,1));
xLS = V(:,1:r)*((U(:,1:r)'*b)./diag(S(1:r,1:r)));

  function xGKS = LS_GKS(A,b,tol)
% function xGKS = LS_GKS(A,b,tol)
% Least squares solution using Golub-Klema-Stewart subset selection.
% A is mxn, b is mx1, and tol satisfies 0<=tol<1. 
% xGSS is an approximate minimizer of norm(Ax-b) with the property that
% A*xGKS is a linear combination of r independent columns if A where
% r is the number of A's singular values >=tol*norm(A).
% GVL4: Algorithm 5.5.1
[m,n] = size(A);
[U,S,V] = svd(A,0);
r = sum(diag(S)>tol*S(1,1));
[Q,R,P] = qr(V(:,1:r)');
Atilde = A*P;
[Qtilde,Rtilde] = qr(Atilde(:,1:r),0);
z = Rtilde\(Qtilde'*b);
xGKS = P*[z;zeros(n-r,1)];


          
