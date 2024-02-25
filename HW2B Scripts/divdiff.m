%x = [0; 1; 2/3; 1/3];
%y = [1; 0; 1/2; 0.866];
x = [0; 1; 2];
y = [-5; -1; 9];

A = divdiff(x,y);
disp(A);
format short;

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