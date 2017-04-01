  function [q,lambda] = InverseIt(A,mu,q0,m)
% function [q,lambda] = InverseIt(A,mu,q0,m)
% Inverse iteration.
% A is nxn, mu is an approximate eigenvalue, q0 is nx1, 
%   and m is a positive integer.
% q is a unit 2-norm vector in the direction of inv(A-mu*I)^m*q0.
% lambda is mx1 and lambda(k) is the kth estimate of an 
%    eigenvalue close to mu.
% A call of the form q = InverseIt(A,mu,q0,m) simply returns q.
% GVL4: Section 7.6.1
n = length(q0);
q = q0;
[L,U,piv] = lu(A - mu*eye(n,n),'vector');
lambda = [];
for k=1:m
    % Solve (A - mu*I)z = q ...
    z = U\(L\q(piv));
    q = z/norm(z);
    if nargout==2
       lambda = [lambda;q'*(A*q)];
    end
end