function C=checker(n)
% The command C=checker(n) generates an nxn matrix C
% whose entries alternate between 1 and 0. Specifically
% C(i,j)=1 if i+j is even, otherwise C(i,j)=0. For example
% the command checker(4) will generate  the matrix
%
%       1  0  1  0
%       0  1  0  1
%       1  0  1  0
%       0  1  0  1
C=ones(n,1)*[1:n];
C=rem(C+C'+1,2);
