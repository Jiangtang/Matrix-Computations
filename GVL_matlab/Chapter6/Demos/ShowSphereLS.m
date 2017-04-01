  function ShowSphereLS()
% function ShowSphereLS()
% Examines properties of xSphere, obtained by minimizing ||Ax - b||
% over a sphere.
clc
fprintf('Minimizing ||Ax - b|| over a sphere\n\n')
m = 20;
n = 10;
kappa = 100000;
% The unconstrained problem...
A = gallery('randsvd', [m,n],kappa,3);
b = randn(m,1);
xLS = A\b;
rhoLS = norm(A*xLS - b);
fprintf('xLS = unconstrained minimizer\n')
fprintf('\n||xLS|| = %10.3e\n\n',norm(xLS))
fprintf(' alpha/||xLS||      ||A*xSphere - b|| / ||A*xLS - b|| \n')
fprintf('--------------------------------------------------------\n')
for k=0:13
    alpha = norm(xLS)/2^k;
    [xSphere,lambda_star] = SphereLS(A,b,alpha);
    rhoSphereLS = norm(A*xSphere-b);
    fprintf('    %6.4f              %20.15f     \n',1/2^k,rhoSphereLS/rhoLS)
end

