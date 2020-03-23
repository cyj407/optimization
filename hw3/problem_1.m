% question 1
x=[0, 1, 2.2, 3, 4.1, 5.2, 5.9, 6.8, 8.1, 8.7, 9.2, 11, 12.4, 14.1, 15.2, 16.8, 18.7, 19.9];
y=[30, 27, 29, 30, 37.3, 36.4, 32.4, 28.5, 30, 34.1, 39, 36, 32, 28, 22, 20, 27, 40];

% linear regression
% Y = mX + b
n = length(x);
sigma_x = sum(x);
sigma_y = sum(y);
sigma_xx = sum(x(:).^2);
sigma_xy = sum(x(:).*y(:));
m = (sigma_x*sigma_y - n*sigma_xy)/(sigma_x*sigma_x - n*sigma_xx);
b = (sigma_y - m* sigma_x)/n;
fprintf('By linear regression, assume y=mx+b,\n');
fprintf('can find the equation y=%.6fx+%.6f, where m = %.6f, b = %.6f\n',m,b,m,b);

% quadratic regression
% Y = A0 + A1*X + A2*X.^2
X = [ones(1,n).' x(:), x(:).^2];
A = inv(transpose(X)*X)*transpose(X)*transpose(y);
fprintf('By quadratic regression, assume y=a0x^2+a1x+a2,\n');
fprintf('can find the equation y=%.6fx^2+%.6fx+%.6f, where a0 = %.6f, a1 = %.6f, a2 = %.6f\n',A(3),A(2),A(1),A(3),A(2),A(1));