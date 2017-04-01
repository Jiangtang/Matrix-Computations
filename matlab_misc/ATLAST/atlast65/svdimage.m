function svdimage(A,k,cmap,flag)
% SVDIMAGE(A) will display the image represented
% by the matrix A. It will then step through the svd
% approximations to the image (starting with the rank
% 1 approximation) each time the left mouse button is
% clicked in the figure window. The matrices U,S,V are
% the factors of the singular value decomposition of A.
% The rank k approximation to A is
%
%     U(:,1:k)*S(1:k,1:k)*V(:,1:k)'
%
% SVDIMAGE(A,k), k>0, will start with an approximation of
% the image using the first k terms of the outer product
% expansion of A based on its singular value decomposition.
%
% A colormap may be specified by using a third input argument,
% i.e., svdimage(A,1,hsv) will use the hsv colormap.
%
% To suppress the display of the original image until the end
% include a fourth input argument which may have any value.
%
% SVDIMAGE(A,0) is the same as IMAGE(A). It will display the original
% image.
%
% The parameters u,s,v are the factors of the singular value 
% decomposition of A.
%
% Developed by Larry Riddle, San Diego ATLAST workshop, June 1994.
% Modified by S. J. Leon, October 1995, May 1996, August 2002

[n,m] = size(A);
[u,s,v]=svd(A);
[r,c]=size(colormap);
last=min(m,n);
if nargin < 4, flag=0; else flag=1; end
if nargin <3, cmap=hsv; end
if nargin < 2, k=1; end                                   
if k>last
   error('Too many terms requested')
end
if k > 0
  clf                 
  if flag == 0
     subplot(1,2,1);
     image(A); axis('off');axis('image');
     colormap(cmap)
     title([int2str(n),'-by-',int2str(m),' image']);
  end
  subplot(1,2,1); 
  txt=text('Position',[n/3 1.3*m],'String','Type q to quit');
  axis('off');
  Approx=u(:,1:k)*s(1:k,1:k)*v(:,1:k)';
  subplot(1,2,2);
  image(Approx); axis('off');axis('image');
  colormap(cmap)
  title([int2str(k),' terms in approximation']);
  for i=k+1:last
     if i<=last
        text('Position',[1, 1.3*m],'String','Click mouse for next image'); 
     end
     [x,y,z]=ginput(1);
     if abs(z)=='q',break,close,end
     Approx=Approx+s(i,i)*u(:,i)*v(:,i)';
     subplot(1,2,2);
     image(Approx); axis('off');axis('image');
     title([int2str(i),' terms in approximation']);
  end
  if flag==1
     subplot(1,2,1);
     image(A); axis('off');axis('image');
     title([int2str(n),'-by-',int2str(m),' image']);
  end
  subplot(1,2,1);
  text('Position',[n/3, 1.5*m],'String','Done. Type any key to quit'); 
  %end                                   
if flag == 0 
   delete(txt)
end
if i==last 
   pause
end
close
else
  subplot(1,1,1);
  image(A); axis('off');axis('image');
  colormap(cmap);
  title([int2str(n),'-by-',int2str(m),' image']);
end


