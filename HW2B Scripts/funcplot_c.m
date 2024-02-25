% the plotting of question 2.9 part c.

x1 = zeros(1,21);
y1 = zeros(1,21);
x2 = zeros(1,21);
y2 = zeros(1,21);

i = 1;
a = -5;
while i <= 21 
    a = 5*cos(((i-1)*pi)/20); %Chebyshev nodes type 1
    b = 5*cos(((2*(i-1)+1)*pi)/42); %Chebyshev nodes type 2
    x1(i) = a;
    y1(i) = (a^2 + 1)^(-1);
    x2(i) = b;
    y2(i) = (b^2 + 1)^(-1);
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


A1 = divdiff(x1,y1);
A2 = divdiff(x2,y2);
v1 = polyvalue(diag(A1),x1,t);
v2 = polyvalue(diag(A2),x2,t);

subplot(1,3,2);
plot(t,v1,'DisplayName', 'p(x) with Type 1 nodes');
hold on;
plot(t,v2,'DisplayName', 'p(x) with Type 2 nodes');
title('p(x) plot');
xlabel('x');
ylabel('y');
legend;

subplot(1,3,3);
plot(t,abs(f-v1), 'DisplayName', 'e(x) of Type 1 nodes');
hold on;
plot(t,abs(f-v2), 'DisplayName', 'e(x) of Type 2 nodes');
title('e(x) plot');
xlabel('x');
ylabel('y');
legend;
sgtitle('P(x) Computed with Chebyshev Nodes Type 1 and 2:')

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