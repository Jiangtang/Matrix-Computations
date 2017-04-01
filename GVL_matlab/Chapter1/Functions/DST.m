  function y = DST(x)
% function y = DST(x)
% Discrete sine transform.
% GVL4: Algorithm 1.4.2.
% x is a column n-vector and y is its discrete sine transform.
m = length(x)+1;
x_sin = [0;x;0;-x(m-1:-1:1)];
ybar = fft(x_sin);
y = -imag(ybar(2:m))/2;