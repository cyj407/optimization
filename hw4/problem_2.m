clear
% question 2
n = 2;
A = [11.5 92.5 44.3 98.1 20.1 6.1 45.5 31.0 44.3];
M = [4 33 31];
d = [0.0298 0.044 0.044 0.0138 0.0329 0.0329 0.0279 0.025 0.025 0.0619 0.0317 0.0368];
tmp = num2cell(d);
[d1,d2,d3a,d3k,d4,d5k,d5h,d6,d7k,d7h,d8,d9] = deal(tmp{:});

% min Z
Z = @(F) (F(1)/A(1))^2+(F(2)/A(2))^2+(F(3)/A(3))^2+(F(4)/A(4))^2+(F(5)/A(5))^2+(F(6)/A(6))^2+(F(7)/A(7))^2+(F(8)/A(8))^2+(F(9)/A(9))^2; 

% constraints
% f1 = d1*F(1)-d2*F(2)-d3a*F(3) = M(1)
% f2 = -d3k*F(3)+d4*F(4)+d5k*F(5)-d6*F(6)-d7k*F(7) = M(2) 
% f3 = d5h*F(5)-d7h*F(7)+d8*F(8)-d9*F(9) = M(3)
f1 = [d1 -d2 -d3a 0 0 0 0 0 0];
f2 = [0 0 -d3k d4 d5k -d6 -d7k 0 0];
f3 = [0 0 0 0 d5h 0 -d7h d8 -d9];
% Aeq * F = beq
Aeq = [f1;f2;f3];
beq = M.';
x0 = zeros(1, numel(A));
lb = zeros(1, numel(A));        % F(:) >= 0
[Force,z] = fmincon(Z, x0, [], [], Aeq, beq, lb);

fprintf('Minimize Z with f1, f2, f3 three constraints, get answers:\n');
fprintf('F1= %.1f, F2= %.1f, F3= %.1f, F4= %.1f, F5= %.1f, F6= %.1f, F7= %.1f, F8= %.1f, F9= %.1f, Z = %.1f\n', Force(:), z);