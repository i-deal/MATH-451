a1 = 1.0;
a2 = 0.5;
tol = abs(a2-a1);
iter = 0;

while tol > 10^(-9) && iter < 5
    [x,ya2] = ode45(@vdpt,[1 2], [0,a2]);
    [x,ya1] = ode45(@vdpt,[1,2],[0,a1]);
    
    y2 = ya2(end,1);
    y1 = ya1(end,1);
    
    alpha = a2 - ((a2-a1)*(y2- log(2))/(y2-y1));
    a1 = a2;
    a2 = alpha;
    
    tol = abs(a2-a1);
    iter = iter + 1;
end

[x,ya1] = ode45(@vdpt,[1,2],[0,alpha]);
y = ya1(:,1);
figure;
plot(x, y, 'b-', 'LineWidth', 2);
hold on;
plot(x, log(x), 'r--', 'LineWidth', 2);
legend('Shooting Method Solution', 'Exact Solution');
xlabel('x');
ylabel('y');
title('Solutions');

% Calculate and plot the error
error = abs(y - log(x));
figure;
plot(x, error);
xlabel('x');
ylabel('Error');
title('Error');

function dydt = vdpt(x,y)
dydt = [y(2);-(y(2))^2 - y(1) + log(x)];
end