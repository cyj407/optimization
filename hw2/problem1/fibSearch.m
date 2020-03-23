function [ xMin, fMin] = fibSearch(f, l_bound, r_bound, tol) 

eps = 10^(-6);
if nargin <4 
    tol=10^(-6); 
end

% create the fibonacci sequence
fib = [1 2];
for i=3:100
    fib(i) = fib(i-1) + fib(i-2);
end

a(1) = l_bound;
b(1) = r_bound;
n = 1;  Fn = 1;
% initial step
while(Fn <= (b(1)-a(1))/tol)
    n = n+1;
    Fn = fib(n);
end

a = zeros(1, n);
b = zeros(1, n);
lambda = zeros(1, n);
mu = zeros(1, n);

a(1) = l_bound;
b(1) = r_bound;
lambda(1) = a(1) + (fib(n-2)/Fn) * (b(1)-a(1));
mu(1) = a(1) + (fib(n-1)/Fn) * (b(1)-a(1));
k = 1;

% main step
while (k < n-1)
    tmpx = (a(k)+b(k))/2;
    plot(tmpx, tmpx*tmpx*cos(tmpx), 'b.');
    
    if(f(lambda(k)) > f(mu(k)))      % step 2
        a(k+1) = lambda(k);
        b(k+1) = b(k);
        lambda(k+1) = mu(k);
        mu(k+1) = a(k+1) + (fib(n-k-1)/fib(n-k)) * (b(k+1)-a(k+1));
    else                     % step 3
        a(k+1) = a(k);
        b(k+1) = mu(k);
        mu(k+1) = lambda(k);
        if(n-k-2 <= 0)
            lambda(k+1) = a(k+1) + (1/fib(n-k)) * (b(k+1)-a(k+1));
        else
            lambda(k+1) = a(k+1) + (fib(n-k-2)/fib(n-k)) * (b(k+1)-a(k+1));
        end
    end
    k = k+1;
end

% step 5
lambda(n) = lambda(n-1);
mu(n) = lambda(n-1) + eps;
if(f(lambda(n)) > f(mu(n)))
    a(n) = lambda(n);
    b(n) = b(n-1);
else
    a(n) = a(n-1);
    b(n) = mu(n);
end

xMin = (a(n)+b(n))/2;
fMin = xMin*xMin*cos(xMin);

end