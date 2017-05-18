  function y = DCT(x)
% function y = DCT(x)
% Discrete cosine transform
% GVL4: Algorithm 1.4.3.
% x is a column m-vector and y is its discrete cosine transform.
m = length(x)-1;
x_cos = [x;x(m:-1:2)];
ybar = fft(x_cos);
y = real(ybar(1:m+1))/2;
