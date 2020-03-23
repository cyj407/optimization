clear
% question 2
px=[0, 1, 2.2, 3, 4.1, 5.2, 5.9, 6.8, 8.1, 8.7, 9.2, 11, 12.4, 14.1, 15.2, 16.8, 18.7, 19.9];
py=[30, 27, 29, 30, 37.3, 36.4, 32.4, 28.5, 30, 34.1, 39, 36, 32, 28, 22, 20, 27, 40];

% Fletcher-Reeves algorithm
fprintf('Use Fletcher-Reeves algorithm,\n');
% linear regression
syms a b
F = sum( (a*px(:)+b - py(:)).^2 );
f = @(X) sum( (X(1)*px(:)+X(2) - py(:)).^2 );
B = fletcherReeves(F,f,px,py,2);
fprintf('By the linear regression model, assume y=mx+b,\n');
fprintf('can find the equation y=%.6fx+%.6f, where m = %.6f, b = %.6f\n', B(1), B(2), B(1), B(2));
% quadratic regression
syms a b c
F = sum( (a*(px(:)).^2+b*px(:)+c - py(:)).^2 );
f = @(X) sum( (X(1)*(px(:)).^2+X(2)*px(:)+X(3) - py(:)).^2 );
B = fletcherReeves(F,f,px,py,3);
fprintf('By the quadratic regression model, assume y=a0x^2+a1x+a2,\n');
fprintf('can find the equation y=%.6fx^2+%.6fx+%.6f, where a0 = %.6f, a1 = %.6f, a2 = %.6f\n',B(1),B(2),B(3),B(1),B(2),B(3));

% DFP method
fprintf('\nUse DFP method,\n');
% linear regression
syms a b
F = sum( (a*px(:)+b - py(:)).^2 );
f = @(X) sum( (X(1)*px(:)+X(2) - py(:)).^2 );
B = DFP(F,f,px,py,2);
fprintf('By the linear regression model, assume y=mx+b,\n');
fprintf('can find the equation y=%.6fx+%.6f, where m = %.6f, b = %.6f\n', B(1), B(2), B(1), B(2));
% quadratic regression
syms a b c
F = sum( (a*(px(:)).^2+b*px(:)+c - py(:)).^2 );
f = @(X) sum( (X(1)*(px(:)).^2+X(2)*px(:)+X(3) - py(:)).^2 );
B = DFP(F,f,px,py,3);
fprintf('By the quadratic regression model, assume y=a0x^2+a1x+a2,\n');
fprintf('can find the equation y=%.6fx^2+%.6fx+%.6f, where a0 = %.6f, a1 = %.6f, a2 = %.6f\n',B(1),B(2),B(3),B(1),B(2),B(3));