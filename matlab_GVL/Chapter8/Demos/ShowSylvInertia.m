  function ShowSylvInertia()
% function ShowSylvInertia()
% Illustrate the Sylvester Law of Inertia
% GVL4: Section 8.1.5
clc
fprintf('Sylvester Law of Inertia\n\n')
% Generate a matrix with negative, zero and positive eigenvalues...
n = 20; X = randn(n,ceil(n/3)); Y = randn(n,ceil(n/4)); A = X*X' - Y*Y';
evA = sort(diag(schur(A)));
% Generate B = X'AX...
kappa = 10^6;
X = gallery('randsvd',n,10^6); 
B = X'*A*X; 
evB = sort(diag(schur(B))); 
% Display the two sets of eigenvalues
fprintf('The Condition of X = %10.3e\n\n',kappa)
fprintf('   Eigenvalues of A       Eigenvalues of X''AX \n')
fprintf('-----------------------------------------------\n')
for r=1:n
   fprintf('%20.15f   %20.15f   \n',evA(r),evB(r))   
end
