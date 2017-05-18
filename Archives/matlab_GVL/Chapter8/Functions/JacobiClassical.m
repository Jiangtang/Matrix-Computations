  function [V,D,offVals] = JacobiClassical(A,tol)
% function [V,D,offVals] = JacobiClassical(A,tol)
% Classical Jacobi algorithm for symmetric Schur decompoistion.
%
% A is nxn and symmetric. V is nxn and orthogonal with the
% property that V'*AV = D and off(D)<=tol*norm(A,'fro').
%
% offVals is a vector that reports the value of off(A) after
% every update.
% GVL4: Algorithm 8.5.2

n = length(A);
V = eye(n,n);
delta = tol*norm(A,'fro');
offA = norm(A-diag(diag(A)),'fro');
offVals = offA;
while offA>delta
    % Find the largest off diagonal entry...
    p=1;q=2; maxAij = abs(A(1,2));
    for i=1:n
        for j=i+1:n
            if abs(A(i,j))>maxAij
                p=i;q=j;maxAij=abs(A(p,q));
            end
        end
    end
    % Update...
    [c,s] = symSchur2(A,p,q);
    A([p q],:) = [c s;-s c]'*A([p q],:);
    A(:,[p q]) = A(:,[p q])*[c s;-s c];
    V(:,[p q]) = V(:,[p q])*[c s;-s c]; 
    offA = norm(A-diag(diag(A)),'fro'); 
    offVals = [offVals;offA];
end
D = A;



