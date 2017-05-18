function T=Tmatrix(n)
% The command Tmatrix(n) will generate a matrix
% of 0's and 1's in the form of a letter T. For
% the command Tmatrix(3) generates the matrix
%
%                 1  1  1
%                 0  1  0
%                 0  1  0
% The input argument n must be odd.
if rem(n,2)==0
   error('The input argument for Tmatrix must be odd')
end
T=zeros(n);
T(1,:)=ones(1,n);
T(:,(n+1)/2)=ones(n,1);
