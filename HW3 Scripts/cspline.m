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
