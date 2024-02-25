[r1, r2] = smartquad_roots(2,6,-3);
disp(['calculated roots of 2x^2 + 6x - 3: ' num2str([r1, r2]) ]);

p = [2 6 -3];
w = roots(p); w1 = w(1); w2 = w(2);
disp(['actual roots of 3x^2 - 123454321x + 2: ' num2str([w1, w2]) ]);

[r1, r2] = smartquad_roots(1,-14,49);
disp(['calculated roots of x^2 - 14x + 49: ' num2str([r1, r2]) ]);

p = [1 -14 49];
w = roots(p); w1 = w(1); w2 = w(2);
disp(['actual roots of 3x^2 - 123454321x + 2: ' num2str([w1, w2]) ]);

[r1, r2] = smartquad_roots(3,-123454321,2);
disp(['calculated roots of 3x^2 - 123454321x + 2: ' num2str([r1, r2]) ]);

p = [3 -123454321 2];
w = roots(p); w1 = w(1); w2 = w(2);
disp(['actual roots of 3x^2 - 123454321x + 2: ' num2str([w1, w2]) ]);


function [r1, r2] = smartquad_roots(a, b, c)
    r1 = (-b + sqrt(b^2 - 4*a*c)) / (2*a); % calculate r1 using the quadratic formula
    r2 = c / (a * r1); % calculate r2 given r1 and the fact that r1 * r2 = c/a
end