  function ShowFig9_3_1()
% function ShowFig9_3_1()
% Transient behavior of exp(At)
% GVL4: Section 9.3.2
A = [-1 100 ; 0 -1];
N = 200; z = zeros(1,N); t = linspace(0,10,N);
for k=1:N
    z(k) = norm(expm(t(k)*A));
end
plot(t,z)
xlabel('t','fontsize',14)
ylabel('|| exp(At ||','fontsize',14)
title('GVL4: Figure 9.3.1 with A = [-1 1000; 0 -1]','fontsize',14)
set(gcf,'position',[200 200 800 600])
shg