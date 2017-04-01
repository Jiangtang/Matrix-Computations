function S=signmat(n)
% The command S=signmat(n) will generate
% a matrix whose entries alternate between
% 1 and -1. Specifically the (i,j) will be
% 1 if i+j is even, otherwise it will be -1.
S=2*checker(n)-1;
