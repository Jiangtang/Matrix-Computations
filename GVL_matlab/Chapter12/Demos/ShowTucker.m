  function ShowTucker()
% function ShowTucker()
% Illustrates the Tucker alternating least squares framework.
% GVL4: Section 12.5.3

% Generate an example...
n = [10 6 7 8];
r = [2 2 2 2];     % Note: r(length(r))must be 2 or larger.
noise = .3;
A = random_ttensor(n,r,noise);
clc
fprintf('Tucker Iteration\n\n')
fprintf('size(A) = [')
fprintf('%2d',n)
fprintf(']\n')
fprintf('r =       [')
fprintf('%2d',r)
fprintf(']\n')
fprintf('noise = %7.1e\n\n',noise)
fprintf('A is rank r plus noise.\n\n')
fprintf('How well X captures A after k iterations...\n\n')
fprintf('  k       1 - || A - X ||/|| A || \n')
fprintf('---------------------------------------------------\n')

% Initial guess via truncated HOSVD...
[S,U,Sig] = HOSVD(A);
for k=1:length(n)
   U{k} = U{k}(:,1:r(k));
end
S = MultiLinProdTrans(A,U);
X = MultiLinProd(S,U);
capture = 1- norm(Vec(A) - Vec(X))/norm(Vec(A));
fprintf('%3d           %12.10f\n',0,capture)

% The number of Tucker improvement steps..
itMax = 3;

% The Tucker iteration...
for k=1:itMax
   U = TuckerStep(A,U);
   S = MultiLinProdTrans(A,U);
   X = MultiLinProd(S,U);
   capture = 1- norm(Vec(A) - Vec(X))/norm(Vec(A));
   fprintf('%3d           %12.10f\n',k,capture)
end

  function U1 = TuckerStep(A,U)
% function U1 = TuckerStep(A,U)
% A is an n(1)-by- ... -by-n(d) tensor
% U is a length-d cell array where U{k} is an n(k)-by-r(k) matrix
% with orthonormal columns.
% U1 is a length-d cell array where U1{k} is an n(k)-by-r(k) matrix
% with orthonormal columns obtained by sequentially improving each U{k}
% so that  
%
%   || MultiLinProd(S1,U1) - A || < || MultiLinProd(S,U) - A ||
%
% where S1 = MultiLinProdTrans(A,U1) and S = MultiLinProdTrans(A,U)

% Get the dimensions...
n = size(A);
d = length(n);
for k=1:d
    [n(k),r(k)] = size(U{k});
end
% The alternating least squares framework...
for k=1:d
    % Update U{k}. 
    % Start by unfolding...
    Ak = TenToMat(A,[k],[1:k-1 k+1:d]);
    % Bk = Ak*(U{d} x...x U{k+1} x U{k-1} x...x U{1})
    Bk = zeros(n(k),prod(r(1:k-1))*prod(r(k+1:d)));
    % Each row of Bk is a multilinear product...
    for i=1:n(k)
        Bk(i,:) = Vec(MultiLinProdTrans(reshape(Ak(i,:),[n(1:k-1) n(k+1:d)]),...
            U([1:k-1 k+1:d])))';
    end
    % Get the new U{k} via the SVD of Bk...
    [Uk,Sk,Vk] = svd(Bk);
    U{k} = Uk(:,1:r(k));
end
U1 = U;