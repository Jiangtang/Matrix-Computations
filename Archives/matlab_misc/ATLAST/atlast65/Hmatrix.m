function H=Hmatrix(n);
% Hmatrix(n) is a matrix of 0's and 1's whose 
% nonzero are in the form of the letter H.
% The first and last columns and the middle row 
% of the matrix consist of 1's. The remaining
% entries are all 0. The input argument n must
% be an odd integer.
if rem(n,2)==0
   error('The input argument for Hmatrix must be odd')
end
H=zeros(n);
H(:,1)=ones(n,1);
H(:,n)=ones(n,1);
H(fix((n+1)/2),:)=ones(1,n);
