  function alfa = Dot6(u,v)
% function alfa = Dot6(u,v)
% u and v are length-n 6-digit FP vectors and alfa is their 6-digit FP dot product.
n = length(u);
alfa = fl6(0);
for k=1:n
    alfa = Add6(alfa,Mult6(u(k),v(k)));
end