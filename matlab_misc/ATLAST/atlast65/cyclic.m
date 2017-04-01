function C=cyclic(n)
% The command cyclic(n) generates an nxn matrix
% with 1's on the diagonal just above the main
% diagonal and a 1 in the lower left hand corner. 
% The remaining entries of the matrix are all 0.
C=diag(ones(n-1,1),1);
C(n,1)=1;
