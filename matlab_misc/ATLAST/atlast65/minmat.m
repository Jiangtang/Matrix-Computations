function M=minmat(n);
% The command M=minmat(n) generates an
% nxn matrix whose (i,j) entry is the
% minimum of i and j.
M=ones(n,1)*[1:n];
M=min(M,M');
