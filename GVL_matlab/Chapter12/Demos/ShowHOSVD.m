function ShowHOSVD()

n = [5 6 7 8];
d = length(n);
r = 3;
X1 = randn(n(1),r);
X2 = randn(n(2),r);
X3 = randn(n(3),r);
X4 = randn(n(4),r);
a = zeros(prod(n),1);
for k=1:r
    a = a + kron(X4(:,k),kron(X3(:,k),kron(X2(:,k),X1(:,k))));
end
A = reshape(a,n);

clc
fprintf('Higher-Order SVD\n\n')
fprintf('size(A) = [')
fprintf('%2d',n)
fprintf(' ]\n')
fprintf('A is the sum of %1d rank-1 tensors.\n\n',r)
[S,U,Sig] = HOSVD(A);
for k=1:d
    fprintf('U{%1d} = \n',k)
    fprintfM('%8.3f',U{k})
    fprintf('Sig{%1d} = \n',k)
    fprintfM('%20.16f',Sig{k})
end
err = norm(Vec(A) - Vec(MultiLinProd(S,U)));
fprintf('\n|| A - MultiLinProd(S,U) || = %10.3e\n\n',err)

