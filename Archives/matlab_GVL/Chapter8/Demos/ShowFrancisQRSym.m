  function ShowFrancisQRSym()
% function ShowFrancisQRSym()
% Illustrate the symmetric Francis implicit shift QR 
% with Wilkinson shift.
% GVL4: Algorithms 8.3.2 and 8.3.3
n = 15; 
A = randn(n,n); A = A + A';
T = hess(A ); 
tol = .00000000001; 
% Zero a random subdiagonal entry...
k = ceil(rand(1,1)*(n-1)); T(k+1,k)=0; T(k,k+1) = 0; 
T0 = T;
% Initializations...
it = 0;
m = n;
while m>2
   % Find smallest m so T(m+1:n,m+1:n) is diagonal
   while m>1 && T(m,m-1)==0 
      m = m-1;
   end
   if m>1
      q = m-1;
      % Find the smallest q so that T(q:m,q:m) is unreduced tridiagonal...
      while q>1 && abs(T(q,q-1))~=0
         q = q-1;
      end
      % The active submatrix...
      T(q:m,q:m) = FrancisQRStepSym(T(q:m,q:m));
      % Set small subdiagonals to zero...
      for k=q:m-1
         if abs(T(k+1,k)) <= tol*(abs(T(k,k))+abs(T(k+1,k+1)))
            T(k+1,k) = 0;
            T(k,k+1) = 0;
         end
      end  
      % Display the subdiagonal entries...
      clc
      it = it+1;
      fprintf('Francis QR Iteration (Symmetric Version)\n')
      fprintf('Iteration: %2d\n',it)
      fprintf('Working on: T(%1d:%1d,%1d:%1d).\n\n',q,m,q,m)
      for k=1:n-1
         fprintf('T(%2d,%2d) = ',k+1,k)
         if q<=k && k<m
            fprintf('%20.15f  <---\n',T(k+1,k))
         else
            fprintf('%20.15f  \n',T(k+1,k))
         end
      end
      pause(.6)
   end
end
% Final Display...
clc
fprintf('Francis QR Iteration\n')
fprintf('Iterations Required: %2d\n\n',it)
for k=1:n-1
   fprintf('T(%2d,%2d) = %20.15f\n',k+1,k,T(k+1,k))
end
e0 = sort(eig(T0));       
e1 = sort(diag(T));
fprintf('\n||eig(T_before) - eig(T_after)|| = %10.3e\n',norm(e0-e1))