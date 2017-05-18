  function ShowFrancisQZ()
% function ShowFrancisQZ()
% Illustrates the Francis double implicit shift QZ iteration.
% GVL4: Algorithms 7.7.2 and 7.7.3.

% A and and B random nxn and rank(B) = n-d...
n = 20; 
A = randn(n,n); 
B = randn(n,n); 
% Reduce to Hessenberg-triangular form...
[H,R]= hess(A,B);
% Tolerances
tolH = .00000000001; 
tolR = .000001;
% Zero a random diagonal entry in R to check deflation...
j = ceil(rand(1,1)*(n));
R(j,j)=0;
% Zero a random subdiagonal entry in H to check out decoupling...
k = ceil(rand(1,1)*(n-1)); 
H(k+1,k)=0; 
% Initializations...
H0 = H; 
R0 = R;
it = 0;
m = n;
% H(m+1:n,m+1:n) is quasi-upper triangular
while m>2
   % Check if m can be reduced...
   while m>2 && (H(m,m-1)==0 || H(m-1,m-2)==0)
       if H(m,m-1)==0
           m = m-1;
       elseif H(m-1,m-2)==0
           m = m-2;
       end
   end
   if m>1
      % More to do...
      q = m-1;
      % Find the smallest q so that H(q:m,q:m) is unreduced Hessenberg...
      while q>1 && abs(H(q,q-1))~=0
         q = q-1;
      end
      i = m;
      % Deflate if R(q:m,q:m) singular
      while i>=q && R(i,i)~=0
          i = i-1;
      end
      if i==q-1
          % R(q:m,q:m) is nonsingular
          % The active subproblem...
          [H(q:m,q:m),R(q:m,q:m)] = FrancisQZStep(H(q:m,q:m),R(q:m,q:m));
          it = it+1;
      else
          [H,R] = Deflate(H,R,i,q,m);
      end
      % Set small subdiagonals to zero...
      for k=q:m-1
         if abs(H(k+1,k)) <= tolH*(abs(H(k,k))+abs(H(k+1,k+1)))
            H(k+1,k) = 0;
         end
      end
      % Display the subdiagonal entries...
      clc
      fprintf('Francis QZ Iteration\n')
      fprintf('Iteration: %2d\n',it)
      fprintf('Working on: {H(%1d:%1d,%1d:%1d),R(%1d:%1d,%1d:%1d)}.\n\n',q,m,q,m,q,m,q,m)
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
        [H(k:k+1,k:k+1),R(k:k+1,k:k+1),Q,Z] = qz(H(k:k+1,k:k+1),R(k:k+1,k:k+1),'real'); 
    end
end
% Final Display...
clc
fprintf('Francis QZ Iteration\n')
fprintf('Iterations Required: %2d\n\n',it)
for k=1:n-1
   fprintf('H(%2d,%2d) = %20.15f\n',k+1,k,H(k+1,k))
end
% Set small diagonal entries in final R to zero...
smallR = tolR*norm(R,'inf');
for k=1:n
    if abs(R(k,k))<=smallR
        R(k,k)=0;
    end
end
infDef=10^8;
e0 = eig(H0,R0); infdx = find(abs(e0)>=infDef); e0(infdx) = Inf;
[z,idx] = sort(real(e0)); e0 = e0(idx);     
e1 = eig(H,R);   infdx = find(abs(e1)>=infDef); e1(infdx) = Inf; 
[z,idx] = sort(real(e1)); e1 = e1(idx);
fprintf('\n\n                 eig(A,B)                                eig(H,R) \n')
fprintf('-----------------------------------------------------------------------\n')
disp([e0 e1])


  function [H0,R0] = Deflate(H,R,i,q,m)
% H(q:m,q:m) is unreduced.
% i satisfies: 
%    (1) q<=i<=m
%    (2) R(i,i) = 0
%    (3) R(i+1:m,i+1:m) is nonsingular.
% H0-lambda*R0 is orthogonally equivalent to H-lambda*R and
% H0(m,m-1) is zero
for k=i:m-1
    % Zero R(k+1,k+1) with a Q...
    [c,s] = Givens(R(k,k+1),R(k+1,k+1));
    j  = max(q,k-1);
    H(k:k+1,j:m) = [c s;-s c]'*H(k:k+1,j:m);
    R(k:k+1,j:m) = [c s;-s c]'*R(k:k+1,j:m);
    if k>q
       % Zero H(k+1,k-1) with a Z...
       [c,s] = Givens(-H(k+1,k),H(k+1,k-1));
       H(q:k+1,k-1:k) = H(q:k+1,k-1:k)*[c s;-s c];
       R(q:k+1,k-1:k) = R(q:k+1,k-1:k)*[c s;-s c];
    end
end
%Zero H(m,m-1) with a Z...
[c,s] = Givens(-H(m,m),H(m,m-1));
H(q:m,m-1:m) = H(q:m,m-1:m)*[c s;-s c];
R(q:m,m-1:m) = R(q:m,m-1:m)*[c s;-s c];
R(m,m) = 0; H(m,m-1) = 0;
H0 = H; R0 = R;




