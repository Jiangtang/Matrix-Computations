  function ShowHouseQRpiv(A)
% function ShowHouseQRpiv(A)
% Illustrates Householder QR factorization with column pivoting
% matrix. A call of the form ShowHouseQR() uses an ill-conditioned
% random 6x4 example.
if nargin==0
    A = gallery('randsvd', [6,4],10^3,3);
end
[m,n] = size(A);
clc
[Q_fact,R,P] = HouseQRpiv(A);
Q = BackAccum(Q_fact,'thin');
fprintf('Householder QR with Column Pivoting\n\n')
disp('A = ')
fprintfM('%7.3f',A)
disp('P = ')
fprintfM('%3d',P)
disp('Q = ')
fprintfM('%7.3f',Q)
disp('R = ')
fprintfM('%10.6f',R)
fprintf('|| AP - QR || = %10.3e\n\n',norm(A*P-Q*R))
fprintf('|| Q''Q - I || = %10.3e\n\n',norm(Q'*Q-eye(n,n)))

