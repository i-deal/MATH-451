n=2;
t = zeros(1,n);
R = romberg(@f, -1, 1, n);
disp(R(n,n));

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
    y = 3*x^2;
end