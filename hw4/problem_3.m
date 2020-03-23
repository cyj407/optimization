clear
% question 3
% max F --> min -(F)
F = @(x) -(3*x(1)+x(2)+3*x(3));
% x4 = 2, x5 = 5, x6 = 6, x1 = x2 = x3 = 0
% constraints
% f1: 2x1+x2+x3 <= 2 -->    2*x1+x2+x3+ s1 == 2 
% f2: x1+2x2+3x3 <= 5 -->   x1+2*x3+3*x3 + s2 == 5
% f3: 2x1+2x2+x3 <= 6 -->   2*x1+2*x2+x3+ s3 == 6
% x(:) >= 0, s(:) >= 0

% simplex method
% f = [x1_coef x2_coef x3_coef x4_coef x5_coef x6_coef RHS]
f1 = [2 1 1 1 0 0 2];
f2 = [1 2 3 0 1 0 5];
f3 = [2 2 1 0 0 1 6];
cost_f = [-3 -1 -3 0 0 0 0];
table = [f1;f2;f3;cost_f];
order = [4 5 6 1 2 3];      % x4 x5 x6 x1 x2 x3
                            % 2  5  6  0   0  0
while(min(cost_f) < 0) 
    tmp = find(cost_f == min(cost_f));      % get smallest negative i -> pivot column
    i = tmp(1);
    ratio = [f1(7)/f1(i) f2(7)/f2(i) f3(7)/f3(i)];
    % get the pivot
    pivot_v = -1;
    for j = 1:3
        if(ratio(j) < 0)
            continue;
        end
        if(pivot_v == -1 || ratio(j) < pivot_v)
           pivot_v = ratio(j);
           pivot_i = j;
        end
    end
    pivot = table(pivot_i, i);
    table(pivot_i,:) = table(pivot_i, :)/pivot;     % make the pivot row coefficent == 1
    % Gauss-Jordan
    mul = table(:, i);
    for j = 1:4
        if(j ~= pivot_i)
            table(j, :) = table(j,:) - mul(j)*table(pivot_i, :);
        end
    end
    % exchange the order
    idx = find(i == order);
    change = order(pivot_i);
    order(pivot_i) = i;
    order(idx) = change;
    % update every equation
    f1 = table(1,:);
    f2 = table(2,:);
    f3 = table(3,:);
    cost_f = table(4,:);
end
ans = [f1(7) f2(7) f3(7) 0 0 0];
X(order(:)) = ans(:);
maxf = -F(X(1:3));
fprintf('From simplex method,\n');
fprintf('when x1 = %.1f, x2 = %.1f, x3 = %.1f, maximize value = %.1f\n', X(1:3), maxf);


% non-linear programming
% A * x = b
A = [2 1 1;1 2 3;2 2 1];
b = [2;5;6];
x0 = zeros(1, 3);
lb = zeros(1, 3);        % F(:) >= 0
[xmin,fmin] = fmincon(F, x0, A, b, [], [], lb);
fmin = -fmin;

fprintf('Use a nonlinear programming method, and get answers:\n');
fprintf('X1 = %.1f, X2 = %.1f, X3 = %.1f, F = %.1f\n', xmin(:), fmin);









