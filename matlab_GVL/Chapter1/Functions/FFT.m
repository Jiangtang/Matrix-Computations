  function y = FFT(x)
% function y = FFT(x)
% Radix-2 fast Fourier transform
% GVL4: Algorithm 1.4.1
% x is a column vector whose length is a power of two.
% y is its discrete Fourier transform. 
n = length(x);
if round(log2(n))~=log2(n)
    error('n = length(x) must be a power of two.')
end
if n==1
    y = x;
else
    m = n/2;
    yT = FFT(x(1:2:n));
    yB = FFT(x(2:2:n));
    omega = exp(-2*pi*sqrt(-1)/n);
    d = (omega.^(0:m-1)).';
    z = d.*yB;
    y = [ yT+z ; yT-z];
end