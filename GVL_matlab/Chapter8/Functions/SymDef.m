  function [X,D] = SymDef(A,B)
% function [X,D] = SymDef(A,B)
% A is nxn symmetric
% B is nxn symmetric and positive definite
% X is nxn nonsingular so that X'AX = D is diagonal and and X'BX = I
G = chol(B,'lower');
% The following can be refined to exploit symmetry...
C = (G\(G\A)')';
[Q,D] = schur(C);
X = G'\Q;