function I = incidence(E)
% INCIDENCE(E) is the incidence matrix corresponding to the list 
% of edges in the 2 by n matrix E. 
[m,n] = size(E);
if m ~= 2, error('Requires a matrix with exactly two rows'), end
F = sort(reshape(E,1,2*n));
V = [F(1)];
for i = 2:length(F)
    if F(i) > F(i-1)
        V = [V,F(i)];
    end
end
I = zeros(length(V),n);
for i = 1:n
    I(find(V==E(1,i)),i) = -1;
    I(find(V==E(2,i)),i) =  1;
end
