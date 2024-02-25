n=6;
t = zeros(1,n);
a = 0; b = pi;
R = romberg(@f, a, b, n);

for i = 1:n
    t(1,i) = integral(@f, a, b, 'AbsTol', 1e-9);
end

disp('f(x) = sin(x) on 0, pi, and n = 6:')
disp('Romberg table of f:');
disp(R);
disp('Integral of f computed by quad:');
disp(t(1));
e = abs(diag(R)' - t);
disp('Diagonal Error:');
disp(e);

function R = romberg(f,a,b,n)
    R = zeros(n,n);
    h = b - a;
    R(1,1) = (f(a) + f(b)) * (h/2);
    for i = 1:n-1
        R(i+1,1)=R(i,1) * (1/2);
        h = h/2;
        for k = 1:(2^(i-1))
            R(i+1,1) = R(i+1,1) + h * f(a + ((2*k)-1)*h);
        end
    end
    for j=2:n
        for i = j:n
            R(i,j) = R(i,j-1) + (1/((4^(j-1)-1)) * R(i,j-1)) - (1/((4^(j-1)-1)) * R(i-1,j-1));
        end
    end
end

function y = f(x)
    y = sin(x);
end