r = bisection(@f, 0, 4, 1e-6, 3);
disp('a root of f(x) on [1,2]:')
disp(r);

function r = bisection(f,a,b,tol,nmax)
    if f(a) * f(b) <= 0
        c = 0.5 * (a + b);
        i = 0;

        while c ~= 0 && i < nmax && abs(f(c)) > tol && abs(a-b) > tol %% stop conditions
            if f(c) * f(a) < 0 % compute interval
                b = c;
            else
                a = c;
            end

            c = 0.5 * (a + b)
            i = i + 1;
        end
        r = c;
    else
        error('incorrect choice of a,b: f(a) * f(b) > 0')
    end
end

function y = f(x)
    %y = 9*(x^4) + 18 * (x^3) + 38 * (x^2) - 57 * x + 14;
    %y = tan(x) - x;
    %y = x^3 - 2*x+1 - x^2;
    y = exp(x)-9;
end