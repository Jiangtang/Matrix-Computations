  function ShowGKsvd()
% function ShowGKsvd()
% Illustrate the Golub-Kahan SVD algorithm 
% GVL4: Algorithms 8.6.2 and 8.6.3
n = 20; 
B = tril(triu(randn(n,n)),1);
tol = .00000000001; 
smallB = tol*norm(B,1);
% Zero a random superdiagonal entry...
k = ceil(rand(1,1)*(n-1)); B(k,k+1) = 0;
% Zero a random diagonal entry...
k = ceil(rand(1,1)*n); B(k,k) = 0;
B0 = B;
% Initializations...
it = 0;
m = n;
% B(1:m,1:m) needs to be processed..
while m>1
   % Can m be reduced?
   while m>1  && abs(B(m-1,m))<=smallB 
      m = m-1;
   end
   
   if m>1
      % Find the smallest q so that B(q:m,q:m) has no zeros on its
      % superdiagonal
      q = m;
      while q>1 && abs(B(q-1,q))>smallB
         q = q-1;
      end
      % Find the smallest i (q<=i<=m) so that B(i:m,i:m) has nonzero 
      % diagonal...
      i = m;
      while i>=q && abs(B(i,i))>smallB
         i = i-1;
      end
      if i==q-1
          % B(q:m,q:m) has no zeros inside the band...
          B(q:m,q:m) = GKsvdStep(B(q:m,q:m));
          it = it+1;
      elseif i<m
          % Zero B(i,i+1)...
          for j=i+1:m
             [c,s] = Givens(-B(j,j),B(i,j))
              B([i j],j:min(j+1,m)) = [c s;-s c]'*B([i j],j:min(j+1,m));
          end
      else
          % Zero B(m-1,m)
          for j=m-1:-1:q
              [c,s] = Givens(B(j,j),B(j,m));
              B(max(j-1,q):j,[j m]) = B(max(j-1,q):j,[j m])*[c s;-s c]
          end
      end
      % Display the subdiagonal entries...
      clc
      fprintf('Golub-Kahan SVD Iteration\n')
      fprintf('Iteration: %2d\n',it)
      fprintf('Working on: B(%1d:%1d,%1d:%1d).\n\n',q,m,q,m)
      for k=1:n-1
         fprintf('B(%2d,%2d) = ',k,k+1)
         if q<=k && k<m
            fprintf('%20.15f  <---\n',B(k,k+1))
         else
            fprintf('%20.15f  \n',B(k,k+1))
         end
      end
      pause(.6)
   end
end
% Final Display...
clc
fprintf('Golub-Kahan SVD Iteration\n')
fprintf('Iterations Required: %2d\n\n',it)
for k=1:n-1
   fprintf('B(%2d,%2d) = %20.15f\n',k,k+1,B(k,k+1))
end

e0 = sort(svd(B0));       
e1 = sort(svd(B));
fprintf('\n||svd(B_before) - svd(B_after)|| = %10.3e\n',norm(e0-e1))