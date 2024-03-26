x = 0:0.1:1;
y = [0.7829 0.8052 0.5753 0.5201 0.3783 0.2923 0.1695 0.0842 0.0415 0.009 0];

n = [1 2 4 8];
for i=1:1:4
    [p,S] = polyfit(x, y, n(i));

    x1 = linspace(0,1);
    y1 = polyval(p,x1);
    plot(x1, y1); hold on;
end

title('Least Square Poly Fit')
plot(x,y,'o'); legend('n=1', 'n=2', 'n=4', 'n=8', 'data')