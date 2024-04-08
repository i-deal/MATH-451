span = [0, 2];
init = [0.994; 0; 0; -2.0015851063790825];

[t, v] = forwardEuler(@f, span, init);

plot(t, v(1,:), t, v(2,:));
xlabel('t');
title('Solution using Forward Euler Method');

function [t, v] = forwardEuler(f, tspan, v0)
    N = 24000; % Number of steps
    h = (tspan(2) - tspan(1)) / N;
    t = linspace(tspan(1), tspan(2), N+1);
    v = zeros(length(v0), N+1);
    v(:,1) = v0; 
    
    for i = 1:N
        v(:,i+1) = v(:,i) + h * f(t(i), v(:,i));
    end
end

function vout = f(t,v)
    u_1 = v(1); x_1 = v(2); u_2 = v(3); x_2 = v(4);
    mu = 0.012277471; vu = 1-mu;
    dE = sqrt((u_1+mu)^2+u_2^2); dM = sqrt((u_1-vu)^2+u_2^2);
    vout = [x_1; x_2; u_1 + 2*x_2-vu*((u_1-vu)/(dE^3)) - mu*((u_1-vu)/(dM^3)); u_2 + 2*x_1-vu*((u_2)/(dE^3))- mu*((u_2)/(dM^3))];
end


