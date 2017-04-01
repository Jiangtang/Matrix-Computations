  function [q,lambda] = PowerMethod(A,q0,m)
% function [q,lambda] = PowerMethod(A,q0,m)
% Power method.
% A is nxn, q0 is nx1, and m is a positive integer.
% q is a unit 2-norm vector in the direction of A^m*x0.
% lambda is mx1 and lambda(k) is the kth estimate of the dominant eigenvalue.
% A call of the form q = PowerMethod(A,q0,m) simply returns q.
% GVL4: Section 7.3.1
q = q0/norm(q0);
lambda = [];
for k=1:m
    z = A*q;
    if nargout==2
        lambda = [ lambda ; q'*z ];
    end
    q = z/norm(z);
end