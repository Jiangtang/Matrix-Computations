  function u = SlowPoisson(n1,type1,n2,type2,b)
% function u = SlowPoisson(n1,type1,n2,type2,b)
% A slow, kronecker product-based Poisson solver
% that can handle Dirichlet(D) and Neumann(N) boundary conditions.
% n1 = positive integer
% type1 = 'DD', 'DN', 'ND', 'NN'
% n2 = positive integer
% type2 = 'DD', 'DN', 'ND', 'NN'
% b (n1*n2x1)
% u (n1*n2x1) solves Au = b where A = kron(In2,T1) + kron(T2,In1) where
%
%   T1 = T_{n1}^{DD}, T_{n1}^{DN}, T_{n1}^{ND}, T_{n1}^{NN} according to type1 
% and
%   T2 = T_{n2}^{DD}, T_{n2}^{DN}, T_{n2}^{ND}, T_{n2}^{NN} according to type2
% GVL4: Section 4.8.

In1 = eye(n1,n1);
Tn1 = MakeTrid(n1,type1);
In2 = eye(n2,n2);
Tn2 = MakeTrid(n2,type2);
u = (kron(In2,Tn1) + kron(Tn2,In1))\b;

  function T = MakeTrid(n,type)
% function T = MakeTrid(n,type)
% n is a positive integer and type = 'DD', 'DN', 'ND', or 'NN'.
% Generates T_{n}^{DD}, T_{n}^{DN}, T_{n}^{ND}, T_{n}^{NN} accordingly.
% GVL4: Section 4.8.
T = 2*eye(n,n);
for k=1:n-1
   T(k+1,k) = -1; T(k,k+1) = -1;
end
if strcmp(type,'DN')
   T(n,n-1) = -2;
elseif strcmp(type,'ND')
   T(1,2) = -2;
elseif strcmp(type,'NN')
   T(1,2) = -2; T(n,n-1) = -2;
end