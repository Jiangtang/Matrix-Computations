  function ShowTransforms()
% function ShowTransforms()
% Shows the transform matrices behind the DCT, DST, and FHT.
% GVL4: Section 1.4
n = 8;
I = eye(n,n);
for k=1:n
   ek = I(:,k);
   C(:,k) = DCT(ek);
   S(:,k) = DST(ek);
   H(:,k) = FHT(ek);
end
clc
disp('DCT Matrix =')
fprintfM(' %7.3f',C)
disp('DST Matrix =')
fprintfM(' %7.3f',S)
disp('FHT Matrix =')
fprintfM(' %2d',H)
