  function ShowSVdistribution()
% function ShowSVdistribution()
% Illustrates different distributions of singular values.

close all
A = GALLERY('randsvd', [500,100],10^6,3);
sv = svd(A);
figure
semilogy(sv)
title('Geometrically Distributed Singular Values','Fontsize',14)
xlabel(sprintf('A = gallery(''randsvd'', [500,100],10^6,3)'),'Fontsize',14)
shg
pause(1)

A = gallery('randsvd', [500,100],10^6,4);
sv = svd(A);
figure
semilogy(sv)
title('Arithmetically Distributed Singular Values','Fontsize',14)
xlabel(sprintf('A = gallery(''randsvd'', [500,100],10^6,4)'),'Fontsize',14)
shg
pause(1)

A = gallery('randsvd', [500,100],10^6,5);
sv = svd(A);
figure
semilogy(sv)
title('Random singular values with uniformly distributed logarithm','Fontsize',14)
xlabel(sprintf('A = gallery(''randsvd'', [500,100],10^6,5)'),'Fontsize',14)
shg