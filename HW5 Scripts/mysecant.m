x = mynewton(@f, 1.1, 1.2, 1e-12, 10);
%fprintf('sqrt(2) = %x',x);
fprintf('root of e^(-x) - cos(x) = %x',x);

function x = mynewton(f,x0,x1,tol,nmax)
       xk=x0; xk1=x1;
       i = 0;
    while abs(xk - xk1) > tol && i < nmax
        delta = (xk1-xk)/(f(xk1)-f(xk));
        xk1 = xk - delta * f(xk);
        disp(xk1);
        i = i + 1;
    end

    x = xk1;
end

function y = f(x)
    %y = x^2 - 2;
    y = exp(-x) - cos(x);
end