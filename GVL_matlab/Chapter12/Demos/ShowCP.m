  function ShowCP()
% function ShowCP()
% Illustrates the CP alternating least squares framework.
% GVL4: Section 12.5.4

% Generate an example...
n = [5 7 3 8];
r = 2;
noise = 0.3;
A = random_ktensor(n,r,noise);
clc
fprintf('CP Iteration\n\n')
fprintf('size(A) = [')
fprintf('%2d',n)
fprintf(' ]\n')
fprintf('r = %2d\n',r)
fprintf('noise = %7.1e\n\n',noise)
fprintf('A is rank r plus noise.\n\n')
fprintf('How well X captures A after k iterations...\n\n')
fprintf('  k       1 - || A - X ||/|| A || \n')
fprintf('---------------------------------------------------\n')

% Initial guess 
for k=1:length(n)
   F{k} = randn(n(k),r);
   for j=1:r;
       F{k}(:,j) = F{k}(:,j)/norm(F{k}(:,j));
   end
   C{k} = F{k}'*F{k};
end
lambda = zeros(r,1);
X = MakeCPtensor(lambda,F);
capture = 1- norm(Vec(A) - Vec(X))/norm(Vec(A));
fprintf('%3d           %10.6f\n',0,capture)

% The number of CP improvement steps...
itMax = 10;
% The CP iteration...
for k=1:itMax
   [lambda,F,C] = CPStep(A,lambda,F,C);
   X = MakeCPtensor(lambda,F);
   capture = 1- norm(Vec(A) - Vec(X))/norm(Vec(A));
   fprintf('%3d           %10.6f\n',k,capture)
end

  function [lambda1,F1,C1] = CPStep(A,lambda,F,C)
% function [lambda1,F1,C1] = CPStep(A,lambda,F,C)
% A is an n(1)-by- ... -by-n(d) tensor
% lambda is a length-r vector of real numbers.
% F is a length-d cell array where F{k} is an n(k)-by-r matrix.
% C is a length-d cell array where C{k} = F{k}'*F{k}.
% lambda` is a length-r vector of real numbers.
% F1 is a length-d cell array where F1{k} is an n(k)-by-r matrix.
% C1 is a length-d cell array where C1{k} = F1{k}'*F1{k}.
%
% || MakeCPtensor(lambda1,F1,C1) - A || < || MakeCPtensor(lambda,F,C) - A ||

% Get the dimensions...
n = size(A);
d = length(n);
[r,r] = size(C{1});
% The alternating least squares framework...
for k=1:d
   % Update F{k}. 
   % Start by unfolding...
   Ak = TenToMat(A,[k],[1:k-1 k+1:d]);
   % Determine Fk_tilde that minimizes
   %
   %   || Ak - Fk_tilde*KRprod(F([d:-1:k+1 k-1:-1:1])' ||
   %
   % Using normal equations, this says M*Fk_tilde' = Bk where
   %
   %          M = C{1}.* ... .*C{k-1}.*C{k+1}.* ... .* C{d}
   % and
   %          Bk = KRprod(F([d:-1:k+1 k-1:-1:1]))'*Ak'.
   M = ones(r,r);
   for j=1:d
      if j~=k
         M = M.*C{j};
      end
   end
   Bk = KRprod(F([d:-1:k+1 k-1:-1:1]))'*Ak';
   Fk_tilde = (M\Bk)';
   for j=1:r
      lambda(j) = norm(Fk_tilde(:,j));
      F{k}(:,j) = Fk_tilde(:,j)/lambda(j);
   end
   C{k} = F{k}'*F{k};
end
lambda1 = lambda;
C1 = C;
F1 = F;

  function X = MakeCPtensor(lambda,F)
% function X = MakeCPtensor(lambda,F)
% lambda is a length-r vector
% F is a length-d cell array and F{k} is n(k)-by-r
% X is the n(1)-by- ... -by-n(d) tensor defined by
%    Vec(X) = sum_{j=1}^r lambda(j)* F{d}(:,j) x...x F{1}(:,j)
d = length(F);
for k=1:d
    [n(k),r] = size(F{k});
end
x = zeros(prod(n),1);
for j=1:r
    v = F{1}(:,j);
    for k=2:d
        v = kron(F{k}(:,j),v);
    end
    x = x + lambda(j)*v;
end
X = reshape(x,n);
          
  function C = KRprod(B)
% function C = KRprod(B)
% B is a length-d cell array where B{k} is m(k)-by-r.
% C = B{1} "xkr" ... "xkr" B{d} where "xkr" is the Khatri-Rao product 
% based on column partitionings of the B{k}.
d = length(B);
for k=1:d
    [m(k),r] = size(B{k});
end
C = zeros(prod(m),r);
for j=1:r
    v = B{1}(:,j);
    for i=2:d
        v = kron(v,B{i}(:,j));
    end
    C(:,j) = v;
end
