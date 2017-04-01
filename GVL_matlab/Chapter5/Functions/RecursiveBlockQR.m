  function [Q,R] = RecursiveBlockQR(A,nb)
% function [Q,R] = RecursiveBlockQR(A,nb)
% Thin QR factorization A = QR via block recursion.
% A is mxn. Assume m>=n.
% nb is the blocking factor. Assume nb<=n.
% Q is mxn with orthonormal columns.
% R is nxn upper triangular with nonnegative diagonal entries.
% GVL4: Algorithm 5.2.3
[m,n] = size(A);
if n<nb
    % Thin QR factorization...
    [Q,R] = qr(A,0);
else
    % Split A in half...
    n1 = floor(n/2);
    % QR of left half...
    [Q1,R11] =  RecursiveBlockQR(A(:,1:n1),nb);
    % QR of modified right half...
    R12 = Q1'*A(:,n1+1:n);
    A(:,n1+1:n) = A(:,n1+1:n) - Q1*R12;
    [Q2,R22] = RecursiveBlockQR(A(:,n1+1:n),nb);
    % Synthesize...
    Q = [Q1 Q2];
    R = [R11 R12; zeros(n-n1,n1) R22];
end