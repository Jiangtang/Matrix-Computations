  function [V,D,offVals] = JacobiCyclic(A,tol)
% function [V,D,offVals] = JacobiCyclic(A,tol)
% Cyclic Jacobi algorithm for symmetric Schur decompoistion.
%
% A is nxn and symmetric. V is nxn and orthogonal with the
% property that V'*AV = D and off(D)<=tol*norm(A,'fro').
%
% offVals is a vector that reports the value of off(A) after
% every update.
% GVL4: Algorithm 8.5.3

n = length(A);
V = eye(n,n);
delta = tol*norm(A,'fro');
offA = norm(A-diag(diag(A)),'fro');
offVals = offA;
while offA>delta
    for p=1:n-1
        for q = p+1:n
           [c,s] = symSchur2(A,p,q);
           A([p q],:) = [c s;-s c]'*A([p q],:);
           A(:,[p q]) = A(:,[p q])*[c s;-s c];
           V(:,[p q]) = V(:,[p q])*[c s;-s c]; 
           offA = norm(A-diag(diag(A)),'fro'); 
           offVals = [offVals;offA];
        end
    end
end
D = A;



