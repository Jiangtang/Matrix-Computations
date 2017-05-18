  function [L,D,P] = BunchParlett(A)
% function [L,D,P] = BunchParlett(A)
% Bunch-Parlett factorization of a symmetric matrix
% A is nxn and symmetric
% L is nxn and unit lower triangular
% D is nxn block diagonal with 1x1 and 2x2 diagonal blocks
% P is nxn and a permutation
% PAP' = LDL'
% GVL4: Section 4.4.3
n = length(A);
L = eye(n,n); D = zeros(n,n); P = eye(n,n);
k=1;
alfa = (1+sqrt(17))/8;
while k<=n
    [z,p] = max(abs(A(k:n,k:n)));
    [mu_0,q] = max(z);
    [mu_1,r] = max(abs(diag(A(k:n,k:n)))); 
    if k==n || mu_1>=alfa*mu_0
        % 1x1 pivot
        % Move largest diagonal entry in (A(k:n,k:n) to (k,k) position...
        kpiv = k+r-1;
        A([kpiv k],k:n) = A([k kpiv],k:n);
        A(k:n,[kpiv k]) = A(k:n,[k kpiv]);
        P([kpiv k],:)   = P([k kpiv],:);
        L([kpiv k],1:k-1) = L([k kpiv],1:k-1);
        % Next column of L and the rank-1 update...
        E = A(k,k); 
        C = A(k+1:n,k);
        L(k+1:n,k)  = (E\C')';
        D(k,k) = E;
        A(k+1:n,k+1:n) = A(k+1:n,k+1:n) - C*L(k+1:n,k)';
        k = k+1;
    else
        % 2x2 pivot
        % The largest off-diagonal in A(k:n,k:n) is A(i,j) where..,
        i = k+p(q)-1; j = k+q-1;
        % Move A(i,j) to A(k+1,k)...
        A([k j],k:n) = A([j k],k:n); 
        A(k:n,[k j]) = A(k:n,[j k]);
        P([k j],:) = P([j k],:);
        L([k j],1:k-1) = L([j k],1:k-1);
        A([k+1 i],k:n) = A([i k+1],k:n); A(k:n,[k+1 i]) = A(k:n,[i k+1]);
        P([k+1 i],:)     = P([i k+1],:);
        L([k+1,i],1:k-1) = L([i k+1],1:k-1);
        % Next block column of L and the rank-2 update...
        E = A(k:k+1,k:k+1); 
        C = A(k+2:n,k:k+1);
        L(k+2:n,k:k+1)  = (E\C')';
        D(k:k+1,k:k+1) = E;
        A(k+2:n,k+2:n) = A(k+2:n,k+2:n) - C*L(k+2:n,k:k+1)';
        k = k+2;
    end
end
 