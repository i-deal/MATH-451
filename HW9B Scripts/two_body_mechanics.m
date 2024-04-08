init = [0.994 0 0 -2.0015851063790825];
span = [0 2];
[t, A] = ode45(@f,span,init);
X = A(:,1); Y = A(:,2); Z = A(:,3); E = A(:,4);

plot(t,X); hold on;
plot(t,Y); title('Orbits against time'); xlabel('t')

disp(length(t));

function vout = f(t,v)
    u_1 = v(1); x_1 = v(2); u_2 = v(3); x_2 = v(4);
    mu = 0.012277471; vu = 1-mu;
    dE = sqrt((u_1+mu)^2+u_2^2); dM = sqrt((u_1-vu)^2+u_2^2);
    vout = [x_1; x_2; u_1 + 2*x_2-vu*((u_1-vu)/(dE^3)) - mu*((u_1-vu)/(dM^3)); u_2 + 2*x_1-vu*((u_2)/(dE^3))- mu*((u_2)/(dM^3))];
end