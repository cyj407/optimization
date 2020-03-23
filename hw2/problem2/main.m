% Problem 2
% Univariate method
%Try to transform n-dimensional search to 1-dimensional search  
clear
eps = 1e-11;
global  X FUNC S ndim
ndim = 2;
X=[1;1];%starting point. You can start from a different point
FUNC=@myfunc;
l_bound = -2;
r_bound = 5;
prev_x = [0;0];

figure (1); hold on
while(abs(myfunc(X) - myfunc(prev_x)) > eps)    
    S=[1;0];
    [lambda,fMin] = goldSearch(@fLine, l_bound, r_bound); 
    prev_x = X;
    X=X+lambda*S;   % the next point
    plot([prev_x(1);X(1)], [prev_x(2);X(2)], 'b');
    
    S=[0;1];
    [lambda,fMin] = goldSearch(@fLine, l_bound, r_bound); 
    prev_x = X;
    X=X+lambda*S;   % the next point
    plot([prev_x(1);X(1)], [prev_x(2);X(2)], 'b');
end
plot(X(1), X(2), 'r*');
fprintf('From the Univariate Method,\n');
fprintf('When x = %.6f, has the local minimum = %.6f\n', X(1), X(2));
title(['P1=(1,1) use Univariate method to find (',num2str(X(1)),',', num2str(X(2)),')']);



clear
eps = 1e-11;
global  X FUNC S ndim
ndim = 2;
X=[1;1];%starting point. You can start from a different point
FUNC=@myfunc;
l_bound = -5;
r_bound = 2;
prev_x = [0;0];

figure (2); hold on
while(abs(myfunc(X) - myfunc(prev_x)) > eps)    
    S=[1;0];
    [lambda,fMin] = goldSearch(@fLine, l_bound, r_bound);
    prev_x = X;
    X=X+lambda*S;   % the next point
    plot([prev_x(1);X(1)], [prev_x(2);X(2)], 'b');
    
    S=[0;1];
    [lambda,fMin] = goldSearch(@fLine, l_bound, r_bound); 
    prev_x = X;
    X=X+lambda*S;   % the next point
    plot([prev_x(1);X(1)], [prev_x(2);X(2)], 'b');
end
plot(X(1), X(2), 'r*');
fprintf('From the Univariate Method,\n');
fprintf('When x = %.6f, has the local minimum = %.6f\n', X(1), X(2));
title(['P1=(1,1) use Univariate method to find (',num2str(X(1)),',', num2str(X(2)),')']);





