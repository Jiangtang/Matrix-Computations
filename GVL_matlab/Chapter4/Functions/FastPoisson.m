  function u = FastPoisson(n1,type1,n2,type2,b)
% function u = FastPoisson(n1,type1,n2,type2,b)
% Fast Poisson solver that can handle Dirichlet(D) and Neumann(N) boundary
%    conditions
% n1 = positive integer
% type1 = 'DD', 'DN', 'ND', 'NN'
% n2 = positive integer
% type2 = 'DD', 'DN', 'ND', 'NN'
% b (n1*n2x1)
% u (n1*n2x1) solves Au = b where A = kron(In2,T1) + kron(T2,In1) where
%
%   T1 = T_{n1}^{DD}, T_{n1}^{DN}, T_{n1}^{ND}, T_{n1}^{NN} according to type1 
% and
%   T2 = T_{n2}^{DD}, T_{n2}^{DN}, T_{n2}^{ND}, T_{n2}^{NN} according to type2
% GVL4: Section 4.8.

lambda = FastEig(n1,type1);
mu     = FastEig(n2,type2);
B = reshape(b,n1,n2);
B = FastSolve(FastSolve(B,type1)',type2)';
U = B./(lambda*ones(1,n2) + ones(n1,1)*mu');
U = FastProd(FastProd(U,type1)',type2)';
u = reshape(U,n1*n2,1);
           
  function e = FastEig(n,type)
% function e = FastEig(n,type)
% n is a positive integer and type = 'DD', 'DN', 'ND', or 'NN'.
% e is the column n-vector of eigenvalues of T_{n}^{DD},
%    T_{n}^{DN}, T_{n}^{ND}, T_{n}^{NN} accordingly.
% GVL4: Section 4.8.
if strcmp(type,'DD')
    e = 4*sin((1:n)'*pi/(2*(n+1))).^2;
elseif strcmp(type,'DN')
    e = 4*sin((2*(1:n)'-1)*pi/(4*n)).^2;
elseif strcmp(type,'ND')
    e = 4*sin((2*(1:n)'-1)*pi/(4*n)).^2;
elseif strcmp(type,'NN')
    e = 4*sin(((1:n)'-1)*pi/(2*(n-1))).^2;
end

  function B = FastProd(A,type)
% function B = FastProd(A,type)
% A is nxm
% type = 'DD', 'DN', 'ND', or 'NN'.
% Let V be the eigenvector matrix of T_{n}^{DN}, T_{n}^{DN}, T_{n}^{ND}, 
%   or T_{n}^{NN} accordingly. Then B = V*A
% GVL4: Section 4.8.
[n,m] = size(A);
B = zeros(n,m);
if strcmp(type,'DD')
    for j=1:m
        B(:,j) = DST(A(:,j));
    end   
elseif strcmp(type,'DN')
    for j=1:m
        B(:,j) = DST2(A(:,j));
    end 
elseif strcmp(type,'ND')
    for j=1:m
        B(n:-1:1,j) = DST2(A(:,j));
    end 
elseif strcmp(type,'NN')
    for j=1:m
        B(:,j) = DCT(A(:,j));
    end 
end

  function B = FastSolve(A,type)
% function B = FastSolve(A,type)
% A is nxm
% type = 'DD', 'DN', 'ND', or 'NN'.
% Let V be the eigenvector matrix of T_{n}^{DN}, T_{n}^{DN}, T_{n}^{ND}, 
%   or T_{n}^{NN} accordingly. Then B = V\A
% GVL4: Section 4.8.
[n,m] = size(A);
B = zeros(n,m);
if strcmp(type,'DD')
    for j=1:m
        B(:,j) = DST(A(:,j))*(2/(n+1));
    end   
elseif strcmp(type,'DN')
    for j=1:m
        B(:,j) = IDST2(A(:,j));
    end 
elseif strcmp(type,'ND')
    for j=1:m
        B(:,j) = IDST2(A(n:-1:1,j));
    end 
elseif strcmp(type,'NN')
    for j=1:m
        B(:,j) = DCT(A(:,j))*(2/(n-1));
    end 
end

  function y = DST(x)
% function y = DST(x)
% x is a column vector and y is its discrete sine transform.
% GVL4: Algorithm 1.4.2.
m = length(x)+1;
x_sin = [0;x;0;-x(m-1:-1:1)];
ybar = fft(x_sin);
y = -imag(ybar(2:m))/2; 

  function y = DCT(x)
% function y = DCT(x)
% x is a column m-vector and y is its discrete cosine transform
% GVL4: Algorithm 1.4.3. 
m = length(x)-1;
x_cos = [x;x(m:-1:2)];
ybar = fft(x_cos);
y = real(ybar(1:m+1))/2;

  function y = DST2(x)
% function y = DST2(x)
% x is a column m-vector and y is its discrete sine-II transform.
% GVL4: Section 4.8. For details, see CVL's  "Computational Frameworks for 
% the FFT", Section 4.4.8.
m = length(x);
y = zeros(m,1);
omega = exp(-2*pi*sqrt(-1)/(4*m));
f = fft([x(1:2:m);-x(m:-2:2)]);
for k=1:m-1
    y(k) = -imag(omega^k*f(k+1));
end
y(m) = sum(x(1:2:m))-sum(x(2:2:m));
    

  function x = IDST2(y)
% function x = IDST2(y)
% y is a column m-vector and x is its inverse discrete sine-II transform.
% GVL4: Section 4.8. For details, see CVL's  "Computational Frameworks for 
% the FFT", Section 4.4.8.
m = length(y);
x = zeros(m,1);
omega = exp(-2*pi*sqrt(-1)/(4*m));
p = m/2;
f = zeros(m,1);
f(1) = y(m);
for k=1:m-1
    f(k+1) = conj(omega^k)*(y(m-k) - sqrt(-1)*y(k));
end
u = real(fft(conj(f))/m);
x(1:2:m) = u(1:p);
x(2:2:m) = -u(m:-1:p+1);