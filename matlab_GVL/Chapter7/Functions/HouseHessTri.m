  function [Q,Z,H,T] = HouseHessTri(A,B)
% function [Q,Z,H,T] = HouseHessTri(A,B)
% Householder reduction to Hessenberg-Triangular form.
% A and B are nxn.
% Q is nxn and orthogonal and Z is nxn orthogonal so that 
% Q'AZ = H is upper Hessenberg and Q'BZ is upper triangular
% GVL4: Algorithm 7.7.1.
[n,n] = size(A);
Z = eye(n,n);
% Upper triangularize B...
[Q,B] = qr(B);
A = Q'*A;
for j=1:n-2
    for i=n:-1:j+2
        % Zero A(i,j) "with a Q" and update
        [c,s] = Givens(A(i-1,j),A(i,j));
        A(i-1:i,j:n)   = [c s;-s c]'*A(i-1:i,j:n);
        B(i-1:i,i-1:n) = [c s;-s c]'*B(i-1:i,i-1:n);
        Q(:,i-1:i) = Q(:,i-1:i)*[c s ; -s c];
        % Zero B(i,i-1) "with a Z". Note that if
        % [c s; -s c]'*[-B(i,i);B(i,i-1)] = [* ; 0], then
        % [B(i,i-1) B(i,i)]*[c s;-s c] = [0 *].
        [c,s] = Givens(-B(i,i),B(i,i-1));
        B(1:i,i-1:i) = B(1:i,i-1:i)*[c s;-s c];
        A(1:n,i-1:i) = A(1:n,i-1:i)*[c s ;-s c];
        Z(:,i-1:i) = Z(:,i-1:i)*[c s; -s c];
    end
end
H = A;
T = B;
    