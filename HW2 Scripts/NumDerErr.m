err1 = NumDerErr(0.2);
err2 = NumDerErr(0.2/2);
err3 = NumDerErr(0.02);
err4 = NumDerErr(0.02/2);
err5 = NumDerErr(0.002);
err6 = NumDerErr(0.002/2);
err7 = NumDerErr(0.0002);
err8 = NumDerErr(0.0002/2);

format long
disp([err1, err2, err3, err4, err5,err6,err7,err8]);
disp([log2(err1/err2), log2(err3/err4), log2(err5/err6), log2(err7/err8)]);

function Err=NumDerErr(h)

%% Derivative approximation at x = 1
x = 1;

%% Numerical derivative
Num_der = (-3*exp(x)+4*exp(x+h)-exp(x+2*h))/h/2;

%% Real derivative 
Real_der = exp(x);

%% Error 
Err = abs(Num_der-Real_der);

end 
