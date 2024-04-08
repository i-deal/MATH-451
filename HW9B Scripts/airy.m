[t1, y1, dy1] = airy_rk4(@f_airy, [-4.5, 0], 0.355028053887817, 0.258819403792807, 0.01);
[t2, y2, dy2] = airy_rk4(@f_airy, [0, 4.5], y1(end), dy1(end), 0.01);

t = [t1, t2(2:end)];
y = [y1, y2(2:end)];
dy = [dy1, dy2(2:end)];


plot(t, y, 'b', 'DisplayName', 'x(t)'); hold on;
plot(t, dy, 'r', 'DisplayName', 'dx/dt(t)')
title('Numerical solutions of x(t), dx/dt(t)');
xlabel('t');
ylabel('x(t), dx/dt');
legend();


function [t, y, dy] = airy_rk4(f, tspan, y0, dy0, h)
    t = tspan(1):h:tspan(2);
    y = zeros(1, length(t));
    dy = zeros(1, length(t));
    y(1) = y0;
    dy(1) = dy0;
    for i = 1:(length(t) - 1)
        k1 = h * dy(i);
        l1 = h * f(t(i), y(i), dy(i));
        k2 = h * (dy(i) + 0.5 * l1);
        l2 = h * f(t(i) + 0.5 * h, y(i) + 0.5 * k1, dy(i) + 0.5 * l1);
        k3 = h * (dy(i) + 0.5 * l2);
        l3 = h * f(t(i) + 0.5 * h, y(i) + 0.5 * k2, dy(i) + 0.5 * l2);
        k4 = h * (dy(i) + l3);
        l4 = h * f(t(i) + h, y(i) + k3, dy(i) + l3);
        y(i + 1) = y(i) + (k1 + 2 * k2 + 2 * k3 + k4) / 6;
        dy(i + 1) = dy(i) + (l1 + 2 * l2 + 2 * l3 + l4) / 6;
    end
end

function v = f_airy(t,y,dy)
    v = t*y;
end