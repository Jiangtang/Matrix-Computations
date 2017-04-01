function A=randstoc(n)
% The command A=randstoc(n) will generate a random
% nxn stochastic matrix.
A=rand(n);
A=A./(ones(n,1)*sum(A));
