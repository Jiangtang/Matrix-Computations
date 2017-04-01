  function fprintfM(s,A)
% function DispMatrix(s,A,)
% Displays the matrix A according to print format specified
% by the string s, e.g., '  %6.3f'
[m,n] = size(A);
disp(' ')
for i=1:m
    fprintf(s,A(i,:))
    fprintf('\n')
end
fprintf('\n')