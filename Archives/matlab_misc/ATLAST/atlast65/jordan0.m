function J=jordan0(n)
% The command J=jordan0(n) will generate
% an nxn matrix with 1's on the diagonal
% above the main diagonal and 0's elsewhere.
J=diag(ones(n-1,1),1);
