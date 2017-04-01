  function ShowLDLTpiv(A)
% function ShowLDLTpiv(A)
% Displays the LDL-transpose factorization with diagonal pivoting
% of a symmetric positive definite A. 
% A call of the form ShowLDLT() generates a random 6x6 example.
if nargin==0
    A = randn(6,6);
    A = A'*A;
end
[L,D,P] = LDLTpiv(A);
clc
fprintf('LDLT Factorization\n\n')
disp('A = ')
fprintfM('%7.3f',A)
disp('P = ')
fprintfM('%3d',P)
disp('L = ')
fprintfM('%7.3f',L)
disp('D = ')
fprintfM('%7.3f',D)
err = norm(P*A*P'-L*D*L');
fprintf('\n||PAP'' - LDL''|| = %10.3e\n\n',err)






   