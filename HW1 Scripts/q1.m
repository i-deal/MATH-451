%A = cat(3,[1 1; 2 2; 3 3],[5 5; 7 7;9 9]);

myfunc(3,4)

function y=myfunc(x,t)

    y= sqrt(3*x+1)/(1+x*t);

end