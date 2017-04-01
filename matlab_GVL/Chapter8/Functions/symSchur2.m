  function [c,s] = symSchur2(A,p,q)
% function [c,s] = symSChur2(A,p,q)
% 2x2 symmetric SChur decomposition
% A is nxn and symmetric and 1<=p<q<=n
% c and s satisfy c^2+s^2=1 and if Q = [c s;-s c], then
% Q'*A([p q],[p q])Q is diagonal.
% GVL4: Algorithm 8.5.1
if A(p,q)~=0
    tau = (A(q,q)-A(p,p))/(2*A(p,q));
    if tau>=0
        t = 1/(tau+sqrt(1+tau^2));
    else
        t = 1/(tau-sqrt(1+tau^2));
    end
    c = 1/sqrt(1+t^2); s = t*c;
else
    c = 1; s = 0;
end
  
