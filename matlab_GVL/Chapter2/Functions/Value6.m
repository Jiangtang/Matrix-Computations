  function a = Value6(x)
% x is an mxn 6-digit FP array.
% a is an mxn real array where a(i,j) is the value represented in x(i,j).
[m,n] = size(x);
if m==1 && n==1
   % Scalar case...
   if x.sign == 0
      a =  (100000*x.d0 + 10000*x.d1 + 1000*x.d2 + 100*x.d3 + 10*x.d4 + x.d5)*10^(x.e-5);
   else
      a = -(100000*x.d0 + 10000*x.d1 + 1000*x.d2 + 100*x.d3 + 10*x.d4 + x.d5)*10^(x.e-5);
   end
else
   % Matrix case...
   for i=1:m
      for j=1:n
         a(i,j) = Value6(x(i,j));
      end
   end
end