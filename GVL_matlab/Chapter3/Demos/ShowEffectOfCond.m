  function ShowEffectOfCond()
% function ShowEffectOfCond()
% Examines the Gaussian elimination heuristic 
%
%          norm(xHat-x)/norm(x) approx cond(A)*(unit roundoff)
%
% where xHat is the computed solution.
% GVL4: Section 3.5.1.

% Exact...
clc
n = 6;
A = pascal(n);
b = A*ones(n,1);
fprintf('The exact linear system...\n')
disp('A ='),fprintfM('%5d',A);
disp('b ='),fprintfM('%5d',b);
disp('xExact =')
fprintfM('%5d',ones(n,1));
fprintf('cond(A,2) = %10.2e\n\n',cond(A,2))

% IEEE double solution...
[L,U,piv] = OuterLU_PP(A);
for k=1:n-1
   b([k piv(k)]) = b([piv(k) k]);
end
y = ForwardRow(L,b);
x = BackRow(U,y);
disp('Solution using IEEE double arithmetic...')
fprintfM('%19.15f',x)
 
% fl6 solution...
A6 = fl6(A);
b6 = fl6(A*ones(n,1));
[L6,U6,piv6] = OuterLU_PP6(A6);
for k=1:n-1
   b6([k piv6(k)]) = b6([piv6(k) k]);
end
y6 = ForwardRow6(L6,b6);
x6 = BackRow6(U6,y6);
disp('Solution using fl6 arithmetic...')
fprintfM('%9.5f',Value6(x6))


