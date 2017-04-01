  function ShowBunchParlett(A)
% function ShowBunchParlett(A)
% Illustrates the BunchParlett factorization for a symmetric matrix A.
% A call of the form BunchParlett() generates a random 7x7 example.
clc
if nargin==0
   n = 7;
   A = randn(n,n);
   A = A + A';
end
[L,D,P] = BunchParlett(A);
fprintf('Bunch-Parlett Factorization\n\n')
disp('A = ')
fprintfM('%7.3f',A)
disp('P = ')
fprintfM('%3d',P)
disp('L = ')
fprintfM('%7.3f',L)
disp('D = ')
fprintfM('%7.3f',D)
fprintf('|| PAP'' - LDL'' || = %10.3e\n\n',norm(P*A*P' - L*D*L'))