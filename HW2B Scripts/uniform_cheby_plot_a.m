% the plotting of question 2.10 part a.

x6 = -1:1/3:1;
y6 = abs(x6);

x12 = -1:1/6:1;
y12 = abs(x12);

x18 = -1:1/9:1;
y18 = abs(x18);

x24 = -1:1/12:1;
y24 = abs(x24);

x30 = -1:1/15:1;
y30 = abs(x30);

x36 = -1:1/18:1;
y36 = abs(x36);

t = -1:0.001:1;
f = abs(t);

%plot f(x)
subplot(3,4,1);
plot(t,f, 'DisplayName', 'f(x)');
title('f(x) plot');
xlabel('x');
ylabel('y');
legend;

A6 = divdiff(x6,y6);
A12 = divdiff(x12,y12);
A18 = divdiff(x18,y18);
A24 = divdiff(x24,y24);
A30 = divdiff(x30,y30);
A36 = divdiff(x36,y36);

v6 = polyvalue(diag(A6),x6,t);
v12 = polyvalue(diag(A12),x12,t);
v18 = polyvalue(diag(A18),x18,t);
v24 = polyvalue(diag(A24),x24,t);
v30 = polyvalue(diag(A30),x30,t);
v36 = polyvalue(diag(A36),x36,t);

%plot p(x)

subplot(3,4,2);
plot(t,v6,'DisplayName', 'p(x) with n=6');
hold on;
plot(t,v12,'DisplayName', 'p(x) with n=12');
title('p(x) plot for n=6,12');
xlabel('x');
ylabel('y');
legend;

subplot(3,4,3);
plot(t,v18,'DisplayName', 'p(x) with n=18');
hold on;
plot(t,v24,'DisplayName', 'p(x) with n=24');
title('p(x) plot for n=18,24');
xlabel('x');
ylabel('y');
legend;

subplot(3,4,4);
plot(t,v30,'DisplayName', 'p(x) with n=30');
hold on;
plot(t,v36,'DisplayName', 'p(x) with n=30');
title('p(x) plot for n=30,36');
xlabel('x');
ylabel('y');
legend;

%plot e(x)

subplot(3,4,5);
loglog(t,abs(f-v6), 'DisplayName', 'e(x) of n=6');
title('e(x) plot for n=6 in loglog');
xlabel('x');
ylabel('y');
legend;

subplot(3,4,6);
loglog(t,abs(f-v12), 'DisplayName', 'e(x) of n=12');
title('e(x) plot for n=12 in loglog');
xlabel('x');
ylabel('y');
legend;

subplot(3,4,7);
loglog(t,abs(f-v18), 'DisplayName', 'e(x) of n=18');
title('e(x) plot for n=18 in loglog');
xlabel('x');
ylabel('y');
legend;

subplot(3,4,8);
loglog(t,abs(f-v24), 'DisplayName', 'e(x) of n=24');
title('e(x) plot for n=24 in loglog');
xlabel('x');
ylabel('y');
legend;


subplot(3,4,9);
loglog(t,abs(f-v30), 'DisplayName', 'e(x) of n=30');
title('e(x) plot for n=30 in loglog');
xlabel('x');
ylabel('y');
legend;

subplot(3,4,10);
loglog(t,abs(f-v36), 'DisplayName', 'e(x) of n=36');
title('e(x) plot for n=36 in loglog');
xlabel('x');
ylabel('y');
legend;

sgtitle('P(x) Computed with Evenly Spaced Nodes:')

% calculate and display max errors:
e6 = max(abs(f-v6));
e12 = max(abs(f-v12));
e18 = max(abs(f-v18));
e24 = max(abs(f-v24));
e30 = max(abs(f-v30));
e36 = max(abs(f-v36));

disp('Max errors for P(x) computed with evenly spaced nodes:')
disp(['Max error for n=6: ' num2str(e6)]);
disp(['Max error for n=12: ' num2str(e12)]);
disp(['Max error for n=18: ' num2str(e18)]);
disp(['Max error for n=24: ' num2str(e24)]);
disp(['Max error for n=30: ' num2str(e30)]);
disp(['Max error for n=36: ' num2str(e36)]);

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