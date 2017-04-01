  function ShowUnshiftedSymQR()
% function ShowUnshiftedSymQR()
% Illustrates the unshifted QR algorithm applied to a symmetric matrix.
% GVL4: Section 8.2.5
n = 6;
[Q,R] = qr(randn(n,n)); A = Q*diag(1:n)*Q';
% In this example, A(i,j) goes to zero like (j/i)^k for i>j
for k=1:100
    [Q,R] = qr(A);
    A = R*Q;
    clc
    A = (A+A')/2;
    fprintf('A after %1d iterations =\n',k)
    fprintfM('%15.2e',A)
    pause(.2)
end

