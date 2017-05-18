function A = randintr(m,n,k,r)
% RANDINTR(m,n,k,r) is an m by n matrix of rank r
% with integer entries in the interval [-k:k].
% If less than three arguments are used the default 
% value of k is taken to be 9.
% If only one input argument is used then it is assumed
% that the matrix is square.
% If the last argument is left off, no attempt is made
% to determine the rank.
if nargin < 3
   k=9;
end
if nargin == 1
   n=m;
end
test = 0; k = round(abs(k));
if nargin < 4
     A = floor((2*k+1)*rand(m,n) - k);
elseif r == 0 & k == 0
     A=zeros(m,n);
else
     r = round(r);
     if ( r < 1 | k < 1 | r>min(m,n))
	 error('No such matrix exists')
     end
     p = ceil(k/r);
     while test == 0
        A = randintr(m,r,p)*randintr(r,n,1);
	A = A.*(abs(A)<=k);
	if rank(A) == r 
	   test = 1;
	end
     end
end
