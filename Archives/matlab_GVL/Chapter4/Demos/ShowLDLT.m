  function ShowLDLT(A)
% function ShowLDLT(A)
% Displays the LDLT factorization of a symmetric positive
% definite A. A call of the form ShowLDLT() generates a random
% 6x6 example.
if nargin==0
    A = randn(6,6);
    A = A'*A;
end
[L,D] = LDLT(A);
clc
fprintf('LDLT Factorization\n\n')
disp('A = ')
fprintfM('%7.3f',A)
disp('L = ')
fprintfM('%7.3f',L)
disp('D = ')
fprintfM('%7.3f',D)
err = norm(A-L*D*L');
fprintf('\n||A - LDL''|| = %10.3e\n\n',err)






   