x=[0, 1, 2.2, 3, 4.1, 5.2, 5.9, 6.8, 8.1, 8.7, 9.2, 11, 12.4, 14.1, 15.2, 16.8, 18.7, 19.9];
y=[30, 27, 29, 30, 37.3, 36.4, 32.4, 28.5, 30, 34.1, 39, 36, 32, 28, 22, 20, 27, 40];
figure (1); hold on
plot(x, y, 'ko');

degree = 11;
txt = cell(2, 1);
txt{1} = sprintf('data set');
f = polyfit(x, y, degree);
% a = 0:0.01:19.9;
% plot(a, polyval(f, a),'r','LineWidth', 1.5);

syms a
p = vpa(poly2sym(f,a)) + sin(1.45*a)+cos(1.5*a)+0.3

a = 0:0.01:19.9;
plot(a, subs(p), 'b','LineWidth', 1.5);
% txt{2}= sprintf('degree = %i',degree);
txt{2}= sprintf('self-defined model');

legend(txt,'Location','southwest');