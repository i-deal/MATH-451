A = [12.2 1.2 2.4; 2 3 4; 2.5 6.2 3.4];

sum = matrix_summation(A); % sum = 36.9000
disp('sum of elements in A:');
disp(sum);

function sum = matrix_summation(A)
    i = 1;
    sum = 0;
    while i <= length(A(1,:)) % iterate through rows of A
        j = 1;
        while j <= length(A(:,1)) % iterate through elements of row
            sum = sum + A(i,j); % sum elements
            j = j + 1;
        end
        i = i + 1;
    end
end