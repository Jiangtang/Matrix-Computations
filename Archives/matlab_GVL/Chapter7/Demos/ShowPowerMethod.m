  function ShowPowerMethod()
% function ShowPowerMethod()
% Illustrates the power method (unsymmetric case).
clc
fprintf('The Power Method\n\n')
A = [-261 209 -49; -530 422 -98; -800 631 -144];
fprintf('A = \n')
fprintfM('%10.3f',A)
itMax = 20;
[q,lambda] = PowerMethod(A,[1;0;0],itMax);
fprintf('\nThe eigenvalues of this matrix are...\n')
fprintfM('%20.15f',eig(A))
fprintf('\nThe power method estmates of the dominant  eigenvalue are...\n')
fprintfM('%20.15f',lambda)