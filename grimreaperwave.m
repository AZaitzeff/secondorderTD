function [x,y]=grimreaperwave(N,T,short)
N=2*N+1;
h=pi/(N-1);
if short
    x=0:h:pi;
else
    x=-pi/2:h:pi;
end
y = asinh(exp(-T)*cos(x));
