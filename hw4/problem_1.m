clear
% question 1
% set circle radius = x
% max F --> min -(F)
% max area = circle area + rectangle area
F = @(x) -(0.5*pi*x.^2 + (2*x) .* ((10 - pi*x - 2*x)/2));

% x >= 0, 
% (10-pi*x-2*x)/2 >= 0 --> (pi+2)*x <= 10

% non-linear programming
% A * x = b
A = pi+2;
b = 10;
x0 = zeros(1, 1);
lb = zeros(1, 1);        % F(:) >= 0
X = fmincon(F, x0, A, b, [], [], lb);
f = F(X)*(-1);

fprintf('When the radius of the semicircle = %.6f, can get the maximum area = %.6f\n', X, f);