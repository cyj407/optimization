% problem 1
f = @(x) x.^2.*cos(x);
f_ = @(x) (-1)*x.^2.*cos(x);
l_bound = 2;
r_bound = 12;
x = l_bound:0.01:r_bound;

% Golden Search mehthod
figure (1); hold on; plot(x, f(x), 'g');
[xMin fMin] = goldSearch(f, l_bound, r_bound);
figure (2); hold on; plot(x, f(x), 'g');
[xMax fMax] = goldSearch(f_, l_bound, r_bound);
fMax = f(xMax);

interval = 2.5;
for i=l_bound:interval:r_bound-1
    clear tmpx; clear tmpf;
    figure (1); hold on;
    [tmpx tmpf] = goldSearch(f, i, i+ interval);
    if(tmpf < fMin)
        fMin = f(tmpx);
        xMin = tmpx;
    end
    
    clear tmpx; clear tmpf;
    figure (2); hold on;
    [tmpx tmpf] = goldSearch(f_, i, i+ interval);
    tmpf = f(tmpx);
    if(tmpf > fMax)
        fMax = f(tmpx);
        xMax = tmpx;
    end
end
fprintf('From the Golden Search Method,\n');
fprintf('When x = %.6f, has the local minimum = %.6f\n', xMin, fMin);
fprintf('When x = %.6f, has the local maximum = %.6f\n', xMax, fMax);
figure (1); plot(xMin, fMin, 'r*'); title('Golden Search Method - min');
figure (2); plot(xMax, fMax, 'r*'); title('Golden Search Method - MAX');

% Fibonacci method
figure (3); hold on; plot(x, f(x), 'g');
[xMin fMin] = fibSearch(f, l_bound, r_bound);
figure (4); hold on; plot(x, f(x), 'g');
[xMax fMax] = fibSearch(f_, l_bound, r_bound);
fMax = f(xMax);

interval = 2.5;
for i=l_bound:interval:r_bound-1
    figure (3);
    clear tmpx; clear tmpf;
    [tmpx tmpf] = fibSearch(f, i, i+interval);
    if(tmpf < fMin && abs(f(tmpx) - tmpf) < 10^(-7))
        fMin = tmpf;
        xMin = tmpx;
    end
    
    figure (4);
    clear tmpx; clear tmpf;
    [tmpx tmpf] = fibSearch(f_, i, i+interval);
    tmpf = f(tmpx);
    if(tmpf > fMax && abs(f(tmpx) - tmpf) < 10^(-7))
        fMax = tmpf;
        xMax = tmpx;
    end
end
fprintf('From the Fibonacci Method,\n');
fprintf('When x = %.6f, has the local minimum = %.6f\n', xMin, fMin);
fprintf('When x = %.6f, has the local maximum = %.6f\n', xMax, fMax);
figure (3); plot(xMin, fMin, 'r*'); title('Fibonacci Method - min');
figure (4); plot(xMax, fMax, 'r*'); title('Fibonacci Method - MAX');