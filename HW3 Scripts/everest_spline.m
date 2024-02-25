% interpolated data points:
t = [6 9 28 95 129 166 187 199 254 315 347 366 396 423 447 476 504 537 563 586 593 602 613 627 631 655 675 684 694 710 726 735];
y = [11 47 74 132 155 183 207 212 252 301 320 330 331 324 312 293 257 216 211 127 101 117 126 114 134 149 157 116 99 68 31 11];

z = cspline(t,y);

x = 0:0.1:740;

S = cspline_eval(t,y,z,x);
plot(x,S);
title('Everest Natural Cubic Spline')

function z = cspline(t,y)
% function z = cspline(t,y)
% compute z-coefficients for natural cubic spline
% where t is a vector with knots, and y is the interpolating values
% z is the output vector

n = length(t);
z = zeros(n,1);
h = zeros(n-1,1);
b = zeros(n-1,1);
u = zeros(n,1);
v = zeros(n,1);

h = t(2:n)-t(1:n-1);
b = (y(2:n)-y(1:n-1))./h;

u(2) = 2*(h(1)+h(2));
v(2) = 6*(b(2)-b(1));
for i=3:n-1  % solve the tri-diag system
  u(i) = 2*(h(i)+h(i-1))-h(i-1)^2/u(i-1);
  v(i) = 6*(b(i)-b(i-1))-h(i-1)*v(i-1)/u(i-1);
end

for i=n-1:-1:2
  z(i) = (v(i)-h(i)*z(i+1))/u(i);
end
end

function S = cspline_eval(t,y,z,x_vec)
% function S = cspline_eval(t,y,z,x_vec)
% compute the value of the natural cubic spline at the points x_vec when
% t,y,z are given
%
% Example:   t = [0.9,1.3,1.9,2.1];
%            y = [1.3,1.5,1.85,2.1]
%            z = cspline(t,y)
%            x = [0.9:0.1:2.1]
%            v = cspline_eval(t,y,z,x)

m = length(x_vec);
S = zeros(size(x_vec));  
n = length(t);
for j=1:m
  x = x_vec(j);
  for i=n-1:-1:1
    if (x-t(i)) >= 0
      break
    end
  end
  h = t(i+1)-t(i);
  S(j) = z(i+1)/(6*h)*(x-t(i))^3-z(i)/(6*h)*(x-t(i+1))^3 ...
       +(y(i+1)/h-z(i+1)*h/6)*(x-t(i)) - (y(i)/h-z(i)*h/6)*(x-t(i+1));
end
end