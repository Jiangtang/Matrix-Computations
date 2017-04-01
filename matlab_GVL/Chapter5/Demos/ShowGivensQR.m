  function ShowGivensQR(A)
% function ShowGivensQR(A)
% Illustrates Givens QR factorization of an mxn A with m>=n.
% A call of the form ShowGivensQR() uses a random 6x4 example.
if nargin==0
    A = randn(6,4);
end
n = length(A);
[Q,R] = GivensQR(A);
clc
fprintf('Givens QR\n\n')
disp('A = ')
fprintfM('%7.3f',A)
disp('Q = ')
fprintfM('%7.3f',Q)
disp('R = ')
fprintfM('%7.3f',R)
fprintf('|| A - QR ||  = %10.3e\n\n',norm(A-Q*R))
fprintf('|| Q''Q - I || = %10.3e\n\n',norm(Q'*Q-eye(n,n)))