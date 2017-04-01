  function ShowIterImprove()
% function ShowIterImprove()
% Illustrates iterative improvement with 6-digit FP aritmetic.
% GVL4: Section 3.5.3
clc
% The example...
n = 7;
A = pascal(n);
b = A*ones(n,1);
fprintf('The exact linear system...\n')
disp('A ='),fprintfM('%5d',A);
disp('b ='),fprintfM('%5d',b);
disp('xExact =')
fprintfM('%5d',ones(n,1));
fprintf('cond(A,2) = %10.2e\n\n',cond(A,2))
% Compute the LU factorization in fl6 arithmetic...
A = fl6(A);
b = fl6(b);
[L,U,piv] = OuterLU_PP6(A);
x = zeros6(n,1);
for j=1:6
    % Compute the residual b-Ax using IEEE double arithmetic...
    r = fl6(Value6(b) - Value6(A)*Value6(x));
    % Solve Az = r with fl6 arithmetic...
    for k=1:n-1
        r([k piv(k)]) = r([piv(k) k]);
    end
    y = ForwardRow6(L,r);
    z = BackRow6(U,y);
    % Update and display x...
    x = Add6(x,z);
    fprintf('x after %1d iterations:\n',j)
    fprintfM('%10.5f',Value6(x))  
end