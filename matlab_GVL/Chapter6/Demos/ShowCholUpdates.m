  function ShowCholUpdates()
% function ShowCholUpdates()
clc
fprintf('Various Updates of a Cholesky Factorization\n\n')
n = 6;
A0 = randn(n,n)+ 10*n*eye(n,n); A0=(A0 +A0')/2;
G0 = chol(A0,'lower');
fprintf('A0 = ')
fprintfM('%7.3f',A0)
fprintf('G0 = ')
fprintfM('%7.3f',G0)

fprintf('\n+++++++++++++++++++++++++++++++++++++++++++++++++++\n')
fprintf('\nRank-1 Update: A0+zz'' = GG''\n\n')
z = randn(n,1);
fprintf('z = ')
fprintfM('%7.3f',z)
G = UpdateChol(G0,z);
fprintf('|| (A0+zz'') - GG'' || = %10.3e\n',norm(A0+z*z'-G*G'))

fprintf('\n+++++++++++++++++++++++++++++++++++++++++++++++++++\n')
fprintf('\nRank-1 Downdate: A0-zz'' = GG''\n\n')
z = randn(n,1);
fprintf('z = ')
fprintfM('%7.3f',z)
G = DowndateChol(G0,z);
fprintf('|| (A0-zz'') - GG'' || = %10.3e\n',norm(A0-z*z'-G*G'))