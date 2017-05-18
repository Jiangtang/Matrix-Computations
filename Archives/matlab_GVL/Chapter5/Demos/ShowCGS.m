  function ShowCGS(A)
% function ShowCGS(A)
% Illustrates Classical Gram-Schmidt on an mxn A with m>=n.
% A call of the form ShowCGS() uses a random ill-conditioned 6x4 example.
if nargin==0
    A = gallery('randsvd', [6,4],10^6,3);
end
[m,n] = size(A);
[Q,R] = CGS(A);
clc
fprintf('Classical Gram-Schmidt\n\n')
disp('A = ')
fprintfM('%7.3f',A)
disp('Q = ')
fprintfM('%7.3f',Q)
disp('R = ')
fprintfM('%7.3f',R)
fprintf('|| A - QR ||  = %10.3e\n\n',norm(A-Q*R))
fprintf('|| Q''Q - I || = %10.3e\n\n',norm(Q'*Q-eye(n,n)))
fprintf('Condition of A  = %10.3e\n\n',cond(A,2))