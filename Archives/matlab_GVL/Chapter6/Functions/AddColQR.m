  function [Q,R] = AddColQR(Q0,R0,k,z)
% function [Q,R] = AddColQR(Q0,R0,k,z)
% Update a QR factorization after a column has been added.
% Q0 is mxm orthogonal, R0 is mxn upper triangular with n<m, 0<=k<=n
%   and z is mx1.
% Q is mxm orthogonal, R is mx(n+1) upper triangular so that 
%   QR = [A(:,1:k) z A(:,k+1:n)].
% GVL4: Section 6.5.2.
[m,n] = size(R0);
Q = Q0;
if k==0
    R = [Q'*z R0]; ktilde = 1;
elseif k==n
    R = [R0 Q'*z]; ktilde = n+1;
else
    R = [R0(:,1:k) Q'*z  R0(:,k+1:n)];  ktilde = k+1;
end
% R is upper triangular except in column ktilde
for i=m-1:-1:ktilde
    % Zero R(i+1,ktilde)...
    [c,s] = Givens(R(i,ktilde),R(i+1,ktilde));
    J = [c s ; -s c];
    idx = i:i+1;
    R(idx,ktilde) = J'*R(idx,ktilde);
    R(idx,i+1:n+1) = J'*R(idx,i+1:n+1);
    Q(:,idx) = Q(:,idx)*J;
end