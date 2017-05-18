  function ShowHessLUpiv(H,b)
% function ShowHessLUpiv()
% LU factorization of an upper Hessenberg matrix with partial pivoting
% A call of the form ShowHessLUiv() generates a random 6x6 example.
if nargin==0
   n = 6;
   H = triu(randn(n,n),-1);
   b = randn(n,1);
end
n = length(b);
x0 = H\b;
clc
fprintf('Hessenberg LU with Partial Pivoting\n\n')
disp('H =')
fprintfM('%7.3f',H);
disp('b =')
fprintfM('%17.3f',b);
[piv,H1] = HessLUpiv(H);
for k=1:n-1
   if piv(k)==1
       b([k+1 k]) = b([k k+1]);
   end
   b(k+1) = b(k+1) - H1(k+1,k)*b(k);
end
disp('U =')
fprintfM('%7.3f',triu(H));
disp('M_{n-1}P_{n-1}...M_{2}P_{2}M_{1}P_{1}b = ')
fprintfM('%17.3f',b)
x = triu(H1)\b;
fprintf('\n||x - H\\b|| = %10.3e\n\n',norm(x - x0))