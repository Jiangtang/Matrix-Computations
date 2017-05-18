function Y=Ymatrix(n)
% The command Y = Ymatrix(n) generates an nxn
% matrix of 0's and 1's in the form of the
% letter. The input argument n must be an odd
% integer.
if rem(n,2)==0
   error('The input argument for Ymatrix must be odd')
end
Y=fliplr(eye(n));
Y(1:(n-1)/2,:)=Y(1:(n-1)/2,:)|fliplr(Y(1:(n-1)/2,:));
