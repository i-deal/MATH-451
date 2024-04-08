%b
for N=[200,150,120,100]
    [t,xn] = rk4(@f_b, 0, 0, 3, N);
    plot(t,xn, 'DisplayName', ['N =',num2str(N)]); hold on;
end
legend();


function [t,x] = rk4(f, t0,x0, tend, N)
h = (tend-t0)/N;
t = t0:h:tend;
s = length(x0); % x0 can be a vector
x = zeros(s, N+1);
x(:,1) = x0;

for n = 1:N
    k1 = feval(f, t(n), x(:,n));
    k2 = feval(f, t(n)+(0.5*h), x(:,n)+0.5*h*k1);
    k3 = feval(f, t(n)+(0.5*h), x(:,n)+0.5*h*k2);
    k4 = feval(f, t(n)+h, x(:,n)+h*k3);
    x(:,n+1) = x(:,n) + (h/6)*(k1+2*(k2+k3)+k4);
end
end

function xp = f_a(t,x)
    xp = (10*x) + (11*t) - (5*t^2) -1;
end

function xp = f_b(t,x)
    xp = 100*(sin(t)-x);
end