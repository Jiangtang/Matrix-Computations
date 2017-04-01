  function ShowGenLS()
% function ShowGenLS()
% Illustrates the Paige Method for Generalized Least Squares
clc 
fprintf('Generalized Least Squares\n\n')
m = 10;
n = 6;
kappaA = 1000;
A = gallery('randsvd',[m,n],kappaA,3);
b = randn(m,1);
for k=3:3:12
   kappaB = 10^k;
   B = gallery('randsvd',[m,m],kappaB,3);
   x = (B\A)\(B\b);
   xGen = GenLS(A,b,B);
   fprintf('\n++++++++++++++++++++++++++++++++++++++++++++++\n')
   fprintf('cond(B) = %10.3e\n\n',cond(B))
   fprintf('     (B\\A)\\(B\\b)           GenLS(A,b,B)  ');
   fprintfM('%20.12f',[x xGen])
   fprintf('||(B\\A)\\(B\\b) - GenLS(A,b,B)|| = %10.3e\n',norm(x-xGen))
end



