function morph(im1,im2,map,n,j,k)

% The command morph(im1,im2,cmap) will transpose 
% (or morph) a source image, im1, into 
% a target image, im2, in 100 steps. The two image 
% matrices must have the same dimensions and both 
% are displayed using the color map cmap.
%
% The morphing is accomplished by taking 
% convex combinations of the images.
% These images will flicker on the screen
% as the convex combinations are composed.
%
% A movie is then activated that shows
% the morphing from the source image to 
% the target image. The movie plays 
% at a rate of 24 frames per second.
% The movie simulates the continuous
% transformation of the source image 
% into the target image.
%
% If no third input argument is included, 
% the default color map is gray. The command 
%    morph(im1,im2,cmap,n,j,k)
% creates a movie with n frames,
% that morphs j times at a rate of
% k frames per second. If j>0, the
% morphing is one way from the source
% image to the target. If j<0, the
% morphing will be two way.
%
% The original program was written by
% Colm Mulcahy, 6/27/97 as part of an
% ATLAST lesson plan developed by
% Colm Mulcahy and Rick Elderkin.
% Modified by Steven Leon, 8/12/02

if nargin == 2
   map=gray;
end   
if nargin <4
    n=100;
end

if nargin < 5
    j=1;
end

if nargin < 6
    k=24;
end    

figure(1) 
imagesc(im1), colormap(map), axis off, axis image
title('Source Image')

%uncomment the following lines if you want to display
%a third window with the target image.
%figure(3) 
%imagesc(im2), colormap(map), axis off, axis image
%title('Target Image')

figure(2) 
imagesc(im1), colormap(map), axis off, axis image
title('Morphing Images')
pause(1)

M=moviein(n);   % Create movie with n frames
for i=1:n
    t=(i-1)/(n-1);
    imi=(t-1)*im1+t*im2;
    figure(2), imagesc(imi)
    axis off, axis image
    title('Morphing Images')
    M(:,i)=getframe;
end
movie(M,j,k)