  function v = PerfShuff(p,r)
% function v = PerfShuff(p,r)
% Vector representation of the perfect shuffle permutation.
% GVL4: Setion 1.2.11
% p and r are positive integers. If n = pr then v is a length-n row
%   vector with the property that if x is a column n-vector and
%   y = x(v), then y = I(v,:)*x = P_{p,r}* x is the mod-p perfect shuffle
%   of x.
n = p*r;
v = [];
for k=1:r
    v = [v k:r:n];
end