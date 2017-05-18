function niceimag 
% The command niceimag generates a matrix for an ATLAST
% exercise on the singular value decomposition and digital
% imaging. The rank 1 svd approximation to the image is 
% generated in the graph window. The image can then be
% updated by clicking the mouse. The updates are done
% by the svdimage command using the singular values and
% singular vectors of the original matrix.
top=27*ones(3,70);
sp1=27*ones(6,5);
la=[ones(6,2),[1;27;1;27;27;27]*ones(1,4),ones(6,2)];
sp=27*ones(6,3);
lt=[ones(1,8);[27*ones(5,3),ones(5,2),27*ones(5,3)]];
ll=[ones(6,2) [27*ones(5,4);ones(1,4)]];
p=27*ones(1,6);
ls=[ones(1,8);[1 1 p];ones(1,8);[p,1,1];[p,1,1];ones(1,8)];
atmat=[top;[sp1,la,sp,lt,sp,ll,sp,la,sp,ls,sp,lt,27*ones(6,4)];top];
svdimage(atmat,1,hsv)