% Problem 3
% Powell's conjugate direction method
%Try to transform n-dimensional search to 1-dimensional search  
clear
eps = 10^(-17);
global X FUNC S ndim
ndim = 2;
X=[1;0];%starting point. You can start from a different point
FUNC=@myfunc;

% set up S1 to Sn
v = ones(1,ndim);
Sn = diag(v);

prev_x = X;
l_bound = -5;
r_bound = 5;
j = 0;

figure (1); hold on
S = Sn(:, ndim);
[lambda,fMin] = goldSearch(@fLine, l_bound, r_bound); 
X = X + lambda*S;   

isFinished = 0;
while(isFinished ~= 1)
    Z = X;
    i = 1;
    for i=1:ndim
        S = Sn(:, i);
        [lambda,fMin] = goldSearch(@fLine, l_bound, r_bound);
        prev_x = X;
        X=X+lambda*S;   % the next point
        plot([prev_x(1);X(1)], [prev_x(2);X(2)], 'b');
        
        if(abs(myfunc(prev_x)-myfunc(X)) < eps)
            isFinished = 1;
            break;
        end
    end
    if(isFinished == 0)
        S = X-Z;
        [lambda,fMin] = goldSearch(@fLine, l_bound, r_bound);
        %prev_x = X;
        X = X + lambda*S;
        plot([prev_x(1);X(1)], [prev_x(2);X(2)], 'b');
        if(abs(myfunc(prev_x) - myfunc(X)) < eps)
            isFinished = 1;
        else
            Sn(:, mod(j,ndim)+1 ) = S;
        end
    end
    j = j+1;
end
plot(X(1), X(2), 'r*');
fprintf('From the Powell''s conjugate direction Method,\n');
fprintf('When x = %.6f, has the local maximum = %.6f\n', X(1), X(2));
title(['use Powell''s method to find (',num2str(X(1)),',', num2str(X(2)),')']);

clear
eps = 10^(-17);
global X FUNC S ndim
ndim = 2;
X=[-1;0];%starting point. You can start from a different point
FUNC=@myfunc;

% set up S1 to Sn
v = ones(1,ndim);
Sn = diag(v);

prev_x = X;
l_bound = -5;
r_bound = 5;
j = 0;

figure (2); hold on
S = Sn(:, ndim);
[lambda,fMin] = goldSearch(@fLine, l_bound, r_bound); 
X = X + lambda*S;   

isFinished = 0;
while(isFinished ~= 1)
    Z = X;
    i = 1;
    for i=1:ndim
        S = Sn(:, i);
        [lambda,fMin] = goldSearch(@fLine, l_bound, r_bound);
        prev_x = X;
        X=X+lambda*S;   % the next point
        plot([prev_x(1);X(1)], [prev_x(2);X(2)], 'b');
        
        if(abs(myfunc(prev_x)-myfunc(X)) < eps)
            isFinished = 1;
            break;
        end
    end
    if(isFinished == 0)
        S = X-Z;
        [lambda,fMin] = goldSearch(@fLine, l_bound, r_bound);
        prev_x = X;
        X = X + lambda*S;
        plot([prev_x(1);X(1)], [prev_x(2);X(2)], 'b');
        if(abs(myfunc(prev_x) - myfunc(X)) < eps)
            isFinished = 1;
        else
            Sn(:, mod(j,ndim)+1 ) = S;
        end
    end
    j = j+1;
end
plot(X(1), X(2), 'r*');
fprintf('From the Powell''s conjugate direction Method,\n');
fprintf('When x = %.6f, has the local maximum = %.6f\n', X(1), X(2));
title(['use Univariate method to find (',num2str(X(1)),',', num2str(X(2)),')']);
