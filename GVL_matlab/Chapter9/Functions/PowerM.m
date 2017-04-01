  function F = PowerM(A,s)
% function F = PowerM(A,s)
% Power of a matrix exploiting the binary expansion of s.
% A is nxn and s is a positive integer.
% F = A^s
% GVL4: Algorithm 9.2.2
beta = BinaryRep(s);
t=length(beta)-1;
Z = A;
q = 0;
while beta(q+1)==0
    Z = Z*Z;
    q = q+1;
end
F = Z;
for k=q+1:t
    Z = Z*Z;
    if beta(k+1)==1
        F = F*Z;
    end
end

  function beta = BinaryRep(k)
% function beta = BinaryRep(k)
% k is a nonnegative integer
% beta is length t+1 array that encodes the binary expansion of k:
%     k = beta(1) + beta(2)*2 + beta(3)*2^2 + ... + beta(t+1)*2^t
if k==0
   beta = 0;
else
   t = floor(log2(k));
   beta = [];
   for j=1:t+1
      if rem(k,2)==1
         beta = [beta 1];
      else
         beta = [beta 0];
      end
      k = floor(k/2);
   end
end