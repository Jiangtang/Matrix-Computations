  function [L,U] = BlockLU_Recur(A,r)
% function [L,U] = BlockLU_Recur(A,r)
% Recursive Block LU without pivoting.
% A is nxn and has an LU factorization.
% L is nxn and unit lower triangular.
% U is nxn and upper triangular.
% r is the block size.
% A = LU.
% GVL4: Algorithm 3.2.3
[n,n] = size(A);
if n<=r
    % If A is small enough, use conventional out product LU...
    [L,U] = OuterLU(A);
else
    % Rectangular LU on the first r columns...
    [L1,U1] = RectLU(A(:,1:r));
    % Set up L(:,1:r) and U(1:r,:)...
    L11 = L1(1:r,1:r);
    L21 = L1(r+1:n,1:r);
    U11 = U1(1:r,1:r);
    U12 = L11\A(1:r,r+1:n);
    % The level-3 update...
    Atilde = A(r+1:n,r+1:n)-L21*U12;
    % The recursive call...
    [L22,U22] = BlockLU_Recur(Atilde,r);
    L = [L11 zeros(r,n-r) ; L21 L22];
    U = [U11 U12; zeros(n-r,r) U22];
end