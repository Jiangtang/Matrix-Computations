  function ShowInvSubCondSym()
% Sensitivity of an Invariant Subspace of a Symmetric Matrix
% GVL4: Section 8.1.3
clc
fprintf('Sensitivity of an Invariant Subspace of a Symmetric Matrix\n\n')
n = 100; r = floor(n/2);
fprintf('                                  dist(ran(Q1),ran(tildeQ1))\n')
fprintf('   sep(D1,D2)      ||E21||_F          Bound        Actual     \n')
disp('-----------------------------------------------------------------')
for sepVal = logspace(-1,-10,10)
   % sep(T11,T22) gets smaller with increasing n
   % Generate an example with r negative eigenvalues and n-r positive
   % eigenvalues.  
   D = diag([linspace(-sepVal/2,-2,r) linspace(sepVal/2,3,n-r)]); [Q,R] = qr(randn(n,n)); A = Q*D*Q';
   % Perturb A and recompute the ordered Schur decomposition...
   E = randn(n,n); E = E+E'; E = E/norm(E,'fro');
   delta = .0000000000001;
   Atilde = A + delta*E;
   [Qtilde,Dtilde] = schur(Atilde);
   [Qtilde,Dtilde] = ordschur(Qtilde,Dtilde,'lhp');
   E = delta*Q'*E*Q; E21 = E(r+1:n,1:r); normE21 = norm(E21,'fro');
   distEstimate = 4*normE21/sepVal;
   distActual = norm(Q(:,1:r)'*Qtilde(:,r+1:n));
   fprintf('%13.3e  %14.3e     %10.3e  %13.3e\n',sepVal,normE21,distEstimate,distActual)
end