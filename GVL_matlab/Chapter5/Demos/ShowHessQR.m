  function ShowHessQR(H)
% function ShowHessQR(H)
% Illustrates Hessenberg QR factorization of an nxn upper Hessenberg.
% matrix. A call of the form ShowHessQR() uses a random 6x6 example.
if nargin==0
    H = triu(randn(6,6),-1);
end
n = length(H);
[Q,R] = HessQR(H);
clc
fprintf('Hessenberg QR\n\n')
disp('A = ')
fprintfM('%7.3f',H)
disp('Q = ')
fprintfM('%7.3f',Q)
disp('R = ')
fprintfM('%7.3f',R)
fprintf('|| H - QR ||  = %10.3e\n\n',norm(H-Q*R))
fprintf('|| Q''Q - I || = %10.3e\n\n',norm(Q'*Q-eye(n,n)))