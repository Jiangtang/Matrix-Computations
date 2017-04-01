  function ShowHankleSolve()
% function ShowHankleSolve()
% Solve a Hankle system by converting it to a Cauchy-like system.
clc
fprintf('Hankel Solving Via Displacement LU\n\n')
n = 8;

% Generate a random Hankel matrix and display...
c = randn(n-1,1);
tau = randn(1,1);
r = randn(n-1,1);
T = toeplitz([tau;c],[tau;r]);
H = T(n:-1:1,:);
fprintf('H = ')
fprintfM('%10.3f',H)

% Generate the right hand side and the first and last columns of eye(n,n)...
b = randn(n,1);
e1 = zeros(n,1); e1(1) = 1;
en = zeros(n,1); en(n) = 1;

% Y_{00}H - H*Y_{11} = R1*S1' where 
R = [[0;c(n-1:-1:1)]-[c(n-1:-1:1);tau] -en [r;0]-[tau;r] -e1];
S = [e1 [r;0] en [0;c(n-1:-1:1)]];
fprintf('Y_{00}H - H*Y_{11} = R*S'' = \n')
fprintfM('%10.3f',Ymat(0,0,n)*H-H*Ymat(1,1,n))
fprintf('R'' = ')
fprintfM('%10.3f',R')
fprintf('S'' = ')
fprintfM('%10.3f',S')

% The DST diagonalizes Y_{00} and the DCT-II diagonalizes Y_{11}
Sn = Smat(n);
Cn = Cmat(n);
% Sn'*Y_{00}Sn = diag(omega) where
omega  = 2*cos((1:n)'*pi/(n+1));
% Cn'Y_{11}Cn = diag(lambda) where
lambda = 2*cos((0:n-1)'*(pi/n));

% Transform the displacement equation to  
%      diag(omega)Htilde - Htilde*diag(lambda) = Rtilde*Stilde'
% where Htilde = Sn'*H*Cn and
Rtilde = Sn'*R;
Stilde = Cn'*S;
btilde = Sn'*b;

% Compute the LU factorization of Htilde 
[L,U,P] = LUdispPivNonRecur(omega,lambda,Rtilde,Stilde);
% Solve Htilde*xtilde = btilde...
xtilde = U\(L\(P*btilde));
% Transform to get x...
x = Cn*xtilde;
% Check..
errx = norm(x - H\b);
fprintf('\nCheck solution to Hx = b...\n\n|| x - inv(H)b || = %10.3e\n\n',errx)

  function Y = Ymat(gamma,delta,n)
% function Y = Ymat(gamma,delta,n)
% Y is nxn tridiagonal with ones on the sub/super diagonal, and T(1,1) =
% gamma, and T(n,n) = delta.
Y = zeros(n,n);
Y(1,1) = gamma;
Y(n,n) = delta;
for k=1:n-1
    Y(k+1,k) = 1;
    Y(k,k+1) = 1;
end

  function S = Smat(n)
% function S = Smat(n)
% the nxn orthogonalized DST matrix
S = zeros(n,n);
for k=1:n
    for j=1:n
        S(k,j) = sin(k*j*pi/(n+1));
    end
end
S = S*sqrt(2/(n+1));

  function C = Cmat(n)
% function S = Cmat(n)
% the nxn orthogonalized DCT-II matrix
C = zeros(n,n);
for k=1:n
    for j=1:n
        C(k,j) = cos((2*k-1)*(j-1)*pi/(2*n));
    end
end
C = sqrt(2/n)*C;
C(:,1) = C(:,1)/sqrt(2);