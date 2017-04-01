function B=rowswap(A,i,j)
% The command rowswap(A,i,j) interchanges 
% rows i and j of the matrix A and outputs
% the resulting matrix.
[m,n]=size(A);
if i<1|i>m|j<1|j>m
   error('Index out of range')
end
B=A;
B(i,:)=A(j,:);
B(j,:)=A(i,:);
