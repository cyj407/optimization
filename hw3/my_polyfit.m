% problem_3
x=[0, 1, 2.2, 3, 4.1, 5.2, 5.9, 6.8, 8.1, 8.7, 9.2, 11, 12.4, 14.1, 15.2, 16.8, 18.7, 19.9];
y=[30, 27, 29, 30, 37.3, 36.4, 32.4, 28.5, 30, 34.1, 39, 36, 32, 28, 22, 20, 27, 40];
plot(x, y, 'ko');   hold on
% xlim([14 20]);

n = length(x);
l_bound = 10;   % lowest order to show
k = 15;         % highest order to show
X = ones(1,n).';
color = jet(6);     
j = 1;          % count shown function
txt = cell(k-l_bound+1,1);
txt{1} = sprintf('data set');
for i = 1:k
    X = [X x(:).^i];        % 18*(i+1)
    A = (transpose(X)*X)^(-1)*transpose(X)*transpose(y);   % (i+1)*1    
    f = @(a) a.^(0:i) * A;

    a = 0:0.01:19.9;
    if(i >= l_bound)
        plot(a, f(a(:)), 'color', color(j,:), 'LineWidth', 1.5);
        j = j+1;
        txt{j}= sprintf('k = %i',i);
    end
end
legend(txt,'Location','northwest');