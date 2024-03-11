for n = 7:2:11    
    d = ones(n,1) * 4;
    a = ones(n,1);
    
    A = zeros(n, n);
    for i = 1:n
        A(i, n - i + 1) = a(n - i + 1, 1);
        A(i, i) = d(i, 1);
    end
    
    b = ones(n,1) * 5; z = ceil(n/2); b(z,1) = 4;
    
    xout = GaussianX(n,d,a,b);
    disp('n:')
    disp(n);
    disp('solution:')
    disp(xout);
end

function x = GaussianX(n,d,a,b)
    x = zeros(1,n);
    % Creating A matrix
    A = zeros(n, n);

    for i = 1:n
        A(i, n - i + 1) = a(n - i + 1, 1);
        A(i, i) = d(i, 1);
    end

    % forward elim
    for r = 1:1:n - 1
        for i = r + 1:n
            z = A(i, r) / A(r, r);
            for j = r:n
                A(i, j) = A(i, j) - z * A(r, j);
            end
            b(i) = b(i) - z * b(r);
        end
    end

    % backward sub
    x(n) = b(n) / A(n, n);

    for r = n - 1:-1:1
        z = b(r);
        for j = r + 1:n
            z = z - A(r, j) * x(j);
        end
        x(r) = z / A(r, r);
    end

    x = x';
end