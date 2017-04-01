  function alfa = DistSubspaces(A,B)
% function alfa = DistSubspaces(A,B)
% alfa is the distance between ran(A) and ran(B)
% GVL4: Section 6.4.3
[d,F,G] = PrinAngles(A,B);
alfa = sqrt(1-min(d)^2);