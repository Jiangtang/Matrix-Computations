  function s = Sep(B,C)
% function s = Sep(B,C)
% The separation between two square matrices.
% Assume that B and C are square matrices.
% s is the minimum value of norm(AX-XB,'fro') subject to the constraint
% that norm(X,'fro') = 1.
m = length(B); Im = eye(m,m);
n = length(C); In = eye(n,n);
A = kron(In,B) - kron(C,Im);
s = min(svd(A));