  function [c,s] = Givens(a,b)
% function [c,s] = Givens(a,b)
% Givens rotation computation
% Determines cosine-sine pair (c,s) so that [c s;-s c]'*[a;b] = [r;0]
% GVL4: Algorithm 5.1.3
if b==0
    c = 1; s = 0;
else
    if abs(b)>abs(a)
        tau = -a/b; s = 1/sqrt(1+tau^2); c = s*tau;
    else
        tau = -b/a; c = 1/sqrt(1+tau^2); s = c*tau;
    end
end
