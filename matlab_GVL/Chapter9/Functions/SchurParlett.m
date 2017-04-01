  function F = SchurParlett(f,A)
% function F = SchurParlett(f,A)
% Function of a matrix via Schur decomposition.
% A is nxn and its eigenvalues are treated as distinct.
% f is a handle to a function f (assumed to be accessible).
% F = f(A)      
% GVL4: Algorithm 9.1.1
n = length(A);
[Q,T] = schur(A,'complex');
% Compute F = f(T)...
F = zeros(n,n);
for i=1:n
    F(i,i)  = f(T(i,i));
end
for p=1:n
    for i=1:n-p
        j = i+p;
        s = T(i,j)*(F(j,j)-F(i,i));
        for k=i+1:j-1
            s = s + T(i,k)*F(k,j) - F(i,k)*T(k,j);
        end
        F(i,j) = s/(T(j,j) - T(i,i));
    end
end
% f(A) = Q*F*T)*Q'
F = real(Q*F*Q');
 