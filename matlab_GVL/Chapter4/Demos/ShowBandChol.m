  function ShowBandChol(A,p)
% function ShowBandChol(A,p)
% Illustrates band cholesky of a positive definite A with bandwidth p.
% A call of the form ShowBandChol() will generate a random 6x6 example
% with bandwidth 2.
if nargin==0
    p = 2;
    G = triu(tril(randn(6,6)),-p);
    A = G*G';
end
G = BandChol(A,p);
clc
fprintf('Band Cholesky\n\n')
disp('A = ')
fprintfM('%7.3f',A)
disp('G = ')
fprintfM('%7.3f',G)
fprintf('||A - GG''|| = %10.3e\n',norm( A - G*G'))