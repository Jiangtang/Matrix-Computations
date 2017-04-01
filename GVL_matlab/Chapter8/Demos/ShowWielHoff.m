  function ShowWielHoff()
% function ShowWielHoff()
% The Wielandt-Hoffman theorem.
% GVL4: Theorem 8.1.4
clc
fprintf('Wielandt-Hoffman Theorem\n\n')
fprintf('    ||E||_F                                    eig(A+E) \n')
fprintf('-----------------------------------------------------------------------------------\n')
n = 5;
A = randn(n,n); A = A+A';
E = randn(n,n); E = E+E'; E = E/norm(E,'fro');
lambda0 = eig(A);
fprintf(' %11.8f     ',0)
fprintf('  %11.8f',lambda0)
fprintf('\n')
for delta = logspace(-8,0,9)
    lambda = eig(A+delta*E);
    fprintf(' %11.8f     ',delta)
    fprintf('  %11.8f',lambda)
    fprintf('\n')
end
