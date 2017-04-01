  function Q = Procrustes(A,B)
% function Q = Procrustes(A,B)
% A and B are mxn with m>n. Q is an nxn orthogonal matrix
% chosen so that norm(A-BA,'fro') is minimized.
% GVL4: Algorithm 6.4.1
[U,S,V] = svd(B'*A);
Q = U*V';
