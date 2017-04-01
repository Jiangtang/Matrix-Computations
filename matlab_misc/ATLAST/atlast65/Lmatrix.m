function L=Lmatrix(n)
% The function Lmatrix(n) generates a matrix
% of 0's and 1's. The nonzero entries are in the
% form of a letter L, that is the first column
% and the last row consist entirely of 1's and
% the remaining entries are 0.
L=zeros(n);
L(:,1)=ones(n,1);
L(n,:)=ones(1,n);
