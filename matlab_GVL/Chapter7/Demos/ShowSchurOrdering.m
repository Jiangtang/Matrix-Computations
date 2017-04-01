  function ShowSchurOrdering()
% function ShowSchurOrdering()
% Ordering eigenvalues in the Schur decomposition.
% A random 8x8 upper triangular matrix...
n = 8; T = triu(randn(n,n)); T0 = T;
clc
fprintf('Ordering eigenvalues in the Schur decomposition.\n')
fprintfM('%7.3f',T)
pause(1)
% Initializations...
Q = eye(n,n); p = 3; d = sort(abs(diag(T)),'descend');
% Swap diagonal entries until the eigenvalues of  T(1:p,1:p) 
% are the p biggest eigenvalues of T...
% GVL4: Algorithm 7.6.1
while any(abs(diag(T(1:p,1:p)))<d(p))
   for k=1:n-1 
      if abs(T(k,k))<d(p) && d(p)<=abs(T(k+1,k+1))
         [c,s] = Givens(T(k,k+1),T(k+1,k+1)-T(k,k))
         T(k:k+1,k:n) = [c s;-s c]'*T(k:k+1,k:n);
         T(1:k+1,k:k+1) = T(1:k+1,k:k+1)*[c s;-s c];
         Q(:,k:k+1) = Q(:,k:k+1)*[c s;-s c];
         d = sort(abs(diag(T)),'descend');
         clc
         fprintf('Ordering eigenvalues in the Schur decomposition.\n')
         fprintfM('%7.3f',T)
         pause(1)
      end
   end
end
fprintf('||Q''*T0*Q - T|| = %10.3e\n',norm(Q'*T0*Q - T))
            