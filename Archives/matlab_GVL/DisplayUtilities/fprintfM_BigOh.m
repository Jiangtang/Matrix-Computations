  function fprintfM_BigOh(A)
% function fprintfM_BigOh(A)
% Displays the matrix A in order-of-magnitude notation.
% For example, if
%
%            A = [ .123 -.007  .0004; 0  .00009  -12]
%
% then the display would be
%
%           -1  -2  -3
%     10.^ -15  -4   1
%
% (Zeros are replaced by eps*max(max(abs(A))).)

[m,n] = size(A);
E = round(log10(abs(A)+eps*max(max(abs(A)))*ones(m,n)));
disp(' ')
for i=1:m
    if i~=m
        fprintf('       ')
        fprintf('%4d',E(i,:))
        fprintf('\n')
    else
        fprintf('   10.^')
        fprintf('%4d',E(i,:))
        fprintf('\n')
    end
end
fprintf('\n')

