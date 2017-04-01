  function ShowAasen(A)
% function ShowAasen(A)
% Illustrates the Aasen factorization for a symmetric matrix A.
% A call of the form Aasen() generates a random 7x7 example.
if nargin==0
    n = 7;
    A = randn(n,n);
    A = A + A';
end
n = 7;
A = randn(n,n);
A = A + A';
[L,T,P] = Aasen(A);
clc
fprintf('Aasen Factorization\n\n')
disp('A = ')
fprintfM('%7.3f',A)
disp('P = ')
fprintfM('%3d',P)
disp('L = ')
fprintfM('%7.3f',L)
disp('T = ')
fprintfM('%7.3f',T)
fprintf('|| PAP'' - LTL'' || = %10.3e\n\n',norm(P*A*P' - L*T*L'))
   