n = 9;
main_diag = -2.011 * ones(n, 1); % Main diagonal
for i = 2:1:n
    main_diag(i,1) = main_diag(i,1) - 0.001 * (i-1);
end
upper_diag = ones(n, 1); % Upper diagonal
lower_diag = ones(n, 1); % Lower diagonal

A = spdiags([upper_diag, main_diag, lower_diag], [1, 0, -1], n, n);
A = full(A);

b = [-0.994974; 1.57407*10e-3; -8.96677 * 10e-4; -2.71137 * 10e-3; -4.07407 * 10e-3; -5.11719 * 10e-3; -5.92917 * 10e-3; 6.57065 * 10e-3; -0.507084];
x0 = [0.95; 0.9; 0.85; 0.8; 0.75; 0.7; 0.65; 0.6; 0.55];

d = 3;
tol = 10e-4;
nmax = 100;

wnit = zeros(9,1);
q = 1;
[x,nit]=jacobi(A,b,x0,w,d,tol,nmax);
disp(x);
disp(nit);

function [x,nit]=jacobi(A,b,x0,w,d,tol,nmax)
    % iteration for x0^(k+1)
    nit = 0;
    for k = 1:1:nmax
        xl = x0;
        for i = 1:1:length(x0)
            s1 = 0;
            for j = 1:1:i-1
                s1 = s1 + (A(i,j)*xl(j));
            end
            s2 = 0;
            for j = i+1:1:length(x0)
                s2 = s2 + (A(i,j)*x0(j));
            end
            S = s1+s2;
            x0(i) = (1/A(i,i)) * (b(i) - S);
        end
        
        nit = nit + 1;
        E = sum(abs(x0-xl)) / length(x0);
        if E <= tol
            x = x0;
            break;
        end
    end
    x = x0;
end