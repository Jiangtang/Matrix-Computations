  function ShowHouseBidiag(A)
% function ShowHouseBidiag(A)
% Illustrates the Householder bidiagonalization of a rectangular matrix.
% A call of the form ShowHouseBidiag() generates a random 7x5 example.
if nargin==0
    A = randn(7,4);
end
[m,n] = size(A);
[U_fact,B,V_fact] = HouseBiDiag(A);
U = BackAccum(U_fact);
V = BackAccum(V_fact);
clc
fprintf('Householder Bidiagonalization\n\n')
disp('A = ')
fprintfM('%7.3f',A)
disp('U = ')
fprintfM('%7.3f',U)
disp('B = ')
fprintfM('%7.3f',B)
disp('V = ')
fprintfM('%7.3f',V)
fprintf('|| U''U - I  || = %10.3e\n',norm(U'*U-eye(m,m)))
fprintf('|| V''V - I  || = %10.3e\n',norm(U'*U-eye(m,m)))
fprintf('|| U''AV - B || = %10.3e\n',norm(U'*A*V-B))


