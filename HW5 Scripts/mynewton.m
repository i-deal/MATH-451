x = mynewton(@f, @df, 1.1, 1e-12, 10);
%fprintf('sqrt(2) = %x',x);
fprintf('root of e^(-x) - cos(x) = %x',x);

function x = mynewton(f,df,x0,tol,nmax)
    delta = f(x0)/df(x0);
    x1 = x0 - delta;
    xk = x0; xk1 = x1;
    i = 0;

    while abs(xk - xk1) > tol && i < nmax
        xk = xk1;
        delta = f(xk)/df(xk);
        xk1 = xk - delta;
        i = i + 1;
    end

    x = xk1;
end

function y = f(x)
    %y = x^2 - 2;
    y = exp(-x) - cos(x);
end

function y = df(x)
    %y = 2*x;
    y = -exp(-x) + sin(x);
end