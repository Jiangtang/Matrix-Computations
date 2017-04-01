  function Show2x2SVD()
% function Show2x2SVD()
% Shows the SVD connection to the 2x2 matrix-vector product y = Ax where
% A is 2x2 and x is a unit vector.
% GVL4: Section 2.4.2
for eg=1:5
   A = randn(2,2);
   A = A/norm(A);
   [U,S,V] = svd(A);
 % Display the unit circle and the right singular vectors V(:,1) and
 % V(:,2)...
   subplot(1,2,1)
   theta = linspace(0,2*pi,200);
   c = cos(theta);
   s = sin(theta);
   fill(c,s,'y','linewidth',2)
   hold on
   plot([-1.2 1.2],[0 0],':k',[0 0],[-1.2,1.2],':k')
   plot([0;V(1,1)],[0;V(2,1)],'r','linewidth',3)
   plot(V(1,1),V(2,1),'.r','Markersize',25)
   plot([0;V(1,2)],[0;V(2,2)],'k','linewidth',3)
   plot(V(1,2),V(2,2),'.k','Markersize',25)
   text(-1.3,-1.6,'V(:,1) ------o','Color','r','fontsize',20)
   text(0,-1.6,'V(:,2) ------o','Color','k','fontsize',20)
   hold off
   axis equal off
   title('Unit Vectors','fontsize',24)
   % Display the range-space ellipse  and the vectors 
   % AV(:,1) = S(1,1)U(:,1) and AV(:,2)= S(2,2)U(:,2).
   subplot(1,2,2)
   theta = linspace(0,2*pi,200);
   Z = A*[cos(theta);sin(theta)];
   fill(Z(1,:),Z(2,:),'y','linewidth',2)
   sig1 = S(1,1);
   sig2 = S(2,2);
   hold on
   plot([-1.2 1.2],[0 0],':k',[0 0],[-1.2,1.2],':k')
   plot([0;sig1*U(1,1)],[0;sig1*U(2,1)],'r','linewidth',3)
   plot(sig1*U(1,1),sig1*U(2,1),'.r','Markersize',25)
   plot([0;sig2*U(1,2)],[0;sig2*U(2,2)],'k','linewidth',3)
   plot(sig2*U(1,2),sig2*U(2,2),'.k','Markersize',25)
   text(-1.4,-1.6,'sig1*U(:,1) ------o','Color','r','fontsize',20)
   text(.4,-1.6,'sig2*U(:,2) ------o','Color','k','fontsize',20)
   % Display A...
   text(-.8,1.5,'A = ','fontsize',18)
   text(-.4,1.6, sprintf('%6.3f   ',A(1,:)),'fontsize',18)
   text(-.4,1.4, sprintf('%6.3f   ',A(2,:)),'fontsize',18)
   hold off
   axis equal off
   set(gcf,'position',[300 200 1200 800])
   title('What A does to Unit Vectors','fontsize',24)
   shg
   pause(2)
end