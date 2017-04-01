  function ShowBlockChol_Recur(A,r)
% function ShowBlockChol_Recur(A,r)
% Displays the Cholesky factorization A = GG' computed using recursive
% block Cholesky with block size r.
% A call of the form ShowBlockChol_Recur() sets A to be a random 6x6
% example with block size r.
if nargin==0
    A = randn(6,6); A = A'*A;
    r = 2;
end
clc
fprintf('Block Cholesky (Recursive) \n\n')
disp('A =')
fprintfM('%10.3f',A)
disp('G = ')
G = BlockChol_Recur(A,r);
fprintfM('%10.3f',G)
fprintf('||A - GG''|| = %10.3e\n',norm(G*G'-A))