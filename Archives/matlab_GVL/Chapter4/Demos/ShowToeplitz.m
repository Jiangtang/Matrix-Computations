  function ShowToeplitz()
% function ShowToeplitz()
% Examines the Toeplitz algorithms Durbin, Levinson, and Trench
% on a small random example.
% Generate T...
n = 5
T = gallery('toeppd',n)
T = T/T(1,1);
r = T(2:n,1);
clc
disp('T = ')
fprintfM('%7.3f',T);
r(n) = rand(1);
y = Durbin(r);
fprintf('||Durbin(r)  - T\\(-r)|| = %10.3e\n',norm(y-T\(-r)))
b = randn(n,1);
x = Levinson(r,b);
fprintf('||Levinson(r,b) - T\\b|| = %10.3e\n',norm(x-T\b))
B = Trench(r);
fprintf('\nInverse of T = \n')
fprintfM('%7.3f',B)
fprintf('\n||Trench(r) - inv(T)|| = %10.3e\n',norm(B-inv(T)))