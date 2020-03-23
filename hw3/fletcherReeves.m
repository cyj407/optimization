function B = FletcherReeves(F,f,px,py,degree)
% handle the linear regression or quadratic regression
    j = 1;
    k = 1;
    n = degree+1;
    eps = 10^(-6);
    X = zeros(n,degree);        % X(1,:) = [0 0]
    GradientF = gradient(F);

    % step 1
    a = X(j,1);
    b = X(j,2);
    if(degree == 3)
        c = X(j,3);
    end

    % step 2
    S = (-1)* subs(GradientF);

    % step 3
    while(norm(S,2) > eps)
        % min f(x+lambda*s), and find lambda
        syms Lambda
        minf = f(X(j,:)+ Lambda*S.');
        lambda = solve(diff(minf)==0, Lambda);
        X(j+1, :) = X(j, :) + lambda*S.';

        if(j < n)       % step 4
            % calculate beta
            a = X(j+1,1);
            b = X(j+1,2);
            if(degree == 3)
                c = X(j+1,3);
            end
            GradF_next = subs(GradientF);
            
            a = X(j,1);
            b = X(j,2);
            if(degree == 3)
                c = X(j,3);
            end
            GradF_j = subs(GradientF);

            beta = transpose(GradF_next)*GradF_next/(transpose(GradF_j)*GradF_j);

            a = X(j+1, 1);
            b = X(j+1, 2);
            if(degree == 3)
                c = X(j+1,3);
            end
            S = (-1)*subs(GradientF) + beta*S;
            j = j + 1;
        else    % step 5
            j = 1;
            k = k + 1;
            X(j,:) = X(n+1, :);
            a = X(j,1);
            b = X(j,2);
            if(degree == 3)
                c = X(j,3);
            end
            S = (-1)* subs(GradientF);
        end    
    end
    
    B = X(j, :);

end

