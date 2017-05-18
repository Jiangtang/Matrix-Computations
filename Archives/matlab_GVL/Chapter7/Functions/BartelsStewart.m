  function Z = BartelsStewart(F,G,C)
% function Z = BartelsStweart(F,G,C)
% Bartels-Stewart Algorithm for the Sylvester Equation FZ-ZG = C
% F is pxp and G is rxr, and C is pxr.
% Assumes that F and G have no common eigenvalues.
% Z is pxr and satisfies FZ-ZG=C.
% GVL4: Algorithm 7.6.2
[p,r] = size(C);
I = eye(p,p);
for k=1:r
    C(:,k) = C(:,k) + C(:,1:k-1)*G(1:k-1,k);
    C(:,k) = (F - G(k,k)*I)\C(:,k);
end
Z = C;