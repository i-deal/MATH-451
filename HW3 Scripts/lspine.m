x = 1.2:0.01:2.2;
t = [1.2 1.5 1.6 2.0 2.2];
y = [0.4275 1.139 0.8736 -0.9751 -0.1536];

L = lspine(t,y,x);

plot(x,L);
title('Linear Spline');


function L = lspine(t,y,x)
    L = zeros(1,length(x));
    for i = 1:(length(t)-1)
        for k = 1:length(x)
            if t(i) <= x(k) && x(k) <= t(i+1)
                L(k) = y(i) + (((y(i+1) - y(i)) / (t(i+1) - t(i))) * (x(k)-t(i)));
            end
        end
    end
end