% given three cases:
ci = 0.2:0.2:1; ci =ci';
cii = 0.1:0.1:1; cii =cii';
ciii = 0.05:0.05:1; ciii =ciii';

% A for each case:
Ai = vander(ci);
Aii = vander(cii);
Aiii = vander(ciii);

% solutions for each case:
xsoli = ones(length(ci'),1);
xsolii = ones(length(cii'),1);
xsoliii = ones(length(ciii'),1);

% b for each case:
bi = Ai * xsoli;
bii = Aii * xsolii;
biii = Aiii * xsoliii;

% output x for each case:
disp('i)');
xia = naiv_gauss(Ai,bi);
xib = Ai\bi;
disp('naive:');
disp(xia);
disp('with pivoting:');
disp(xib);

disp('ii)');
xiia = naiv_gauss(Aii,bii);
xiib = Aii\bii;
disp('naive:');
disp(xiia);
disp('with pivoting:');
disp(xiib);


disp('iii)');
xiiia = naiv_gauss(Aiii,biii);
xiiib = Aiii\biii;
disp('naive:');
disp(xiiia);
disp('with pivoting:');
disp(xiiib);


function x = naiv_gauss(A,b)
n = length(b);
x = zeros(n,1);
for k=1:n-1
for i=k+1:n
xmult = A(i,k)/A(k,k);
A(i,k) = xmult;
for j=k+1:n
A(i,j) = A(i,j)-xmult*A(k,j);
end
b(i) = b(i)-xmult*b(k);
end
end
x(n) = b(n)/A(n,n);
for i=n-1:-1:1
sum = b(i);
for j=i+1:n
sum = sum-A(i,j)*x(j);
end
x(i) = sum/A(i,i);
end
end
