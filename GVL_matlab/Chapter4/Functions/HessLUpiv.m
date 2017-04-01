  function [piv,H1] = HessLUpiv(H)
% function [piv,H1] = HessLUpiv(H)
% Hessenberg LU with pivoting.
% H is nxn and upper Hessenberg.
% piv is an (n-1)x1 zero-one vector.
% M_{n-1}P_{n-1}... M_{2}P_{2}M_{1}P_{1}H = U is upper triangular
% where  U = triu(H1), M_{k} is a Gauss transform that is the identity
% everywhere except -[M{k}]_{k+1,k} = H1(k+1,k), and P_{k} swaps rows
% k and k+1 if piv(k)=1.
% GVL4: Algorithm 4.3.4
n = length(H);
for k=1:n-1
    if abs(H(k,k))<abs(H(k+1,k))
        piv(k) = 1;
        H([k+1,k],k:n) = H([k k+1],k:n);
    else
        piv(k) = 0;
    end
    if H(k,k)~=0
        tau = H(k+1,k)/H(k,k);
        H(k+1,k+1:n) = H(k+1,k+1:n) - tau*H(k,k+1:n);
        H(k+1,k) = tau;
    end
end
H1 = H;