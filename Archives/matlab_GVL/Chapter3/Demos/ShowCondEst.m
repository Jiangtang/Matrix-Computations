  function ShowCondEst()
% function ShowCondEst()
% Illustrates the condition estimation idea.
% GVL4: Section 3.5.4.
% The dimension of the matrix...
n = 100;
% Test examples generated via gallery('randsvd') 
% Type "help private/randsvd" for more information.
mode = 3;
clc
disp('inf-norm condition       Estimate')
disp('-----------------------------------')
for kappa = logspace(1,13,13)
    A = gallery('randsvd', [n,n],kappa,mode);
    [L,U,P] = lu(A);
    [kappa,y] = CondEstLowerTri(U');
    r = L'\y; w = L\(P*r); z = U\w;
    kappaInf = norm(A,inf)*norm(z,inf)/norm(r,inf);
    fprintf('   %10.3e           %10.3e\n',cond(A,'inf'),kappaInf)
end


  


