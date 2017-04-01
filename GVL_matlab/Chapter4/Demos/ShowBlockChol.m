  function ShowBlockChol(A,r)
% function ShowBlockChol(A,r)
% Displays the Cholesky factorization A = GG' computed using nonrecursive
% block Cholesky with block size r.
% A call of the form ShowBlockChol() sets A to be a random 6x6
% example with block size r.
if nargin==0
    A = randn(6,6); A = A'*A;
    r = 2;
end
clc
fprintf('Block Cholesky\n\n')
disp('A =')
fprintfM('%10.3f',A)
disp('G = ')
G = BlockChol(A,r);
fprintfM('%10.3f',G)
fprintf('||A - GG''|| = %10.3e\n',norm(G*G'-A))