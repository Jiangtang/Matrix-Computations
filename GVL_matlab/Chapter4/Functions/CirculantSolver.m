  function x = CirculantSolver(z,y)
% function x = CirculantSolver(z,y)
% Solution of a complex circulant system.
% z is nx1 complex
% y is nx1 complex
% x is nx1 and solves the circulant system C(z)x = y
% GVL4: Algorithm 4.8.1
n = length(z);
c = conj(fft(conj(y)));
d = conj(fft(conj(z)));
w = c./d;
x = fft(w)/n;