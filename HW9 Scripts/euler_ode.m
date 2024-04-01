A = @(t) [0 1 0; 0 0 1; t 0 -2];
X0 = [1; 2; 3];
h = 0.1;
n_steps = 10;
X = zeros(3, n_steps + 1);
X(:, 1) = X0;

% 10 steps
for n = 1:n_steps
    t = (n - 1) * h;
    X(:, n + 1) = X(:, n) + h * A(t) * X(:, n);
end

disp('x_10 computed using euler method:')
disp(X(1,11));