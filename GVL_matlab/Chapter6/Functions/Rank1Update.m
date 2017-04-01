  function [Q,R] = Rank1Update(Q0,R0,u,v)
% function [Q,R] = Rank1Update(Q0,R0,u,v)
% Rank-1 update of a QR factorization.
% Q0 is mxn orthogonal, R0 is mxn upper triangular, u is mx1,
% and v is nx1. 
% Q is mxm orthogonal and  R is mxn upper triangular so that
% QR = Q0*R0 + u*v'.
% GVL4: Section 6.5.1
[m,n] = size(R0);
Q = Q0; R = R0;
w = Q'*u;
% Reduce w to a multiple of e1...
for k=m-1:-1:1
    [c,s] = Givens(w(k),w(k+1));
    J = [c s;-s c];
    idx = k:k+1;
    R(idx,k:n) = J'*R(idx,k:n);
    w(idx)     = J'*w(idx);
    Q(:,idx)   = Q(:,idx)*J;
end
R(1,:) = R(1,:) + w(1)*v';
% Restore R (now upper Hessenberg) to upper triangular form...
for k=1:min(m-1,n)
    [c,s] = Givens(R(k,k),R(k+1,k));
    G = [c s;-s c];
    idx = k:k+1;
    R(idx,k:n) = G'*R(idx,k:n);
    Q(:,idx)   = Q(:,idx)*G;
end