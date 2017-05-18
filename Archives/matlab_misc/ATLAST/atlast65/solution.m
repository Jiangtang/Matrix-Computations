function x = solution(A,b)
% SOLUTION(A,b) uses the rref of [A,b] to find a solution x
% of Ax = b as one does by hand.
[R,jp] = rref([A,b]);
[m,n] = size(A);
r = length(jp);
if jp(r) == n+1
    x = [];
else
    x = zeros(n,1);
    x(jp) = R(1:r,n+1);
end
