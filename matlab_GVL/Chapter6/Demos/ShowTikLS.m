  function ShowTikLS()
% function ShowTikLS()
% Illustrates Tikhonov Regularization
m = 100;
n = 50;
kappa = 1000000;
A = gallery('randsvd',[m,n],kappa,4);
b = randn(m,1);
xLS = A\b;
rhoLS = norm(A*xLS-b);
% Set B to be the 2nd difference matrix...
B = 2*eye(n,n)-diag(ones(n-1,1),-1)-diag(ones(n-1,1),1);
for k=1:10
    lambda = 2^k;
    xTik = TikRegLS(A,b,B,lambda);
    rhoTikLS = norm(A*xTik-b);
    s = sprintf('lambda = %1d     rhoTikLS/rhoLS = %6.3f\n',lambda, rhoTikLS/rhoLS);
    plot(xTik)
    title(s,'fontsize',18)
    xlabel('plot(xTik)','fontsize',18)
    shg
    pause(1)
end
    





