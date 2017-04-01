  function [S,U,Sig] = HOSVD(A)
% function [S,U,Sig] = HOSVD(A)
% The Higher-Order SVD.
% A is an n1-by- ... -by-nd tensor
% S is an n1-by- ... -by-nd tensor
% U is a length-d cell array of orthogonal matrices. U{k} is n(k)-by-n(k).
% Sig is a length-d cell array of vectors. Sig{k} is the n(k)-by-1.
%    vector of singular values for the mode-k unfolding of A.
% GVL4: Section 12.5.1

% Initializations...
n = size(A);
d = length(n);
U = cell(d,1);
Sig = cell(d,1);

% The modal SVDs...
for k=1:d
    Ak = TenToMat(A,[k],[1:k-1 k+1:d]);
    [U{k},Sk,Vk] = svd(Ak);
    Sig{k} = diag(Sk);
end

% The core tensor..
S = MultiLinProdTrans(A,U);
