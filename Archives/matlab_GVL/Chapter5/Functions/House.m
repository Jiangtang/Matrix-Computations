  function [v,beta] = House(x)
% function [v,beta] = house(x)
% Householder vector computation
% x is a column m-vector.
% v is a column m-vector with v(1) = 1 and beta is a scalar such
% that P = I - beta*v*v' is orthogonal and Px = norm(x)*e1.
% GVL4: Algorithm 5.1.1
m = length(x);
if m>1
sigma = x(2:m)'*x(2:m); 
v = [1;x(2:m)];
if sigma==0 && x(1)>=0
    beta = 0;
elseif sigma==0 && x(1)<0
    beta = -2;
else
    mu = sqrt(sigma + x(1)^2);
    if x(1)<0
        v(1) = x(1) - mu;
    else
        v(1) = -sigma/(x(1)+mu);
    end
    beta = 2*v(1)^2/(sigma+v(1)^2);
    v = v/v(1);
end
else
    v = 0; beta = 0;
end
