n_v = [4 8 16 32 64 128];
v_out = zeros(1,length(n_v));
for i = 1:length(n_v)
    n = 4;
    v_out(i) = Simpson(@funItg, 0, 1, n)
end

v_e = zeros(1, length(n_v));
for i = 1:length(n_v)
    v_e(i) = abs((1-exp(-4/5)) - v_out(i));
end

plot(n_v,v_e);
title('Simpson Error vs n in loglog');
xlabel('n');
ylabel('error')

function v = Simpson(f,a,b,n)
    h = (b - a)/2/n;
    xodd = (a+h):(2*h):(b-h);
    xeven = (a+(2*h)):(2*h):(b-(2*h));
    v = (h/3) * (f(a) + (4 * sum(f(xodd))) + (2 * sum(f(xeven))) + f(b));
end

function y = funItg(x)
    y = 1/((2*x)+1);
end