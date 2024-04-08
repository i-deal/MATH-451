span = [0, 2];
init = [0.994; 0; 0; -2.0015851063790825];

[t, v] = RK4_2(@f, span, init);

plot(t, v(1,:), t, v(2,:));
xlabel('t');
title('Solution using RK4');
disp(length(t));

function [t, v] = RK4_2(f, tspan, v0)
    N = 6000; % Number of steps
    h = (tspan(2) - tspan(1)) / N;
    t = linspace(tspan(1), tspan(2), N+1); 
    v = zeros(length(v0), N+1);
    v(:,1) = v0;

    for i = 1:N
        k1 = h * f(t(i), v(:,i));
        k2 = h * f(t(i) + h/2, v(:,i) + k1/2);
        k3 = h * f(t(i) + h/2, v(:,i) + k2/2);
        k4 = h * f(t(i) + h, v(:,i) + k3);
        v(:,i+1) = v(:,i) + (k1 + 2*k2 + 2*k3 + k4) / 6;
    end
end

function vout = f(t,v)
    u_1 = v(1); x_1 = v(2); u_2 = v(3); x_2 = v(4);
    mu = 0.012277471; vu = 1-mu;
    dE = sqrt((u_1+mu)^2+u_2^2); dM = sqrt((u_1-vu)^2+u_2^2);
    vout = [x_1; x_2; u_1 + 2*x_2-vu*((u_1-vu)/(dE^3)) - mu*((u_1-vu)/(dM^3)); u_2 + 2*x_1-vu*((u_2)/(dE^3))- mu*((u_2)/(dM^3))];
end