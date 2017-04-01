  function ShowUnshiftedQR()
% function ShowUnshiftedQR()
% Illustrates the unshifted QR algorithm applied to the upper Hessenberg
% matrix. A Call of the form ShowUnshiftedQR() uses a random 5x5 
% example.
% GVL4: Section 7.3.3

n = 5;
H0 = hess(randn(n,n));
H = H0;
Q = eye(n,n);
for k=1:100
    [H,Q] = HessQRStep(H,Q);
    if rem(k,10)==0
       clc
       fprintf('After %1d iterations H = \n',k)
       fprintfM_Sci('%10.6f',H)
       pause(1)
    end
end
fprintf('\nThe eigenvalues of H are\n\n')
disp(eig(H))
fprintf('\n||H - Q''*H0*Q|| = %10.3e\n',norm(H - Q'*H0*Q))


  function [H,Q] = HessQRStep(H0,Q0)
% function [H,Q] = HessQRStep(H)
% Hessenberg QR step without shift
% H0 is nxn and upper Hessenberg. 
% H is nxn and upper Hessenberg with the property that H = V'*H0*V
%   where H0 = V*R is the QR factorization of H0.
% Q0 is nxn and orthogonal and Q = Q0*V.
% GVL4: Algorithm 7.4.1

[n,n] = size(H0);
H = H0;
Q = Q0;
for k=1:n-1
    [c(k),s(k)] = Givens(H(k,k),H(k+1,k));
    H(k:k+1,k:n) = [c(k) s(k); -s(k) c(k)]'*H(k:k+1,k:n);
    if nargin==2
        Q(:,k:k+1) = Q(:,k:k+1)*[c(k) s(k); -s(k) c(k)];
    end
end
for k=1:n-1
    H(1:k+1,k:k+1) = H(1:k+1,k:k+1)*[c(k) s(k); -s(k) c(k)];
end