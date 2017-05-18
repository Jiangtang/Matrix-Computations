  function ShowFrancisQR()
% function ShowFrancisQR()
% Illustrate the Francis double implicit shift QR iteration...
% GVL4: Algorithms 7.5.1 and 7.5.2

n = 20; A = randn(n,n); H = hess(A ); tol = .00000000001; 
% Zero a random subdiagonal entry...
k = ceil(rand(1,1)*(n-1)); H(k+1,k)=0; H0 = H;
% Initializations...
it = 0;
m = n;
while m>2
   % Find smallest m so H(m+1:n,m+1:n) is quasi-upper triangular
   while m>2 && (H(m,m-1)==0 || H(m-1,m-2)==0)
       if H(m,m-1)==0
           m = m-1;
       elseif H(m-1,m-2)==0
           m = m-2;
       end
   end
   if m>1
      q = m-1;
      % Find the smallest q so that H(q:m,q:m) is unreduced Hessenberg...
      while q>1 && abs(H(q,q-1))~=0
         q = q-1;
      end
      % The active submatrix...
      H(q:m,q:m) = FrancisQRStep(H(q:m,q:m));
      % Set small subdiagonals to zero...
      for k=q:m-1
         if abs(H(k+1,k)) <= tol*(abs(H(k,k))+abs(H(k+1,k+1)))
            H(k+1,k) = 0;
         end
      end  
      % Display the subdiagonal entries...
      clc
      it = it+1;
      fprintf('Francis QR Iteration\n')
      fprintf('Iteration: %2d\n',it)
      fprintf('Working on: H(%1d:%1d,%1d:%1d).\n\n',q,m,q,m)
      for k=1:n-1
         fprintf('H(%2d,%2d) = ',k+1,k)
         if q<=k && k<m
            fprintf('%20.15f  <---\n',H(k+1,k))
         else
            fprintf('%20.15f  \n',H(k+1,k))
         end
      end
      pause(.3)
   end
end
% Triangularize all 2x2 bumps that have real eigenvalues...
for k=1:n-1
    if H(k+1,k)~=0
        [Q,H(k:k+1,k:k+1)] = schur(H(k:k+1,k:k+1));
    end
end
% Final Display...
clc
fprintf('Francis QR Iteration\n')
fprintf('Iterations Required: %2d\n\n',it)
for k=1:n-1
   fprintf('H(%2d,%2d) = %20.15f\n',k+1,k,H(k+1,k))
end

e0 = eig(H0); [z,idx] = sort(real(e0)); e0 = e0(idx);       
e1 = eig(H);  [z,idx] = sort(real(e1)); e1 = e1(idx);
fprintf('\n||eig(H_before) - eig(H_after)|| = %10.3e\n',norm(e0-e1))