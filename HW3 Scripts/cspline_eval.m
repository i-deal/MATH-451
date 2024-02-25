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
