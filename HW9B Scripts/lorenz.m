init = [0 1 0];
span = [0 80];
[t, A] = ode45(@lorenz,span,init);
X = A(:,1); Y = A(:,2); Z = A(:,3); 

%3d curve
figure
plot3(X,Y,Z); title('3D curve of Lorenz System');
xlabel('X'); ylabel('Y'); zlabel('Z')

% X
figure
subplot(1,1,1)
plot(t,X);
ylabel('X');
xlabel('t');
title('X vs t');

% Y
figure
subplot(1,1,1)
plot(t,Y);
ylabel('Y');
xlabel('t');
title('Y vs t');

% Z
figure
subplot(1,1,1)
plot(t,Z);
ylabel('Z');
xlabel('t');
title('Z vs t');

% X v Y
figure
subplot(1,1,1)
plot(Y,X);
ylabel('X');
xlabel('Y');
title('X vs Y');

% X v Z
figure
subplot(1,1,1)
plot(Z,X);
ylabel('X');
xlabel('Z');
title('X vs Z');

% Y v Z
figure
subplot(1,1,1)
plot(Z,Y);
ylabel('Y');
xlabel('Z');
title('Y vs Z');


function v_out = lorenz(t,v)
    x = v(1); y = v(2); z = v(3);
    sigma = 10; b = 8/3; r = 28;
    v_out = [sigma*(y-x);
    r*x - y - x*z;
    x*y - b*z ];
end