% the plotting of question 2.9 part b.

x = zeros(1,21);
y = zeros(1,21);

i = 1;
a = -5;
while i <= 21 % evenly spaced nodes
    x(i) = a;
    y(i) = (a^2 + 1)^(-1);
    i = i + 1;
    a = a + 0.5;
end

t = -5:0.025:5;
f = (t.^2 + 1).^(-1);

subplot(1,3,1);
plot(t,f, 'DisplayName', 'f(x)');
title('f(x) plot');
xlabel('x');
ylabel('y');
legend;


A = divdiff(x,y);
v = polyvalue(diag(A),x,t);

subplot(1,3,2);
plot(t,v,'DisplayName', 'p(x)');
title('p(x) plot');
xlabel('x');
ylabel('y');
legend;

subplot(1,3,3);
plot(t,abs(f-v), 'DisplayName', 'e(x)');
title('e(x) plot');
xlabel('x');
ylabel('y');
legend;

sgtitle('P(x) Computed with Equally Spaced Nodes:')

function v = polyvalue(a,x,t)
    n = length(x);
    v = zeros(1, length(t));
    for j = 1:1:length(t)
        p = a(n);
        for k = n-1:-1:1
            p = p * (t(j)-x(k)) + a(k);
        end
        v(j) = p;
    end
end

function A = divdiff(x,y)
    n = length(x);    
    A = zeros(n,n);
    A(1,:) = y;
    for k = 2:1:n % collumn idx
        for i = k:1:n % row idx
            A(k,i) = (A(k-1,i) - A(k-1,i-1)) / (x(i) - x(i-(k-1)));
        end
    end
    A = A';
end