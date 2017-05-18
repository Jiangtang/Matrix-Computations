  function ShowHouseQR(A)
% function ShowHouseQR(A)
% Illustrates Householder QR factorization.
% matrix. A call of the form ShowHouseQR() uses a random 6x4 example.
if nargin==0
    A = randn(6,4);
end
[m,n] = size(A);
clc
fprintf('Householder QR\n\n')
disp('A = ')
fprintfM('%7.3f',A)
[Q_fact,R] = HouseQR(A);

% Thin version...
fprintf('\nThin Version...\n\n')
Q = BackAccum(Q_fact,'thin');
disp('Q = ')
fprintfM('%7.3f',Q)
disp('R = ')
fprintfM('%7.3f',R)
fprintf('|| A - QR ||  = %10.3e\n',norm(A-Q*R))
fprintf('|| Q''Q - I || = %10.3e\n\n',norm(Q'*Q-eye(n,n)))

% Full version...
fprintf('\n\nFull Version...\n\n')
Q = BackAccum(Q_fact);
R = [R;zeros(m-n,n)];
disp('Q = ')
fprintfM('%7.3f',Q)
disp('R = ')
fprintfM('%7.3f',R)
fprintf('|| A - QR ||  = %10.3e\n',norm(A-Q*R))
fprintf('|| Q''Q - I || = %10.3e\n\n',norm(Q'*Q-eye(m,m)))

