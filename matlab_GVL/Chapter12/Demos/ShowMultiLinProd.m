  function ShowMultiLinProd()
% function ShowMultiLinProd()
% Computes an order-d multilinear product two ways.
% GVL4: Section 12.4.11

% Generate an example (must be small)...
n = [2 6 3 5 4];
m = [4 5 3 6 2];
S = randn(n);
M = {randn(m(1),n(1)),...
     randn(m(2),n(2)),...
     randn(m(3),n(3)),...
     randn(m(4),n(4)),...
     randn(m(5),n(5))};

% The modal product approach...
A = MultiLinProd(S,M);

% Explicit Kronecker product approach...
% Compute C = M{d} x ... x M{2} x M{1}
d = length(n);
C = kron(M{2},M{1});
for k=3:d
    C = kron(M{k},C);
end
A1 = reshape(C*Vec(S),m);
clc
fprintf('Multilinear Product\n\n')
fprintf('  k      M{k}  \n------------------------------\n')
for k=1:length(n)
    fprintf('  %1d     %1d x %1d \n',k,m(k),n(k))
end

% Error...
err = norm(Vec(A) - Vec(A1));
fprintf('\n|| MultiLinProd(S,M) - (M{d} x...x M{1})Vec(S) || = %10.3e\n\n',err)
% Flops...
flopcount = 0;
for k=1:d
    flopcount = flopcount + 2*prod(m(1:k))*prod(n(k:d));
end
fprintf('Flops = %1d\n\n',flopcount)
