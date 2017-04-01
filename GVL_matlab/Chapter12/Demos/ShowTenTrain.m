  function ShowTenTrain()
% function ShowTenTrain()
% Illustrates the tensor train representation
clc
fprintf('The Tensor Train Representation\n\n')

% Generate an example where A is low multilinear rank plus noise
n = [6 9 8 7 9];
r = [2 3 2 4 2];
d = length(n);
Noise = .0001;
A = random_ttensor(n,r,Noise);
fprintf('size(A) = [')
fprintf(' %1d ',n)
fprintf(']\n')
fprintf('rank(A) = [')
fprintf(' %1d ',r)
fprintf(']  (approximate) \n')
fprintf('Noise: O(%10.3e)\n\n',Noise)

% Set TT tolerance and compute the train...
tol = .001;
G = TT(A,tol);
fprintf('TT tolerance = %10.3e\n\n',tol)
fprintf('G{1}:   %2d  x %2d\n',size(G{1}))
for k=2:d-1
    fprintf('G{%1d}:',k)
    fprintf('   %2d  x %2d  x %2d\n',size(G{k}))
end
fprintf('G{%1d}:   %2d  x %2d\n',d,size(G{d}))   

% The train's data sparsity and how well it approximates A...
nG = 0;
for k=1:d
    nG = nG + numel(G{k});
end
nA = numel(A);
fprintf('\nNumber of A-entries = %1d\n',nA)
fprintf('Number of G-entries = %1d\n',nG)
A1 = TrainToExplicit(G);
err = norm(A(:)-A1(:));
fprintf('\n|| A - TT(A) || = %10.3e\n',err)

  function G = TT(A,tol)
% function G = TT(A,tol)
% A is an n(1)-by-...-by-n(d) tensor 
% G is a length-d cell array that represents a tensor train approximation
% to A:
%         G{1} is n(1)-by-r(1)
%         G{k} is r(k-1)-by-n(k)-by-r(k)   k=2:d-1
%         G{d} is r(d-1)-by-n(d)
% The r-values are determined by tol. (Singular values that are
% small relative to tol are set to zero.) If tol is zero then the 
% approximation is exact.
% GVL4: Section 12.5.8
n = size(A);
d = length(n);
G = cell(d,1);
Mk = TenToMat(A,1,2:d);
[Uk,Sk,Vk] = LowRank(Mk,tol);
r(1) = length(Sk);
G{1} = Uk;
for k=2:d-1
    Mk = reshape(Sk*Vk',r(k-1)*n(k),prod(n(k+1:d)));
    [Uk,Sk,Vk] = LowRank(Mk,tol);
    r(k) = length(Sk);
    G{k} = reshape(Uk,[r(k-1) n(k) r(k)]);
end
G{d} = Sk*Vk';

  function [U,S,V] = LowRank(M,tol)
% function [U,S,V] = LowRank(M,tol)
% Low-Rank, SVD-Based approximation of matrix M
% M is an mxn matrix
% tol is a real that satisfies 0<=tol<1
% U is mxr with orthonormal columns
% S is rxr diagonal
% V is nxr with orthonormal columns
% r is the number of singular values that are bigger than tol*S(1,1)
[U,S,V] = svd(M,'econ');
r = sum(diag(S)>=tol*S(1,1));
U = U(:,1:r);
S = S(1:r,1:r);
V = V(:,1:r);
    
  function A = TrainToExplicit(G)
% function A = TrainToExplicit(G)
% G is a length-d cell array that represents a tensor train T 
% G{1} is n(1)-by-r(1)
% G{k} is r(k-1)-by-n(k)-by-r(k)   k=2:d-1
% G{d} is r(d-1)-by-n(d)
% A is the n(1)-by-...-by-n(d) tensor defined by T.
% GVL4: Section 12.5.8
d = length(G);
A = G{1};
for k=2:d
   A = Contract(A,G{k});
end

  function C = Contract(A,B)
% function C = Contract(A,B)
% A is an n(1)-by-...-by-n(d) tensor
% B is an m(1)-by-...-by-m(e) tensor
% n(d) = m(1)
% C is an n(1)-by-...-by-n(d-1)-by-m(2)-by-...-by-m(e) tensor with the
% property that
%      C(i(1:d-1),j(2:e) = sum_k A(i(1:d-1),k)B(k,j(2:e))
% GVL4: Section 12.4.9

% Compute the contraction as a matrix multiplication between unfoldings
% of A and B...
n = size(A);
d = length(n);
Amat = TenToMat(A,1:d-1,d);
m = size(B);
e = length(m);
Bmat = TenToMat(B,1,2:e);
Cmat = Amat*Bmat;
% Cmat is prod(n(1:d-1))-by-prod(m(2:e)) matrix. Reshape to get C...
C = MatToTen(Cmat,1:d-1,d:e+d-2,[n(1:d-1) m(2:e)]);

     
