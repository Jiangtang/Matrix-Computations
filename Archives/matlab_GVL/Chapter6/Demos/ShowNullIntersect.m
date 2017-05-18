  function ShowNullIntersect()
% function ShowNullIntersect()
% Computes the intesection of two nullspaces two ways.
clc
fprintf('Intersection of Nullspaces\n\n')
tol = .001;
n = 10;
mA = 10; rA = 4; A = randn(mA,rA)*randn(n,rA)';
mB =  8; rB = 3; B = randn(mB,rB)*randn(n,rB)';
fprintf('A is %1dx%1d\n',mA,n)
fprintf('B is %1dx%1d\n',mB,n)
fprintf('dim(null(A)) = %1d\n',sum(svd(A)<tol*norm(A,1)))
fprintf('dim(null(B)) = %1d\n\n',sum(svd(B)<tol*norm(B,1)))

% Method 1. The nullspace of [A;B]...
[U,S,V] = svd([A;B]);
dMethod1 = sum(diag(S)<tol*norm([A;B],1));
if dMethod1 ==0
    Ymethod1 = [];
    fprintf('\nMethod 1 says the null spaces do not intersect.')
else
    Ymethod1 = V(:,n-dMethod1+1:n);
    fprintf('Ymethod1 =')
    fprintfM('%7.3f',Ymethod1)
    eA1 = norm(A*Ymethod1)/norm(A);
    eB1 = norm(B*Ymethod1)/norm(B);
    fprintf('||AYmethod1||/||A|| = %10.3e\n',eA1)
    fprintf('||BYmethod1||/||B|| = %10.3e\n',eB1)
end
% Method 2
Ymethod2 = NullIntersect(A,B,tol);
if isempty(Ymethod2)
    fprintf('\nMethod 2 says the null spaces do not intersect.\n')
else
    fprintf('\nYmethod2 =')
    fprintfM('%7.3f',Ymethod2)
    eA2 = norm(A*Ymethod2)/norm(A);
    eB2 = norm(B*Ymethod2)/norm(B);
    fprintf('||AYmethod2||/||A|| = %10.3e\n',eA2)
    fprintf('||BYmethod2||/||B|| = %10.3e\n',eB2)
end
    




  function Y = NullIntersect(A,B,tol)
% function Y = NullIntersect(A,B)
% Orthonormal basis for the intersection of of null(A) and niull(B).
% A is mxn and B is pxn. If their nullspaces intersect nontrivially,
% then the orthonormal columns of Y span the intersction. Otherwise,
% Y is the empty matrix.
% Note: A singukar value of a latrix is "declared" to be zero if it
% is less than tol times the largest singular value.

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
