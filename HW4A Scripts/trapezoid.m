n_v = [4 8 16 32 64 128];
v_out = zeros(1,length(n_v));
for i = 1:length(n_v)
    n = 4;
    v_out(i) = trapezoid(@funItg, 0, 1, n)
end

v_e = zeros(1, length(n_v));
for i = 1:length(n_v)
    v_e(i) = abs(1-exp(-4/5)) - v_out(i);
end

%loglog(n_v,v_e);
%title('Trapezoid Error vs n in loglog');
%%xlabel('n');
%ylabel('error')

function v = trapezoid(f,a,b,n)
    h = (b-a)/n;
    x = a:h:b;
    v_sum = 0;
    for i = 2:1:(n-1)
        v_sum = v_sum + f(x(i));
    end
    v = h * ((1/2) * f(a) + v_sum + (1/2) * f(b));
end

function y = funItg(x)
    y = 3/(x+2);
end