  function [L,U,piv] = OuterLU_PP6(A)
% function [L,U,piv] = OuterLU_PP(A)
% Outer product LU with partial pivoting in 6-digit FP arithmetic
% A is nxn in 6-digit FP format.
% L is nxn, unit lower triangular, and in 6-digit FP format.
% U is nxn, upper triangular, and in 6-digit FP format.
% piv(1:n-1) houses the pivot row indices
% PA = LU where P = P_{n-1}...P_{1} and P_{k} is the identity with
% rows k and piv(k) interchanged.
% GVL4: Algorithm 3.4.1
[n,n] = size(A);
piv = 1:n-1;
for k=1:n-1
    % Scan |A(k:n,k)| for its largest value and permute...
    [m,mu] = max(abs(Value6(A(k:n,k)))); 
    mu = k-1+mu; 
    piv(k) = mu; 
    A([k mu],:) = A([mu k],:);
    % Update...
    if Value6(A(k,k))~=0
       rho = k+1:n;
       % Compute L(k+1:n,k)...
       A(rho,k) = Div6(A(rho,k),A(k,k));
       % The outer product update...
       A(rho,rho) = OuterProd6(A(rho,rho),A(rho,k),A(k,rho));
    end
end
L = eye6(n,n);
for i=1:n
    for j=1:i-1
       L(i,j) = A(i,j);
    end
end
U = zeros6(n,n);
for i=1:n
    for j=i:n
        U(i,j) = A(i,j);
    end
end

  function B1 = OuterProd6(B,v,w)
% Outer product update using fl6 arithmetic.
% B is a pxp fl6 matrix and u and v are fl6 p-vectors.
% B1 = B - uv' obtained using fl6 arithmetic.
[p,p] = size(B);
for i=1:p
    for j=1:p
        B1(i,j) = Sub6(B(i,j),Mult6(v(i),w(j)));
    end
end