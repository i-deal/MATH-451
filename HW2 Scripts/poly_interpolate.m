X = [1 0 0 0; 1 5 25 125; 1 10 100 1000; 1 15 225 3375]; % linear system of equations given in (3)
y = [3; 8; -2; 9];

a = X\y

x = [0; 5; 10; 15]; % initial x values for interpolating points

plot(x,y, '*'); grid;
hold on;
title('Interpolating Points and Polynomial');
xlabel('x');
ylabel('y');

t = -1:0.01:18;
p2 = a(4)*(t.^3)+a(3)*(t.^2)+a(2)*(t)+a(1); % plot interpolating polynomial
plot(t,p2);