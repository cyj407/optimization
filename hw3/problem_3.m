x=[0, 1, 2.2, 3, 4.1, 5.2, 5.9, 6.8, 8.1, 8.7, 9.2, 11, 12.4, 14.1, 15.2, 16.8, 18.7, 19.9];
y=[30, 27, 29, 30, 37.3, 36.4, 32.4, 28.5, 30, 34.1, 39, 36, 32, 28, 22, 20, 27, 40];
figure (1); hold on
plot(x, y, 'bo');

start = 10;
degree = 14;
txt = cell(degree-start+1, 1);
txt{1} = sprintf('data set');

for i = start:degree
    f = polyfit(x, y, i);
    a = 0:0.01:20;
    plot(a, polyval(f, a), 'LineWidth', 1.5);
    txt{i-start+2}= sprintf('degree = %i',i);
end
legend(txt,'Location','northwest');