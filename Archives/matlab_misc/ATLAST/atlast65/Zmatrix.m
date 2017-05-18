function Z=Zmatrix(n)
% The command Z=Zmatrix(n) generates
% a matrix of 0's and 1's whose nonzero
% entries are in the form a letter Z,
% that is, the first and last rows
% and the anti-diagonal consist entirely
% of 1's and the remaining entries of the
% matrix are all 0.
Z=fliplr(eye(n));
Z(1,:)=ones(1,n);
Z(n,:)=ones(1,n);
