a = sqrt(2)/2;
A = sparse([1 1 1 2 2 2 3 3 4 5 5 6 7 7 7 7 8 8 8 8 9 9 9 9 10 10 10 10 11 11 12 13 13 14 14 15 15 15 16 16 17 17],[1 4 5 1 3 5 2 6 3 4 8 7 5 6 9 10 5 7 9 10 8 9 12 13 9 11 12 13 10 14 11 12 16 15 16 14 13 17 13 15 17 16],[-a 1 1 -1 1 -1 1 1 -1 -1 1 -1 -a -1 a 1 a 1 a 1 -1 -a 1 a -a -a 1 -a -1 1 1 -1 a -1 -a -1 -a 1 a 1 -1 -a],17,17);

disp('a)');
b = [0 0 0 10 0 0 0 15 0 0 0 0 0 0 0 10 0];
x = A\b';
disp(x);

disp('b)');
b = [0 0 0 15 0 0 0 0 0 0 0 0 0 0 0 10 0];
x = A\b';
disp(x);

disp('c)');
b = [0 0 0 10 0 0 0 0 0 0 0 20 0 0 0 0 0];
x = A\b';
disp(x);

disp('d)');
b = [0 0 0 0 0 0 0 10 0 0 0 10 0 0 0 0 0];
x = A\b';
disp(x);

