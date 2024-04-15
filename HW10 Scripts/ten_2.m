% Define the ODE as a function
ode = @(x, u) [u(2); 6*x^3 - 6 * u(1)];

x0 = 0;
y0 = 0;
x1 = 1;
y1_target = 0;

tolerance = 1e-6;

dy0_lower = -10;
dy0_upper = 10;
dy0_guess = (dy0_lower + dy0_upper) / 2;

while true
    [x, y] = ode45(ode, [x0, x1], [y0, dy0_guess]);
    
    y_final = y(end, 1);
    
    if abs(y_final - y1_target) < tolerance
        break;
    elseif y_final < y1_target
        dy0_lower = dy0_guess;
    else
        dy0_upper = dy0_guess;
    end
    
    dy0_guess = (dy0_lower + dy0_upper) / 2;
end

exact_solution = x.^3-x;

figure;
plot(x, y(:, 1), 'b-', 'LineWidth', 2);
hold on;
plot(x, exact_solution, 'r--', 'LineWidth', 2);
legend('Shooting Method Solution', 'Exact Solution');
xlabel('x');
ylabel('y');
title('Solutions');

% Calculate and plot the error
error = abs(y(:, 1) - exact_solution);
figure;
plot(x, error);
xlabel('x');
ylabel('Error');
title('Error');