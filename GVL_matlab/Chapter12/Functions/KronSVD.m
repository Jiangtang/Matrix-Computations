  function [B,C,sigma] = KronSVD(A,m1,n1,m2,n2,r)
% function [B,C,sigma] = KronSVD(A,m1,n1,m2,n2,r)
% The Kronecker Product SVD.
% A is an m1-by-n1 block matrix with m2-by-n2 blocks
% r is a positive integer that satisfies r <= min{m1*n1,m2*n2}
% B and C are r-by-1 cell arrays with the property that each
% B{i} is m1-by-n1 and each C{i} is m2-by-n2.
% sigma is an r-by-1 vector with sigma(1)>= ...>=sigma(r)>=0
% The matrix sigma(1)*kron(U{1},V{1}) + ... + sigma(r)*kron(U{r},V{r})
%   is the closest matrix to A that is the sum of r Kronecker products.

[U,S,V] = svd(MakeTilde(A,m1,n1,m2,n2));
B = cell(r,1);
C = cell(r,1);
sigma = diag(S);
for k=1:r
   B{k} = reshape(U(:,k),m1,n1);
   C{k} = reshape(V(:,k),m2,n2);
end

  function Atilde = MakeTilde(A,m1,n1,m2,n2)
% function Atilde = MakeTilde(A,m1,n1,m2,n2)
% A is regarded as an m1xn1 block matrix with m2xn2 blocks.
% Atilde is the (m1*n1)x(m2*n2) matrix R(A).
% GVL4: Page 713.
Atilde = [];
for j=1:n1
    for i=1:m1;
        Aij = A(1+(i-1)*m2:i*m2,1+(j-1)*n2:j*n2);
        Atilde = [Atilde; Vec(Aij)'];
    end
end

   
