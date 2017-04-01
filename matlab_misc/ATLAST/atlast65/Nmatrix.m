function N=Nmatrix(n)
% The command N=Nmatrix(n) generates
% a matrix of 0's and 1's whose nonzero
% entries are in the form a letter N,
% that is, the first and last columns
% and the main diagonal consist entirely
% of 1's and the remaining entries of the
% matrix are all 0.
N=eye(n);
N(:,1)=ones(n,1);
N(:,n)=ones(n,1);
