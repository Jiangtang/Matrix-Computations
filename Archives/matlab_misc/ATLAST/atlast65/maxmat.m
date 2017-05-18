function M=maxmat(n);
% The command M=maxmat(n) generates an
% nxn matrix whose (i,j) entry is the
% maximum of i and j.
M=ones(n,1)*[1:n];
M=max(M,M');
