  function [Q,Lambda] = OrthogIt(A,Q0,m)
% function [Q,Lambda] = OrthogIt(A,Q0,m)
% Orthogonal iteration
% A is nxn, Q0 is nxr, and m is a positive integer.
% Q is nxr with orthogonal columns that span the range of (A^m)*Q0 where
% Lambda is mxr and Lambda(k,1:r) is the kth estimate of A's r largest
%   eigenvalues.
% A call of the form Q = OrthogIt(A,Q0,m) simply returns Q.
% GVL4: Section 7.3.1

[Q,R] = qr(Q0,0);
Lambda = [];
for k=1:m
    Z = A*Q;
    if nargout==2
        Lambda = [Lambda;eig(Q'*Z)'];
    end
    [Q,R] = qr(Z,0);
end