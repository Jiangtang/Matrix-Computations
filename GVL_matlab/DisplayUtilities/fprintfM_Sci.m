  function fprintfM_Sci(s,A)
% function fprintfM_Sci(s,A)
% Displays the matrix A in "matrix scientific notation''
% according to print format specified by the string s,
% For example, if
%            A = [ 45 1234; -34 0]
% and
%            s = '%7.4f'
% then the display would be
%
%    0.0450   1.2340  
%   -0.0340   0.0000    x 10^3
%
% If  1/10 <= max|A(i,j)| <= 1, then the exponent is set
% to zero. (Allows for the pretty printing of orthogonal
% matrices.)

[m,n] = size(A);
% Scale A...
biggest = max(max(abs(A)));
if biggest ==0 || (1/10 <= biggest && biggest<= 1)
   e = 0;
else
   e = floor(log10(biggest));
end
A = A/10^e;
disp(' ')
% Visit each entry in A and display it prettily..
for i = 1:m
    for j=1:n
        if j==1
             fprintf('   %s  ',sprintf(s,A(i,j)))
        else
            fprintf('%s  ',sprintf(s,A(i,j)))
        end
    end
    % Display the scale factor 10^e...
    if i<m 
       fprintf('\n');
    else
       if e~=-1
          fprintf('  x 10^%1d\n',e);
       else
          fprintf('  x 10^%1d\n',e+1);
       end
    end
end
fprintf('\n')

 