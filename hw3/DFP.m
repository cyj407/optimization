function A = DFP(F,f,px,py,degree)
% handle the linear regression or quadratic regression
    eps = 10^(-6);
    X = zeros(degree, 1);
    B = eye(degree);        % initial B as identity matrix
    
    GradientF = gradient(F);
    i = 1;
    
    a = X(1);
    b = X(2);
    if(degree == 3)
        c = X(3);
    end
    while(norm(subs(GradientF), 2) > eps)
        % step 1
        a = X(1);
        b = X(2);
        if(degree == 3)
            c = X(3);
        end
        
        S = (-1)*B*subs(GradientF);
        % step 2 , min f(x+lambda*s), and find lambda
        syms Lambda
        minf = f(X + Lambda*S);
        lambda = solve(diff(minf)==0, Lambda);
        Xnext = vpa(X + lambda*S);
        
        a = X(1);
        b = X(2);
        if(degree == 3)
            c = X(3);
        end
        if(norm(subs(GradientF), 2) < eps)
            break;
        end
        
        % step 3
        a = Xnext(1);
        b = Xnext(2);
        if(degree == 3)
            c = Xnext(3);
        end
        GradF_next = subs(GradientF);
        a = X(1);
        b = X(2);
        if(degree == 3)
            c = X(3);
        end
        GradF_i = subs(GradientF);
        
        g = GradF_next - GradF_i;
        M = lambda.*S.*transpose(S)/(transpose(S)*g);
        N = -(B*g)*transpose(B*g)/(transpose(g)*B*g);
        B = B + M + N;
        X = Xnext;
        
        % step 4
        i = i + 1;
    end
    
    A = X;

end