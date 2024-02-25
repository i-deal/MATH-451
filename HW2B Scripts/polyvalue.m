x = [0; 1; 2/3; 1/3];
y = [1; 0; 1/2; 0.866];

A = divdiff(x,y);
disp(A);
v = polyvalue(diag(A),x,x);
disp(v);

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