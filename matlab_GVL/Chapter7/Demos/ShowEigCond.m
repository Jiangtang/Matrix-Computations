  function ShowEigCond()
% function ShowEigCond()
% Eigenvalue Condition
% Illustrated by the 15-by-15 Frank matrix
% GVL4: Section 7.2.2
clc
m = 7;
n = 2*m+1;
F = gallery('frank',n);
fprintf('Eigenvalue sensitivity for the 15x15 Frank Matrix:\n')
fprintfM('%4d',F)
fprintf('Note: if lambda is an eigenvalues, then so its reciprocal\n\n')
% Compute the eigenvalues two ways...
[X,DX] = eig(F);
[dx,idx] = sort(diag(DX),'descend');
[Y,DY] = eig(F');
[dy,idy] = sort(diag(DY),'descend');
% Now compare...
for k=1:n
    xk = X(:,idx(k)); xk = xk/norm(xk);
    yk = Y(:,idy(k)); yk = yk/norm(yk);
    sk = abs(yk'*xk);
    ErrorEstimate =  eps*norm(F)/sk;
    fprintf('lambda(%1d)...\n',k)
    fprintf('        Via eig(F) : %20.15f\n',dx(k))
    fprintf('        Via eig(F''): %20.15f\n',dy(k))
    if k>m+1
        fprintf('    Via Reciprocal : %20.15f\n',1/dx(n-k+1))
    end
    fprintf('    Error Estimate :   %18.15f\n\n',ErrorEstimate)
end
    


