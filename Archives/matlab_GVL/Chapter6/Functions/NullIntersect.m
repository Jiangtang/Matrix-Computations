  function Y = NullIntersect(A,B,tol)
% function Y = NullIntersect(A,B,tol)
% Orthonormal basis for the intersection of of null(A) and niull(B).
% A is mxn and B is pxn. If their nullspaces intersect nontrivially,
% then the orthonormal columns of Y span the intersction. Otherwise,
% Y is the empty matrix.
% tol is used to test for small singular values.
% GVL4: Algorithm 6.4.1

[m,n] = size(A);
[p,n] = size(B);
[UA,SA,VA] = svd(A,0);
r = sum(diag(SA)>=tol*norm(A,1));
if r<n
    C = B*VA(:,r+1:n);
    [UC,SC,VC] = svd(C);
    q = sum(diag(SC)>=tol*norm(B,1));
    if q<=n-r
        Y = VA(:,r+1:n)*VC(:,q+1:n-r);
    else
        Y = [];
    end       
else
    Y = [];
end