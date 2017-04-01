function ShowInvSubCond()
% function ShowInvSubCond()
% Sensitivity of an Invariant Subspace
% GVL4: Section 7.2.4
clc
fprintf('                                  dist(ran(Q1),ran(tildeQ1))\n')
fprintf('   sep(T11,T22)    ||E21||_F         Bound        Actual     \n')
disp('-----------------------------------------------------------------')

for n=[10 20 30 40 50]
   % sep(T11,T22) gets smaller with increasing z
   % Generate an example...
   d = linspace(-2,2,n);
   A = diag(d) + tril(randn(n,n),-1);
   % Compute a Schur decomposition U'*A*U = T T that orders the eigenvalues 
   % along T's diagonal so that those in the left half plane come first...
   [Q,T] = schur(A);
   [Q,T] = ordschur(Q,T,'lhp');
   % There are this many in the left half plane...
   r = sum(real(eig(T))<0);
   % Compute sep(T11,T22)...
   sepVal = Sep(T(1:r,1:r),T(r+1:n,r+1:n));
   % Perturb A and recompute the ordered Schur decomposition...
   E = randn(n,n); E = E/norm(E,'fro');
   delta = .0000000000001;
   Atilde = A + delta*E;
   [Qtilde,Ttilde] = schur(Atilde);
   [Qtilde,Ttilde] = ordschur(Qtilde,Ttilde,'lhp');
   E = delta*Q'*E*Q; E21 = E(r+1:n,1:r); normE21 = norm(E21,'fro');
   distEstimate = 4*normE21/sepVal;
   distActual = norm(Q(:,1:r)'*Qtilde(:,r+1:n));
   fprintf('%13.3e  %14.3e     %10.3e  %13.3e\n',sepVal,normE21,distEstimate,distActual)
end